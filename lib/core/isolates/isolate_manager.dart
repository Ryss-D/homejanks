import 'dart:isolate';
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

import '../../data/models/product.dart';
import 'isolate_messages.dart';
import 'product_cache_worker.dart';

/// Manages isolate lifecycle and communication for product caching operations
class IsolateManager {
  Isolate? _isolate;
  SendPort? _isolateSendPort;
  ReceivePort? _receivePort;
  final Map<String, Completer<IsolateResponse>> _pendingRequests = {};
  bool _isInitialized = false;
  bool _isDisposed = false;

  /// Initialize the isolate manager
  Future<void> initialize() async {
    if (_isInitialized || _isDisposed) return;

    try {
      // Create a receive port for responses from the isolate
      _receivePort = ReceivePort();
      
      // Spawn the isolate
      _isolate = await Isolate.spawn(
        productCacheWorkerEntryPoint,
        _receivePort!.sendPort,
      );

      // Listen for messages from the isolate
      _receivePort!.listen(_handleIsolateMessage);

      // Wait for the isolate to send back its send port
      final completer = Completer<SendPort>();
      late StreamSubscription subscription;
      
      subscription = _receivePort!.listen((message) {
        if (message is SendPort) {
          _isolateSendPort = message;
          completer.complete(message);
          subscription.cancel();
        }
      });

      await completer.future.timeout(
        const Duration(seconds: 10),
        onTimeout: () => throw TimeoutException('Isolate initialization timeout'),
      );

      _isInitialized = true;
    } catch (e) {
      await dispose();
      rethrow;
    }
  }

  /// Handle messages from the isolate
  void _handleIsolateMessage(dynamic message) {
    if (message is Map<String, dynamic>) {
      try {
        final response = IsolateResponse.fromJson(message);
        final completer = _pendingRequests.remove(response.messageId);
        
        if (completer != null) {
          if (response.success) {
            completer.complete(response);
          } else {
            completer.completeError(
              IsolateException(response.error ?? 'Unknown error'),
            );
          }
        }
      } catch (e) {
        debugPrint('Error handling isolate message: $e');
      }
    }
  }

  /// Send a message to the isolate and wait for response
  Future<T> sendMessage<T extends IsolateResponse>(IsolateMessage message) async {
    if (!_isInitialized) {
      throw StateError('IsolateManager not initialized');
    }

    if (_isDisposed) {
      throw StateError('IsolateManager disposed');
    }

    if (_isolateSendPort == null) {
      throw StateError('Isolate send port not available');
    }

    final completer = Completer<IsolateResponse>();
    _pendingRequests[message.id] = completer;

    try {
      // Prepare message data with reply port
      final messageData = message.toJson();
      messageData['replyPort'] = _receivePort!.sendPort;

      // Send message to isolate
      _isolateSendPort!.send(messageData);

      // Wait for response with timeout
      final response = await completer.future.timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          _pendingRequests.remove(message.id);
          throw TimeoutException('Request timeout: ${message.id}');
        },
      );

      return response as T;
    } catch (e) {
      _pendingRequests.remove(message.id);
      rethrow;
    }
  }

  /// Cache products in the isolate
  Future<void> cacheProducts(List<Product> products) async {
    final message = CacheProductsMessage(
      id: _generateMessageId(),
      replyPort: _receivePort!.sendPort,
      products: products,
    );

    await sendMessage<VoidResponse>(message);
  }

  /// Get cached products from the isolate
  Future<List<Product>> getCachedProducts() async {
    final message = GetCachedProductsMessage(
      id: _generateMessageId(),
      replyPort: _receivePort!.sendPort,
    );

    final response = await sendMessage<ProductsResponse>(message);
    return response.products;
  }

  /// Search cached products in the isolate
  Future<List<Product>> searchCachedProducts(String query) async {
    final message = SearchCachedProductsMessage(
      id: _generateMessageId(),
      replyPort: _receivePort!.sendPort,
      query: query,
    );

    final response = await sendMessage<ProductsResponse>(message);
    return response.products;
  }

  /// Check if cache is valid in the isolate
  Future<bool> hasValidCache() async {
    final message = HasValidCacheMessage(
      id: _generateMessageId(),
      replyPort: _receivePort!.sendPort,
    );

    final response = await sendMessage<BoolResponse>(message);
    return response.value;
  }

  /// Clear cache in the isolate
  Future<void> clearCache() async {
    final message = ClearCacheMessage(
      id: _generateMessageId(),
      replyPort: _receivePort!.sendPort,
    );

    await sendMessage<VoidResponse>(message);
  }

  /// Fetch products from API in the isolate
  Future<List<Product>> fetchProducts() async {
    final message = FetchProductsMessage(
      id: _generateMessageId(),
      replyPort: _receivePort!.sendPort,
    );

    final response = await sendMessage<ProductsResponse>(message);
    return response.products;
  }

  /// Generate a unique message ID
  String _generateMessageId() {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final random = Random().nextInt(10000);
    return '${timestamp}_$random';
  }

  /// Dispose the isolate manager
  Future<void> dispose() async {
    if (_isDisposed) return;

    _isDisposed = true;

    // Cancel all pending requests
    for (final completer in _pendingRequests.values) {
      if (!completer.isCompleted) {
        completer.completeError(StateError('IsolateManager disposed'));
      }
    }
    _pendingRequests.clear();

    // Send shutdown message to isolate
    if (_isolateSendPort != null) {
      try {
        _isolateSendPort!.send('shutdown');
      } catch (e) {
        debugPrint('Error sending shutdown message: $e');
      }
    }

    // Close receive port
    _receivePort?.close();

    // Kill isolate if still running
    _isolate?.kill(priority: Isolate.immediate);

    _isolate = null;
    _isolateSendPort = null;
    _receivePort = null;
    _isInitialized = false;
  }

  /// Check if the manager is initialized
  bool get isInitialized => _isInitialized;

  /// Check if the manager is disposed
  bool get isDisposed => _isDisposed;
}

/// Pool of isolate managers for better performance
class IsolatePool {
  final int _maxIsolates;
  final List<IsolateManager> _availableManagers = [];
  final List<IsolateManager> _busyManagers = [];
  bool _isDisposed = false;

  IsolatePool({int maxIsolates = 3}) : _maxIsolates = maxIsolates;

  /// Get an available isolate manager
  Future<IsolateManager> _getManager() async {
    if (_isDisposed) {
      throw StateError('IsolatePool disposed');
    }

    // Return available manager if exists
    if (_availableManagers.isNotEmpty) {
      final manager = _availableManagers.removeAt(0);
      _busyManagers.add(manager);
      return manager;
    }

    // Create new manager if under limit
    if (_busyManagers.length < _maxIsolates) {
      final manager = IsolateManager();
      await manager.initialize();
      _busyManagers.add(manager);
      return manager;
    }

    // Wait for a manager to become available
    while (_availableManagers.isEmpty && !_isDisposed) {
      await Future.delayed(const Duration(milliseconds: 10));
    }

    if (_isDisposed) {
      throw StateError('IsolatePool disposed');
    }

    final manager = _availableManagers.removeAt(0);
    _busyManagers.add(manager);
    return manager;
  }

  /// Return a manager to the pool
  void _returnManager(IsolateManager manager) {
    if (_isDisposed) return;

    _busyManagers.remove(manager);
    if (!manager.isDisposed) {
      _availableManagers.add(manager);
    }
  }

  /// Execute a task with an isolate manager
  Future<T> execute<T>(Future<T> Function(IsolateManager manager) task) async {
    final manager = await _getManager();
    try {
      return await task(manager);
    } finally {
      _returnManager(manager);
    }
  }

  /// Dispose all managers in the pool
  Future<void> dispose() async {
    if (_isDisposed) return;
    _isDisposed = true;

    final allManagers = [..._availableManagers, ..._busyManagers];
    _availableManagers.clear();
    _busyManagers.clear();

    await Future.wait(
      allManagers.map((manager) => manager.dispose()),
    );
  }

  /// Get pool statistics
  Map<String, int> get stats => {
    'available': _availableManagers.length,
    'busy': _busyManagers.length,
    'total': _availableManagers.length + _busyManagers.length,
    'maxIsolates': _maxIsolates,
  };
}

/// Exception thrown by isolate operations
class IsolateException implements Exception {
  final String message;
  
  const IsolateException(this.message);
  
  @override
  String toString() => 'IsolateException: $message';
}

/// Timeout exception for isolate operations
class TimeoutException implements Exception {
  final String message;
  
  const TimeoutException(this.message);
  
  @override
  String toString() => 'TimeoutException: $message';
}
