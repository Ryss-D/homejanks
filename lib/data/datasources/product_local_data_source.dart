import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:ecommerce_app/data/database/app_database.dart';
import 'package:ecommerce_app/models/product.dart' as models;

abstract class ProductLocalDataSource {
  Future<List<models.Product>> getCachedProducts();
  Future<List<models.Product>> searchCachedProducts(String query);
  Future<void> cacheProducts(List<models.Product> products);
  Future<bool> hasValidCache();
  Future<void> clearCache();
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final AppDatabase database;
  static const Duration cacheValidityDuration = Duration(hours: 24);

  ProductLocalDataSourceImpl(this.database);

  @override
  Future<List<models.Product>> getCachedProducts() async {
    final products = await database.getAllProducts();
    return products.map(_databaseProductToModel).toList();
  }

  @override
  Future<List<models.Product>> searchCachedProducts(String query) async {
    final products = await database.searchProducts(query);
    return products.map(_databaseProductToModel).toList();
  }

  @override
  Future<void> cacheProducts(List<models.Product> products) async {
    // Clear existing cache
    await clearCache();
    
    // Insert new products
    final productCompanions = products.map(_modelToProductCompanion).toList();
    await database.insertProducts(productCompanions);
  }

  @override
  Future<bool> hasValidCache() async {
    final products = await database.getAllProducts();
    if (products.isEmpty) return false;
    
    // Check if cache is still valid (within 24 hours)
    final now = DateTime.now();
    final cacheTime = products.first.cachedAt;
    return now.difference(cacheTime) < cacheValidityDuration;
  }

  @override
  Future<void> clearCache() async {
    await database.clearProductsCache();
  }

  models.Product _databaseProductToModel(Product product) {
    return models.Product(
      productId: product.productId,
      merchantCategoryId: product.merchantCategoryId,
      skuId: product.skuId,
      position: product.position.toString(),
      isPrimeEligible: product.isPrimeEligible,
      displayName: product.displayName,
      brand: product.brand,
      model: product.model,
      media: _parseMediaJson(product.mediaJson),
      badges: _parseStringList(product.badgesJson),
      fastShippingLabels: _parseFastShippingLabelsJson(product.fastShippingLabelsJson),
      events: _parseEventsList(product.eventsJson),
      prices: _parsePricesList(product.pricesJson),
      totalReviews: product.totalReviews,
      rating: product.rating,
      variants: _parseStringList(product.variantsJson),
      multiPurposeIcon: _parseMap(product.multiPurposeIconJson),
      bankBadge: product.bankBadgeJson != null ? _parseBankBadgeJson(product.bankBadgeJson!) : null,
      highlights: _parseHighlightsList(product.highlightsJson),
      accumulativePoints: _parseStringList(product.accumulativePointsJson),
      isPromoted: product.isPromoted,
      isInternational: product.isInternational.toString(),
      installments: _parseMap(product.installmentsJson),
      mediaUrls: _parseStringList(product.mediaUrlsJson),
    );
  }

  ProductsCompanion _modelToProductCompanion(models.Product model) {
    return ProductsCompanion.insert(
      id: Value(int.tryParse(model.productId) ?? 0),
      productId: model.productId,
      merchantCategoryId: model.merchantCategoryId,
      skuId: model.skuId,
      position: int.tryParse(model.position) ?? 0,
      isPrimeEligible: model.isPrimeEligible,
      displayName: model.displayName,
      brand: model.brand,
      model: model.model,
      mediaJson: jsonEncode(model.media.toJson()),
      badgesJson: jsonEncode(model.badges),
      fastShippingLabelsJson: jsonEncode(model.fastShippingLabels.toJson()),
      eventsJson: jsonEncode(model.events.map((e) => e.toJson()).toList()),
      pricesJson: jsonEncode(model.prices.map((p) => p.toJson()).toList()),
      totalReviews: model.totalReviews,
      rating: model.rating,
      variantsJson: jsonEncode(model.variants),
      multiPurposeIconJson: jsonEncode(model.multiPurposeIcon),
      bankBadgeJson: Value(model.bankBadge != null ? jsonEncode(model.bankBadge!.toJson()) : null),
      highlightsJson: jsonEncode(model.highlights.map((h) => h.toJson()).toList()),
      accumulativePointsJson: jsonEncode(model.accumulativePoints),
      isPromoted: model.isPromoted,
      isInternational: model.isInternational == 'true',
      installmentsJson: jsonEncode(model.installments),
      mediaUrlsJson: jsonEncode(model.mediaUrls),
    );
  }

  models.MediaModel _parseMediaJson(String json) {
    final map = jsonDecode(json) as Map<String, dynamic>;
    return models.MediaModel(
      id: map['id'] as String,
      type: map['type'] as String,
      onImageHover: map['onImageHover'] as String,
    );
  }

  models.FastShippingLabelsModel _parseFastShippingLabelsJson(String json) {
    final map = jsonDecode(json) as Map<String, dynamic>;
    return models.FastShippingLabelsModel(
      hdSameDayZones: map['hd_same_day_zones'] as bool,
      hdNextDayZones: map['hd_next_day_zones'] as bool,
      ccSameDayZones: map['cc_same_day_zones'] as bool,
      ccNextDayZones: map['cc_next_day_zones'] as bool,
    );
  }

  models.BankBadgeModel _parseBankBadgeJson(String json) {
    final map = jsonDecode(json) as Map<String, dynamic>;
    return models.BankBadgeModel(
      type: map['type'] as String,
      value: map['value'] as String,
    );
  }

  List<String> _parseStringList(String json) {
    final list = jsonDecode(json) as List<dynamic>;
    return list.cast<String>();
  }

  List<models.EventModel> _parseEventsList(String json) {
    final list = jsonDecode(json) as List<dynamic>;
    return list.map((item) => models.EventModel(
      description: item['description'] as String,
      value: item['value'] as String,
    )).toList();
  }

  List<models.PriceModel> _parsePricesList(String json) {
    final list = jsonDecode(json) as List<dynamic>;
    return list.map((item) => models.PriceModel(
      label: item['label'] as String,
      type: item['type'] as String,
      symbol: item['symbol'] as String,
      price: item['price'] as String,
      unit: item['unit'] as String,
      priceWithoutFormatting: item['priceWithoutFormatting'] as int,
    )).toList();
  }

  List<models.HighlightModel> _parseHighlightsList(String json) {
    final list = jsonDecode(json) as List<dynamic>;
    return list.map((item) => models.HighlightModel(
      key: item['key'] as String,
      value: item['value'] as String,
    )).toList();
  }

  Map<String, dynamic> _parseMap(String json) {
    return jsonDecode(json) as Map<String, dynamic>;
  }
}
