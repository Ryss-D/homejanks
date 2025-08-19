import 'dart:isolate';
import '../../data/models/product.dart';

/// Base class for all isolate messages
abstract class IsolateMessage {
  final String id;
  final SendPort replyPort;

  const IsolateMessage({
    required this.id,
    required this.replyPort,
  });

  Map<String, dynamic> toJson();
  
  static IsolateMessage fromJson(Map<String, dynamic> json, SendPort replyPort) {
    final type = json['type'] as String;
    switch (type) {
      case 'CacheProductsMessage':
        return CacheProductsMessage.fromJson(json, replyPort);
      case 'GetCachedProductsMessage':
        return GetCachedProductsMessage.fromJson(json, replyPort);
      case 'SearchCachedProductsMessage':
        return SearchCachedProductsMessage.fromJson(json, replyPort);
      case 'HasValidCacheMessage':
        return HasValidCacheMessage.fromJson(json, replyPort);
      case 'ClearCacheMessage':
        return ClearCacheMessage.fromJson(json, replyPort);
      case 'FetchProductsMessage':
        return FetchProductsMessage.fromJson(json, replyPort);
      default:
        throw ArgumentError('Unknown message type: $type');
    }
  }
}

/// Message to cache products
class CacheProductsMessage extends IsolateMessage {
  final List<Product> products;

  const CacheProductsMessage({
    required super.id,
    required super.replyPort,
    required this.products,
  });

  @override
  Map<String, dynamic> toJson() => {
    'type': 'CacheProductsMessage',
    'id': id,
    'products': products.map((p) => p.toJson()).toList(),
  };

  static CacheProductsMessage fromJson(Map<String, dynamic> json, SendPort replyPort) {
    final productsJson = json['products'] as List<dynamic>;
    final products = productsJson
        .map((p) => Product.fromJson(p as Map<String, dynamic>))
        .toList();
    
    return CacheProductsMessage(
      id: json['id'] as String,
      replyPort: replyPort,
      products: products,
    );
  }
}

/// Message to get cached products
class GetCachedProductsMessage extends IsolateMessage {
  const GetCachedProductsMessage({
    required super.id,
    required super.replyPort,
  });

  @override
  Map<String, dynamic> toJson() => {
    'type': 'GetCachedProductsMessage',
    'id': id,
  };

  static GetCachedProductsMessage fromJson(Map<String, dynamic> json, SendPort replyPort) {
    return GetCachedProductsMessage(
      id: json['id'] as String,
      replyPort: replyPort,
    );
  }
}

/// Message to search cached products
class SearchCachedProductsMessage extends IsolateMessage {
  final String query;

  const SearchCachedProductsMessage({
    required super.id,
    required super.replyPort,
    required this.query,
  });

  @override
  Map<String, dynamic> toJson() => {
    'type': 'SearchCachedProductsMessage',
    'id': id,
    'query': query,
  };

  static SearchCachedProductsMessage fromJson(Map<String, dynamic> json, SendPort replyPort) {
    return SearchCachedProductsMessage(
      id: json['id'] as String,
      replyPort: replyPort,
      query: json['query'] as String,
    );
  }
}

/// Message to check if cache is valid
class HasValidCacheMessage extends IsolateMessage {
  const HasValidCacheMessage({
    required super.id,
    required super.replyPort,
  });

  @override
  Map<String, dynamic> toJson() => {
    'type': 'HasValidCacheMessage',
    'id': id,
  };

  static HasValidCacheMessage fromJson(Map<String, dynamic> json, SendPort replyPort) {
    return HasValidCacheMessage(
      id: json['id'] as String,
      replyPort: replyPort,
    );
  }
}

/// Message to clear cache
class ClearCacheMessage extends IsolateMessage {
  const ClearCacheMessage({
    required super.id,
    required super.replyPort,
  });

  @override
  Map<String, dynamic> toJson() => {
    'type': 'ClearCacheMessage',
    'id': id,
  };

  static ClearCacheMessage fromJson(Map<String, dynamic> json, SendPort replyPort) {
    return ClearCacheMessage(
      id: json['id'] as String,
      replyPort: replyPort,
    );
  }
}

/// Message to fetch products from API
class FetchProductsMessage extends IsolateMessage {
  const FetchProductsMessage({
    required super.id,
    required super.replyPort,
  });

  @override
  Map<String, dynamic> toJson() => {
    'type': 'FetchProductsMessage',
    'id': id,
  };

  static FetchProductsMessage fromJson(Map<String, dynamic> json, SendPort replyPort) {
    return FetchProductsMessage(
      id: json['id'] as String,
      replyPort: replyPort,
    );
  }
}

/// Base class for isolate responses
abstract class IsolateResponse {
  final String messageId;
  final bool success;
  final String? error;

  const IsolateResponse({
    required this.messageId,
    required this.success,
    this.error,
  });

  Map<String, dynamic> toJson();

  static IsolateResponse fromJson(Map<String, dynamic> json) {
    final type = json['type'] as String;
    switch (type) {
      case 'ProductsResponse':
        return ProductsResponse.fromJson(json);
      case 'BoolResponse':
        return BoolResponse.fromJson(json);
      case 'VoidResponse':
        return VoidResponse.fromJson(json);
      default:
        throw ArgumentError('Unknown response type: $type');
    }
  }
}

/// Response containing products
class ProductsResponse extends IsolateResponse {
  final List<Product> products;

  const ProductsResponse({
    required super.messageId,
    required super.success,
    super.error,
    required this.products,
  });

  @override
  Map<String, dynamic> toJson() => {
    'type': 'ProductsResponse',
    'messageId': messageId,
    'success': success,
    'error': error,
    'products': products.map((p) => p.toJson()).toList(),
  };

  static ProductsResponse fromJson(Map<String, dynamic> json) {
    final productsJson = json['products'] as List<dynamic>? ?? [];
    final products = productsJson
        .map((p) => Product.fromJson(p as Map<String, dynamic>))
        .toList();

    return ProductsResponse(
      messageId: json['messageId'] as String,
      success: json['success'] as bool,
      error: json['error'] as String?,
      products: products,
    );
  }
}

/// Response containing boolean value
class BoolResponse extends IsolateResponse {
  final bool value;

  const BoolResponse({
    required super.messageId,
    required super.success,
    super.error,
    required this.value,
  });

  @override
  Map<String, dynamic> toJson() => {
    'type': 'BoolResponse',
    'messageId': messageId,
    'success': success,
    'error': error,
    'value': value,
  };

  static BoolResponse fromJson(Map<String, dynamic> json) {
    return BoolResponse(
      messageId: json['messageId'] as String,
      success: json['success'] as bool,
      error: json['error'] as String?,
      value: json['value'] as bool? ?? false,
    );
  }
}

/// Response for void operations
class VoidResponse extends IsolateResponse {
  const VoidResponse({
    required super.messageId,
    required super.success,
    super.error,
  });

  @override
  Map<String, dynamic> toJson() => {
    'type': 'VoidResponse',
    'messageId': messageId,
    'success': success,
    'error': error,
  };

  static VoidResponse fromJson(Map<String, dynamic> json) {
    return VoidResponse(
      messageId: json['messageId'] as String,
      success: json['success'] as bool,
      error: json['error'] as String?,
    );
  }
}
