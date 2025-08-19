import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:ecommerce_app/services/database/app_database.dart' hide Product;
import 'package:ecommerce_app/data/models/product.dart';
import 'package:ecommerce_app/data/models/cart_item.dart' as models;

abstract class CartLocalDataSource {
  Future<List<models.CartItem>> getCartItems();
  Future<void> addToCart(Product product, int quantity);
  Future<void> removeFromCart(String productId);
  Future<void> updateCartItemQuantity(String productId, int quantity);
  Future<void> clearCart();
}

class CartLocalDataSourceImpl implements CartLocalDataSource {
  final AppDatabase database;

  CartLocalDataSourceImpl(this.database);

  @override
  Future<List<models.CartItem>> getCartItems() async {
    final cartItemsWithProducts = await database.getCartItemsWithProducts();
    
    return cartItemsWithProducts.map((item) {
      final product = Product(
        productId: item.product.productId,
        merchantCategoryId: item.product.merchantCategoryId,
        skuId: item.product.skuId,
        position: item.product.position.toString(),
        isPrimeEligible: item.product.isPrimeEligible,
        displayName: item.product.displayName,
        brand: item.product.brand,
        model: item.product.model,
        media: _parseMediaJson(item.product.mediaJson),
        badges: _parseStringList(item.product.badgesJson),
        fastShippingLabels: _parseFastShippingLabelsJson(item.product.fastShippingLabelsJson),
        events: _parseEventsList(item.product.eventsJson),
        prices: _parsePricesList(item.product.pricesJson),
        totalReviews: item.product.totalReviews,
        rating: item.product.rating,
        variants: _parseStringList(item.product.variantsJson),
        multiPurposeIcon: _parseMap(item.product.multiPurposeIconJson),
        bankBadge: item.product.bankBadgeJson != null ? _parseBankBadgeJson(item.product.bankBadgeJson!) : null,
        highlights: _parseHighlightsList(item.product.highlightsJson),
        accumulativePoints: _parseStringList(item.product.accumulativePointsJson),
        isPromoted: item.product.isPromoted,
        isInternational: item.product.isInternational.toString(),
        installments: _parseMap(item.product.installmentsJson),
        mediaUrls: _parseStringList(item.product.mediaUrlsJson),
      );

      return models.CartItem(
        product: product,
        quantity: item.cartItem.quantity,
      );
    }).toList();
  }

  @override
  Future<void> addToCart(Product product, int quantity) async {
    final productId = int.tryParse(product.productId) ?? 0;
    final price = product.prices.isNotEmpty ? product.prices.first.priceWithoutFormatting.toDouble() : 0.0;
    final rating = double.tryParse(product.rating) ?? 0.0;
    final ratingCount = int.tryParse(product.totalReviews) ?? 0;
    final imageUrl = product.mediaUrls.isNotEmpty ? product.mediaUrls.first : '';
    
    // First, ensure the product exists in the products table
    await database.insertProduct(ProductsCompanion.insert(
      id: Value(productId),
      productId: product.productId,
      merchantCategoryId: product.merchantCategoryId,
      skuId: product.skuId,
      position: int.tryParse(product.position) ?? 0,
      isPrimeEligible: product.isPrimeEligible,
      displayName: product.displayName,
      brand: product.brand,
      model: product.model,
      mediaJson: jsonEncode(product.media.toJson()),
      badgesJson: jsonEncode(product.badges),
      fastShippingLabelsJson: jsonEncode(product.fastShippingLabels.toJson()),
      eventsJson: jsonEncode(product.events.map((e) => e.toJson()).toList()),
      pricesJson: jsonEncode(product.prices.map((p) => p.toJson()).toList()),
      totalReviews: product.totalReviews,
      rating: product.rating,
      variantsJson: jsonEncode(product.variants),
      multiPurposeIconJson: jsonEncode(product.multiPurposeIcon),
      bankBadgeJson: Value(product.bankBadge != null ? jsonEncode(product.bankBadge!.toJson()) : null),
      highlightsJson: jsonEncode(product.highlights.map((h) => h.toJson()).toList()),
      accumulativePointsJson: jsonEncode(product.accumulativePoints),
      isPromoted: product.isPromoted,
      isInternational: product.isInternational == "true",
      installmentsJson: jsonEncode(product.installments),
      mediaUrlsJson: jsonEncode(product.mediaUrls),
    ));

    await database.addToCart(productId, quantity);
  }

  @override
  Future<void> removeFromCart(String productId) async {
    final id = int.tryParse(productId) ?? 0;
    await database.removeFromCart(id);
  }

  @override
  Future<void> updateCartItemQuantity(String productId, int quantity) async {
    final id = int.tryParse(productId) ?? 0;
    await database.updateCartItemQuantity(id, quantity);
  }

  @override
  Future<void> clearCart() async {
    await database.clearCart();
  }

  MediaModel _parseMediaJson(String json) {
    final map = jsonDecode(json) as Map<String, dynamic>;
    return MediaModel(
      id: map['id'] as String,
      type: map['type'] as String,
      onImageHover: map['onImageHover'] as String,
    );
  }

  FastShippingLabelsModel _parseFastShippingLabelsJson(String json) {
    final map = jsonDecode(json) as Map<String, dynamic>;
    return FastShippingLabelsModel(
      hdSameDayZones: map['hd_same_day_zones'] as bool,
      hdNextDayZones: map['hd_next_day_zones'] as bool,
      ccSameDayZones: map['cc_same_day_zones'] as bool,
      ccNextDayZones: map['cc_next_day_zones'] as bool,
    );
  }

  BankBadgeModel _parseBankBadgeJson(String json) {
    final map = jsonDecode(json) as Map<String, dynamic>;
    return BankBadgeModel(
      type: map['type'] as String,
      value: map['value'] as String,
    );
  }

  List<String> _parseStringList(String json) {
    final list = jsonDecode(json) as List<dynamic>;
    return list.cast<String>();
  }

  List<EventModel> _parseEventsList(String json) {
    final list = jsonDecode(json) as List<dynamic>;
    return list.map((item) => EventModel(
      description: item['description'] as String,
      value: item['value'] as String,
    )).toList();
  }

  List<PriceModel> _parsePricesList(String json) {
    final list = jsonDecode(json) as List<dynamic>;
    return list.map((item) => PriceModel(
      label: item['label'] as String,
      type: item['type'] as String,
      symbol: item['symbol'] as String,
      price: item['price'] as String,
      unit: item['unit'] as String,
      priceWithoutFormatting: item['priceWithoutFormatting'] as int,
    )).toList();
  }

  List<HighlightModel> _parseHighlightsList(String json) {
    final list = jsonDecode(json) as List<dynamic>;
    return list.map((item) => HighlightModel(
      key: item['key'] as String,
      value: item['value'] as String,
    )).toList();
  }

  Map<String, dynamic> _parseMap(String json) {
    return jsonDecode(json) as Map<String, dynamic>;
  }
}
