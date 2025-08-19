import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/models/product.dart';
import '../../core/error/failures.dart';
import '../../services/cache/parallel_cache_service.dart';
import 'product_repository.dart';

/// Enhanced product repository that uses parallel caching with isolates
class ParallelProductRepositoryImpl implements ProductRepository {
  final ParallelCacheService _cacheService;
  bool _isInitialized = false;

  ParallelProductRepositoryImpl({
    required ParallelCacheService cacheService,
  }) : _cacheService = cacheService;

  /// Initialize the repository
  Future<void> initialize() async {
    if (_isInitialized) return;
    
    await _cacheService.initialize();
    
    // Warm up cache in background
    _cacheService.warmUpCache();
    
    _isInitialized = true;
  }

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      await _ensureInitialized();
      
      final products = await _cacheService.getProducts();
      return Right(products);
    } catch (e) {
      return Left(_mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> searchProducts(String query) async {
    try {
      await _ensureInitialized();
      
      if (query.trim().isEmpty) {
        return getProducts();
      }
      
      final products = await _cacheService.searchProducts(query);
      return Right(products);
    } catch (e) {
      return Left(_mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, Product>> getProduct(int id) async {
    try {
      await _ensureInitialized();
      
      final products = await _cacheService.getProducts();
      
      try {
        final product = products.firstWhere(
          (product) => int.tryParse(product.productId) == id,
        );
        return Right(product);
      } catch (e) {
        return Left(NotFoundFailure());
      }
    } catch (e) {
      return Left(_mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getProductsByCategory(String category) async {
    try {
      await _ensureInitialized();
      
      final products = await _cacheService.getProducts();
      
      final filteredProducts = products
          .where((product) => product.merchantCategoryId == category)
          .toList();
      
      return Right(filteredProducts);
    } catch (e) {
      return Left(_mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getCategories() async {
    try {
      await _ensureInitialized();
      
      final products = await _cacheService.getProducts();
      
      // Extract unique categories
      final categories = products
          .map((product) => product.merchantCategoryId)
          .toSet()
          .toList();
      
      return Right(categories);
    } catch (e) {
      return Left(_mapExceptionToFailure(e));
    }
  }

  /// Force refresh products from API
  Future<Either<Failure, List<Product>>> refreshProducts() async {
    try {
      await _ensureInitialized();
      
      final products = await _cacheService.getProducts(forceRefresh: true);
      return Right(products);
    } catch (e) {
      return Left(_mapExceptionToFailure(e));
    }
  }

  /// Clear all cached data
  Future<Either<Failure, void>> clearCache() async {
    try {
      await _ensureInitialized();
      
      await _cacheService.clearCache();
      return const Right(null);
    } catch (e) {
      return Left(_mapExceptionToFailure(e));
    }
  }

  /// Get cache statistics
  Future<Either<Failure, CacheStats>> getCacheStats() async {
    try {
      await _ensureInitialized();
      
      final stats = await _cacheService.getStats();
      return Right(stats);
    } catch (e) {
      return Left(_mapExceptionToFailure(e));
    }
  }

  /// Ensure repository is initialized
  Future<void> _ensureInitialized() async {
    if (!_isInitialized) {
      await initialize();
    }
  }

  /// Map exceptions to appropriate failures
  Failure _mapExceptionToFailure(dynamic exception) {
    if (exception is StateError) {
      return CacheFailure();
    } else if (exception.toString().contains('timeout')) {
      return NetworkFailure();
    } else if (exception.toString().contains('connection')) {
      return NetworkFailure();
    } else {
      return ServerFailure();
    }
  }

  /// Dispose the repository
  Future<void> dispose() async {
    await _cacheService.dispose();
    _isInitialized = false;
  }
}

/// Additional failure types for enhanced error handling
class CacheFailure extends Failure {}
class NetworkFailure extends Failure {}
class NotFoundFailure extends Failure {}

/// Extension methods for better error handling
extension ProductRepositoryExtension on ParallelProductRepositoryImpl {
  /// Get products with retry logic
  Future<Either<Failure, List<Product>>> getProductsWithRetry({
    int maxRetries = 3,
    Duration retryDelay = const Duration(seconds: 1),
  }) async {
    for (int attempt = 0; attempt < maxRetries; attempt++) {
      final result = await getProducts();
      
      if (result.isRight()) {
        return result;
      }
      
      if (attempt < maxRetries - 1) {
        await Future.delayed(retryDelay);
      }
    }
    
    return getProducts(); // Final attempt
  }

  /// Search products with debouncing
  Future<Either<Failure, List<Product>>> searchProductsDebounced(
    String query, {
    Duration debounceDelay = const Duration(milliseconds: 300),
  }) async {
    // Simple debouncing - in production, you might want a more sophisticated approach
    await Future.delayed(debounceDelay);
    return searchProducts(query);
  }
}

/// Repository factory for creating configured instances
class ProductRepositoryFactory {
  /// Create a parallel product repository with default configuration
  static ParallelProductRepositoryImpl createDefault() {
    final cacheService = ParallelCacheService(
      maxIsolates: 3,
      strategy: const StaleWhileRevalidateStrategy(
        enableBackgroundRefresh: true,
        backgroundRefreshInterval: Duration(minutes: 30),
        cacheValidityDuration: Duration(hours: 24),
      ),
    );
    
    return ParallelProductRepositoryImpl(cacheService: cacheService);
  }

  /// Create a parallel product repository with cache-first strategy
  static ParallelProductRepositoryImpl createCacheFirst() {
    final cacheService = ParallelCacheService(
      maxIsolates: 2,
      strategy: const CacheFirstStrategy(
        enableBackgroundRefresh: false,
        backgroundRefreshInterval: Duration(hours: 1),
        cacheValidityDuration: Duration(hours: 24),
      ),
    );
    
    return ParallelProductRepositoryImpl(cacheService: cacheService);
  }

  /// Create a parallel product repository with network-first strategy
  static ParallelProductRepositoryImpl createNetworkFirst() {
    final cacheService = ParallelCacheService(
      maxIsolates: 4,
      strategy: const NetworkFirstStrategy(
        enableBackgroundRefresh: false,
        backgroundRefreshInterval: Duration(minutes: 15),
        cacheValidityDuration: Duration(hours: 1),
      ),
    );
    
    return ParallelProductRepositoryImpl(cacheService: cacheService);
  }

  /// Create a parallel product repository with custom configuration
  static ParallelProductRepositoryImpl createCustom({
    required int maxIsolates,
    required CacheStrategy strategy,
  }) {
    final cacheService = ParallelCacheService(
      maxIsolates: maxIsolates,
      strategy: strategy,
    );
    
    return ParallelProductRepositoryImpl(cacheService: cacheService);
  }
}
