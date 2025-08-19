import 'dart:async';
import 'package:flutter/material.dart';

import '../../data/models/product.dart';
import '../../core/isolates/isolate_manager.dart';

/// Service that provides parallel caching operations using isolates
class ParallelCacheService {
  final IsolatePool _isolatePool;
  final CacheStrategy _strategy;
  Timer? _backgroundRefreshTimer;
  bool _isDisposed = false;

  ParallelCacheService({
    int maxIsolates = 3,
    CacheStrategy strategy = const StaleWhileRevalidateStrategy(),
  }) : _isolatePool = IsolatePool(maxIsolates: maxIsolates),
       _strategy = strategy;

  /// Initialize the service
  Future<void> initialize() async {
    if (_isDisposed) return;
    
    // Start background refresh timer if strategy supports it
    if (_strategy.enableBackgroundRefresh) {
      _startBackgroundRefresh();
    }
  }

  /// Get products with stale-while-revalidate pattern
  Future<List<Product>> getProducts({bool forceRefresh = false}) async {
    if (_isDisposed) throw StateError('Service disposed');

    try {
      // Check if we have valid cache
      final hasValidCache = await _isolatePool.execute(
        (manager) => manager.hasValidCache(),
      );

      if (hasValidCache && !forceRefresh) {
        // Return cached data immediately
        final cachedProducts = await _isolatePool.execute(
          (manager) => manager.getCachedProducts(),
        );

        // Trigger background refresh if strategy allows
        if (_strategy.enableBackgroundRefresh && _shouldRefreshInBackground()) {
          _refreshInBackground();
        }

        return cachedProducts;
      }

      // Fetch fresh data
      return await _fetchAndCacheProducts();
    } catch (e) {
      // Fallback to cached data if available
      try {
        return await _isolatePool.execute(
          (manager) => manager.getCachedProducts(),
        );
      } catch (_) {
        rethrow;
      }
    }
  }

  /// Search products in cache
  Future<List<Product>> searchProducts(String query) async {
    if (_isDisposed) throw StateError('Service disposed');

    return await _isolatePool.execute(
      (manager) => manager.searchCachedProducts(query),
    );
  }

  /// Fetch products from API and cache them
  Future<List<Product>> _fetchAndCacheProducts() async {
    // Fetch from API in parallel
    final products = await _isolatePool.execute(
      (manager) => manager.fetchProducts(),
    );

    // Cache the products in parallel
    await _isolatePool.execute(
      (manager) => manager.cacheProducts(products),
    );

    return products;
  }

  /// Refresh cache in background
  void _refreshInBackground() {
    if (_isDisposed) return;

    // Don't await - run in background
    _fetchAndCacheProducts().catchError((error) {
      debugPrint('Background refresh failed: $error');
    });
  }

  /// Check if background refresh should be triggered
  bool _shouldRefreshInBackground() {
    // Simple logic - can be enhanced with more sophisticated rules
    return true;
  }

  /// Start background refresh timer
  void _startBackgroundRefresh() {
    _backgroundRefreshTimer = Timer.periodic(
      _strategy.backgroundRefreshInterval,
      (_) => _refreshInBackground(),
    );
  }

  /// Clear cache
  Future<void> clearCache() async {
    if (_isDisposed) throw StateError('Service disposed');

    await _isolatePool.execute(
      (manager) => manager.clearCache(),
    );
  }

  /// Warm up cache with initial data
  Future<void> warmUpCache() async {
    if (_isDisposed) throw StateError('Service disposed');

    try {
      await _fetchAndCacheProducts();
    } catch (e) {
      debugPrint('Cache warm-up failed: $e');
    }
  }

  /// Get cache statistics
  Future<CacheStats> getStats() async {
    if (_isDisposed) throw StateError('Service disposed');

    try {
      final hasValidCache = await _isolatePool.execute(
        (manager) => manager.hasValidCache(),
      );

      final cachedProducts = await _isolatePool.execute(
        (manager) => manager.getCachedProducts(),
      );

      final isolateStats = _isolatePool.stats;

      return CacheStats(
        hasValidCache: hasValidCache,
        cachedProductsCount: cachedProducts.length,
        isolateStats: isolateStats,
      );
    } catch (e) {
      return CacheStats(
        hasValidCache: false,
        cachedProductsCount: 0,
        isolateStats: _isolatePool.stats,
        error: e.toString(),
      );
    }
  }

  /// Dispose the service
  Future<void> dispose() async {
    if (_isDisposed) return;
    _isDisposed = true;

    _backgroundRefreshTimer?.cancel();
    _backgroundRefreshTimer = null;

    await _isolatePool.dispose();
  }

  /// Check if service is disposed
  bool get isDisposed => _isDisposed;
}

/// Cache strategy interface
abstract class CacheStrategy {
  /// Whether to enable background refresh
  bool get enableBackgroundRefresh;
  
  /// Interval for background refresh
  Duration get backgroundRefreshInterval;
  
  /// Cache validity duration
  Duration get cacheValidityDuration;
}

/// Stale-while-revalidate cache strategy
class StaleWhileRevalidateStrategy implements CacheStrategy {
  @override
  final bool enableBackgroundRefresh;
  
  @override
  final Duration backgroundRefreshInterval;
  
  @override
  final Duration cacheValidityDuration;

  const StaleWhileRevalidateStrategy({
    this.enableBackgroundRefresh = true,
    this.backgroundRefreshInterval = const Duration(minutes: 30),
    this.cacheValidityDuration = const Duration(hours: 24),
  });
}

/// Cache-first strategy
class CacheFirstStrategy implements CacheStrategy {
  @override
  final bool enableBackgroundRefresh;
  
  @override
  final Duration backgroundRefreshInterval;
  
  @override
  final Duration cacheValidityDuration;

  const CacheFirstStrategy({
    this.enableBackgroundRefresh = false,
    this.backgroundRefreshInterval = const Duration(hours: 1),
    this.cacheValidityDuration = const Duration(hours: 24),
  });
}

/// Network-first strategy
class NetworkFirstStrategy implements CacheStrategy {
  @override
  final bool enableBackgroundRefresh;
  
  @override
  final Duration backgroundRefreshInterval;
  
  @override
  final Duration cacheValidityDuration;

  const NetworkFirstStrategy({
    this.enableBackgroundRefresh = false,
    this.backgroundRefreshInterval = const Duration(minutes: 15),
    this.cacheValidityDuration = const Duration(hours: 1),
  });
}

/// Cache statistics
class CacheStats {
  final bool hasValidCache;
  final int cachedProductsCount;
  final Map<String, int> isolateStats;
  final String? error;

  const CacheStats({
    required this.hasValidCache,
    required this.cachedProductsCount,
    required this.isolateStats,
    this.error,
  });

  @override
  String toString() {
    return 'CacheStats('
        'hasValidCache: $hasValidCache, '
        'cachedProductsCount: $cachedProductsCount, '
        'isolateStats: $isolateStats'
        '${error != null ? ', error: $error' : ''}'
        ')';
  }
}

/// Batch processing service for large datasets
class BatchCacheService {
  final ParallelCacheService _cacheService;
  final int _batchSize;
  final int _maxConcurrency;

  BatchCacheService(
    this._cacheService, {
    int batchSize = 50,
    int maxConcurrency = 3,
  }) : _batchSize = batchSize,
       _maxConcurrency = maxConcurrency;

  /// Process products in batches
  Future<void> processBatches(
    List<Product> products,
    Future<void> Function(List<Product> batch) processor,
  ) async {
    final batches = <List<Product>>[];
    
    // Split into batches
    for (int i = 0; i < products.length; i += _batchSize) {
      final end = (i + _batchSize < products.length) ? i + _batchSize : products.length;
      batches.add(products.sublist(i, end));
    }

    // Process batches with limited concurrency
    final semaphore = Semaphore(_maxConcurrency);
    
    final futures = batches.map((batch) async {
      await semaphore.acquire();
      try {
        await processor(batch);
      } finally {
        semaphore.release();
      }
    });

    await Future.wait(futures);
  }

  /// Cache products in batches
  Future<void> cacheProductsBatch(List<Product> products) async {
    await processBatches(products, (batch) async {
      // This would use the isolate pool to cache each batch
      await _cacheService._isolatePool.execute(
        (manager) => manager.cacheProducts(batch),
      );
    });
  }
}

/// Simple semaphore for controlling concurrency
class Semaphore {
  final int maxCount;
  int _currentCount;
  final List<Completer<void>> _waitQueue = [];
  
  Semaphore(this.maxCount) : _currentCount = maxCount;
  
  Future<void> acquire() async {
    if (_currentCount > 0) {
      _currentCount--;
      return;
    }
    
    final completer = Completer<void>();
    _waitQueue.add(completer);
    return completer.future;
  }
  
  void release() {
    if (_waitQueue.isNotEmpty) {
      final completer = _waitQueue.removeAt(0);
      completer.complete();
    } else {
      _currentCount++;
    }
  }
}
