import 'dart:async';
import '../../data/models/product.dart';
import '../../services/cache/parallel_cache_service.dart';

/// Performance monitoring service for cache operations
class CachePerformanceMonitor {
  final Map<String, List<PerformanceMetric>> _metrics = {};
  final StreamController<PerformanceReport> _reportController = StreamController.broadcast();
  Timer? _reportTimer;
  bool _isDisposed = false;

  /// Stream of performance reports
  Stream<PerformanceReport> get reports => _reportController.stream;

  /// Start monitoring with periodic reports
  void startMonitoring({Duration reportInterval = const Duration(minutes: 5)}) {
    if (_isDisposed) return;

    _reportTimer = Timer.periodic(reportInterval, (_) {
      final report = generateReport();
      _reportController.add(report);
    });
  }

  /// Record a cache operation metric
  void recordMetric(String operation, Duration duration, {
    bool success = true,
    String? error,
    Map<String, dynamic>? metadata,
  }) {
    if (_isDisposed) return;

    final metric = PerformanceMetric(
      operation: operation,
      duration: duration,
      timestamp: DateTime.now(),
      success: success,
      error: error,
      metadata: metadata,
    );

    _metrics.putIfAbsent(operation, () => []).add(metric);

    // Keep only recent metrics (last 1000 per operation)
    final operationMetrics = _metrics[operation]!;
    if (operationMetrics.length > 1000) {
      operationMetrics.removeRange(0, operationMetrics.length - 1000);
    }
  }

  /// Generate performance report
  PerformanceReport generateReport() {
    final operationStats = <String, OperationStats>{};

    for (final entry in _metrics.entries) {
      final operation = entry.key;
      final metrics = entry.value;

      if (metrics.isEmpty) continue;

      final durations = metrics.map((m) => m.duration.inMilliseconds).toList();
      final successCount = metrics.where((m) => m.success).length;
      final errorCount = metrics.length - successCount;

      durations.sort();

      operationStats[operation] = OperationStats(
        operation: operation,
        totalOperations: metrics.length,
        successCount: successCount,
        errorCount: errorCount,
        successRate: successCount / metrics.length,
        averageDuration: Duration(
          milliseconds: (durations.reduce((a, b) => a + b) / durations.length).round(),
        ),
        medianDuration: Duration(
          milliseconds: durations[durations.length ~/ 2],
        ),
        p95Duration: Duration(
          milliseconds: durations[(durations.length * 0.95).round() - 1],
        ),
        p99Duration: Duration(
          milliseconds: durations[(durations.length * 0.99).round() - 1],
        ),
        minDuration: Duration(milliseconds: durations.first),
        maxDuration: Duration(milliseconds: durations.last),
        recentErrors: metrics
            .where((m) => !m.success)
            .take(5)
            .map((m) => m.error ?? 'Unknown error')
            .toList(),
      );
    }

    return PerformanceReport(
      timestamp: DateTime.now(),
      operationStats: operationStats,
      overallStats: _calculateOverallStats(operationStats.values.toList()),
    );
  }

  /// Calculate overall statistics
  OverallStats _calculateOverallStats(List<OperationStats> operationStats) {
    if (operationStats.isEmpty) {
      return OverallStats(
        totalOperations: 0,
        totalSuccessCount: 0,
        totalErrorCount: 0,
        overallSuccessRate: 0.0,
        averageOperationDuration: Duration.zero,
      );
    }

    final totalOperations = operationStats.fold(0, (sum, stat) => sum + stat.totalOperations);
    final totalSuccessCount = operationStats.fold(0, (sum, stat) => sum + stat.successCount);
    final totalErrorCount = operationStats.fold(0, (sum, stat) => sum + stat.errorCount);

    final weightedAverageDuration = operationStats.fold(0, (sum, stat) {
      return sum + (stat.averageDuration.inMilliseconds * stat.totalOperations);
    }) / totalOperations;

    return OverallStats(
      totalOperations: totalOperations,
      totalSuccessCount: totalSuccessCount,
      totalErrorCount: totalErrorCount,
      overallSuccessRate: totalSuccessCount / totalOperations,
      averageOperationDuration: Duration(milliseconds: weightedAverageDuration.round()),
    );
  }

  /// Clear all metrics
  void clearMetrics() {
    _metrics.clear();
  }

  /// Get metrics for a specific operation
  List<PerformanceMetric> getMetricsForOperation(String operation) {
    return List.from(_metrics[operation] ?? []);
  }

  /// Dispose the monitor
  void dispose() {
    if (_isDisposed) return;
    _isDisposed = true;

    _reportTimer?.cancel();
    _reportController.close();
    _metrics.clear();
  }
}

/// Individual performance metric
class PerformanceMetric {
  final String operation;
  final Duration duration;
  final DateTime timestamp;
  final bool success;
  final String? error;
  final Map<String, dynamic>? metadata;

  const PerformanceMetric({
    required this.operation,
    required this.duration,
    required this.timestamp,
    required this.success,
    this.error,
    this.metadata,
  });

  @override
  String toString() {
    return 'PerformanceMetric('
        'operation: $operation, '
        'duration: ${duration.inMilliseconds}ms, '
        'success: $success'
        '${error != null ? ', error: $error' : ''}'
        ')';
  }
}

/// Statistics for a specific operation
class OperationStats {
  final String operation;
  final int totalOperations;
  final int successCount;
  final int errorCount;
  final double successRate;
  final Duration averageDuration;
  final Duration medianDuration;
  final Duration p95Duration;
  final Duration p99Duration;
  final Duration minDuration;
  final Duration maxDuration;
  final List<String> recentErrors;

  const OperationStats({
    required this.operation,
    required this.totalOperations,
    required this.successCount,
    required this.errorCount,
    required this.successRate,
    required this.averageDuration,
    required this.medianDuration,
    required this.p95Duration,
    required this.p99Duration,
    required this.minDuration,
    required this.maxDuration,
    required this.recentErrors,
  });

  @override
  String toString() {
    return 'OperationStats('
        'operation: $operation, '
        'total: $totalOperations, '
        'success: $successCount, '
        'errors: $errorCount, '
        'successRate: ${(successRate * 100).toStringAsFixed(1)}%, '
        'avgDuration: ${averageDuration.inMilliseconds}ms'
        ')';
  }
}

/// Overall performance statistics
class OverallStats {
  final int totalOperations;
  final int totalSuccessCount;
  final int totalErrorCount;
  final double overallSuccessRate;
  final Duration averageOperationDuration;

  const OverallStats({
    required this.totalOperations,
    required this.totalSuccessCount,
    required this.totalErrorCount,
    required this.overallSuccessRate,
    required this.averageOperationDuration,
  });

  @override
  String toString() {
    return 'OverallStats('
        'total: $totalOperations, '
        'success: $totalSuccessCount, '
        'errors: $totalErrorCount, '
        'successRate: ${(overallSuccessRate * 100).toStringAsFixed(1)}%, '
        'avgDuration: ${averageOperationDuration.inMilliseconds}ms'
        ')';
  }
}

/// Performance report containing all statistics
class PerformanceReport {
  final DateTime timestamp;
  final Map<String, OperationStats> operationStats;
  final OverallStats overallStats;

  const PerformanceReport({
    required this.timestamp,
    required this.operationStats,
    required this.overallStats,
  });

  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.writeln('Performance Report (${timestamp.toIso8601String()})');
    buffer.writeln('Overall: $overallStats');
    buffer.writeln('Operations:');
    
    for (final stats in operationStats.values) {
      buffer.writeln('  $stats');
    }
    
    return buffer.toString();
  }
}

/// Wrapper for monitoring cache operations
class MonitoredCacheService {
  final ParallelCacheService _cacheService;
  final CachePerformanceMonitor _monitor;

  MonitoredCacheService(this._cacheService, this._monitor);

  /// Get products with monitoring
  Future<List<Product>> getProducts({bool forceRefresh = false}) async {
    final stopwatch = Stopwatch()..start();
    
    try {
      final result = await _cacheService.getProducts(forceRefresh: forceRefresh);
      
      _monitor.recordMetric(
        'getProducts',
        stopwatch.elapsed,
        success: true,
        metadata: {
          'forceRefresh': forceRefresh,
          'productCount': result.length,
        },
      );
      
      return result;
    } catch (e) {
      _monitor.recordMetric(
        'getProducts',
        stopwatch.elapsed,
        success: false,
        error: e.toString(),
        metadata: {'forceRefresh': forceRefresh},
      );
      rethrow;
    }
  }

  /// Search products with monitoring
  Future<List<Product>> searchProducts(String query) async {
    final stopwatch = Stopwatch()..start();
    
    try {
      final result = await _cacheService.searchProducts(query);
      
      _monitor.recordMetric(
        'searchProducts',
        stopwatch.elapsed,
        success: true,
        metadata: {
          'query': query,
          'resultCount': result.length,
        },
      );
      
      return result;
    } catch (e) {
      _monitor.recordMetric(
        'searchProducts',
        stopwatch.elapsed,
        success: false,
        error: e.toString(),
        metadata: {'query': query},
      );
      rethrow;
    }
  }

  /// Clear cache with monitoring
  Future<void> clearCache() async {
    final stopwatch = Stopwatch()..start();
    
    try {
      await _cacheService.clearCache();
      
      _monitor.recordMetric(
        'clearCache',
        stopwatch.elapsed,
        success: true,
      );
    } catch (e) {
      _monitor.recordMetric(
        'clearCache',
        stopwatch.elapsed,
        success: false,
        error: e.toString(),
      );
      rethrow;
    }
  }

  /// Get cache stats with monitoring
  Future<CacheStats> getStats() async {
    final stopwatch = Stopwatch()..start();
    
    try {
      final result = await _cacheService.getStats();
      
      _monitor.recordMetric(
        'getStats',
        stopwatch.elapsed,
        success: true,
        metadata: {
          'hasValidCache': result.hasValidCache,
          'cachedProductsCount': result.cachedProductsCount,
        },
      );
      
      return result;
    } catch (e) {
      _monitor.recordMetric(
        'getStats',
        stopwatch.elapsed,
        success: false,
        error: e.toString(),
      );
      rethrow;
    }
  }

  /// Dispose both services
  Future<void> dispose() async {
    await _cacheService.dispose();
    _monitor.dispose();
  }
}
