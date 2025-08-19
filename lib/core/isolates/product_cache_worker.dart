import 'dart:isolate';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../data/datasources/product_local_data_source.dart';
import '../../data/datasources/product_remote_data_source.dart';
import '../../services/database/app_database.dart';
import 'isolate_messages.dart';

/// Entry point for the product cache worker isolate
void productCacheWorkerEntryPoint(SendPort mainSendPort) async {
  // Create a receive port for this isolate
  final receivePort = ReceivePort();
  
  // Send the send port back to the main isolate
  mainSendPort.send(receivePort.sendPort);
  
  // Initialize the worker
  final worker = ProductCacheWorker();
  await worker.initialize();
  
  // Listen for messages from the main isolate
  await for (final message in receivePort) {
    if (message == 'shutdown') {
      await worker.dispose();
      break;
    }
    
    if (message is Map<String, dynamic>) {
      await worker.handleMessage(message);
    }
  }
}

/// Product cache worker that handles caching operations in an isolate
class ProductCacheWorker {
  late AppDatabase _database;
  late ProductLocalDataSource _localDataSource;
  late ProductRemoteDataSource _remoteDataSource;
  late Dio _dio;
  
  /// Initialize the worker with necessary dependencies
  Future<void> initialize() async {
    try {
      // Initialize database connection for this isolate
      _database = AppDatabase();
      
      // Initialize local data source
      _localDataSource = ProductLocalDataSourceImpl(_database);
      
      // Initialize Dio and remote data source
      _dio = Dio();
      _remoteDataSource = ProductRemoteDataSource(_dio);
      
    } catch (e) {
      // Handle initialization errors
      debugPrint('Error initializing ProductCacheWorker: $e');
      rethrow;
    }
  }
  
  /// Handle incoming messages from the main isolate
  Future<void> handleMessage(Map<String, dynamic> messageData) async {
    try {
      // Extract reply port from the message data
      final replyPortData = messageData['replyPort'];
      if (replyPortData == null) {
        debugPrint('No reply port found in message');
        return;
      }
      
      final replyPort = replyPortData as SendPort;
      
      // Parse the message
      final message = IsolateMessage.fromJson(messageData, replyPort);
      
      // Handle different message types
      switch (message.runtimeType) {
        case CacheProductsMessage:
          await _handleCacheProducts(message as CacheProductsMessage);
          break;
        case GetCachedProductsMessage:
          await _handleGetCachedProducts(message as GetCachedProductsMessage);
          break;
        case SearchCachedProductsMessage:
          await _handleSearchCachedProducts(message as SearchCachedProductsMessage);
          break;
        case HasValidCacheMessage:
          await _handleHasValidCache(message as HasValidCacheMessage);
          break;
        case ClearCacheMessage:
          await _handleClearCache(message as ClearCacheMessage);
          break;
        case FetchProductsMessage:
          await _handleFetchProducts(message as FetchProductsMessage);
          break;
        default:
          _sendErrorResponse(message.replyPort, message.id, 'Unknown message type');
      }
    } catch (e) {
      debugPrint('Error handling message: $e');
      // Try to send error response if possible
      if (messageData['id'] != null && messageData['replyPort'] != null) {
        _sendErrorResponse(
          messageData['replyPort'] as SendPort,
          messageData['id'] as String,
          e.toString(),
        );
      }
    }
  }
  
  /// Handle cache products message
  Future<void> _handleCacheProducts(CacheProductsMessage message) async {
    try {
      await _localDataSource.cacheProducts(message.products);
      
      final response = VoidResponse(
        messageId: message.id,
        success: true,
      );
      
      message.replyPort.send(response.toJson());
    } catch (e) {
      _sendErrorResponse(message.replyPort, message.id, e.toString());
    }
  }
  
  /// Handle get cached products message
  Future<void> _handleGetCachedProducts(GetCachedProductsMessage message) async {
    try {
      final products = await _localDataSource.getCachedProducts();
      
      final response = ProductsResponse(
        messageId: message.id,
        success: true,
        products: products,
      );
      
      message.replyPort.send(response.toJson());
    } catch (e) {
      _sendErrorResponse(message.replyPort, message.id, e.toString());
    }
  }
  
  /// Handle search cached products message
  Future<void> _handleSearchCachedProducts(SearchCachedProductsMessage message) async {
    try {
      final products = await _localDataSource.searchCachedProducts(message.query);
      
      final response = ProductsResponse(
        messageId: message.id,
        success: true,
        products: products,
      );
      
      message.replyPort.send(response.toJson());
    } catch (e) {
      _sendErrorResponse(message.replyPort, message.id, e.toString());
    }
  }
  
  /// Handle has valid cache message
  Future<void> _handleHasValidCache(HasValidCacheMessage message) async {
    try {
      final hasValidCache = await _localDataSource.hasValidCache();
      
      final response = BoolResponse(
        messageId: message.id,
        success: true,
        value: hasValidCache,
      );
      
      message.replyPort.send(response.toJson());
    } catch (e) {
      _sendErrorResponse(message.replyPort, message.id, e.toString());
    }
  }
  
  /// Handle clear cache message
  Future<void> _handleClearCache(ClearCacheMessage message) async {
    try {
      await _localDataSource.clearCache();
      
      final response = VoidResponse(
        messageId: message.id,
        success: true,
      );
      
      message.replyPort.send(response.toJson());
    } catch (e) {
      _sendErrorResponse(message.replyPort, message.id, e.toString());
    }
  }
  
  /// Handle fetch products from API message
  Future<void> _handleFetchProducts(FetchProductsMessage message) async {
    try {
      final products = await _remoteDataSource.getProducts();
      
      final response = ProductsResponse(
        messageId: message.id,
        success: true,
        products: products,
      );
      
      message.replyPort.send(response.toJson());
    } catch (e) {
      _sendErrorResponse(message.replyPort, message.id, e.toString());
    }
  }
  
  /// Send error response
  void _sendErrorResponse(SendPort replyPort, String messageId, String error) {
    final response = VoidResponse(
      messageId: messageId,
      success: false,
      error: error,
    );
    
    try {
      replyPort.send(response.toJson());
    } catch (e) {
      debugPrint('Failed to send error response: $e');
    }
  }
  
  /// Dispose resources
  Future<void> dispose() async {
    try {
      await _database.close();
      _dio.close();
    } catch (e) {
      debugPrint('Error disposing ProductCacheWorker: $e');
    }
  }
}

/// Batch processing utilities for parallel operations
class BatchProcessor {
  /// Process a list of items in parallel batches
  static Future<List<T>> processBatches<T, R>(
    List<R> items,
    Future<T> Function(R item) processor, {
    int batchSize = 10,
    int maxConcurrency = 4,
  }) async {
    final results = <T>[];
    
    // Split items into batches
    final batches = <List<R>>[];
    for (int i = 0; i < items.length; i += batchSize) {
      final end = (i + batchSize < items.length) ? i + batchSize : items.length;
      batches.add(items.sublist(i, end));
    }
    
    // Process batches with limited concurrency
    final semaphore = Semaphore(maxConcurrency);
    
    final futures = batches.map((batch) async {
      await semaphore.acquire();
      try {
        final batchResults = <T>[];
        for (final item in batch) {
          final result = await processor(item);
          batchResults.add(result);
        }
        return batchResults;
      } finally {
        semaphore.release();
      }
    });
    
    final batchResults = await Future.wait(futures);
    
    // Flatten results
    for (final batchResult in batchResults) {
      results.addAll(batchResult);
    }
    
    return results;
  }
}

/// Simple semaphore implementation for controlling concurrency
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
