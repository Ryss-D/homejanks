// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ProductsTable extends Products with TableInfo<$ProductsTable, Product> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
      'product_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _merchantCategoryIdMeta =
      const VerificationMeta('merchantCategoryId');
  @override
  late final GeneratedColumn<String> merchantCategoryId =
      GeneratedColumn<String>('merchant_category_id', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _skuIdMeta = const VerificationMeta('skuId');
  @override
  late final GeneratedColumn<String> skuId = GeneratedColumn<String>(
      'sku_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _positionMeta =
      const VerificationMeta('position');
  @override
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
      'position', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isPrimeEligibleMeta =
      const VerificationMeta('isPrimeEligible');
  @override
  late final GeneratedColumn<bool> isPrimeEligible = GeneratedColumn<bool>(
      'is_prime_eligible', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_prime_eligible" IN (0, 1))'));
  static const VerificationMeta _displayNameMeta =
      const VerificationMeta('displayName');
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
      'display_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _brandMeta = const VerificationMeta('brand');
  @override
  late final GeneratedColumn<String> brand = GeneratedColumn<String>(
      'brand', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _modelMeta = const VerificationMeta('model');
  @override
  late final GeneratedColumn<String> model = GeneratedColumn<String>(
      'model', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _mediaJsonMeta =
      const VerificationMeta('mediaJson');
  @override
  late final GeneratedColumn<String> mediaJson = GeneratedColumn<String>(
      'media_json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _badgesJsonMeta =
      const VerificationMeta('badgesJson');
  @override
  late final GeneratedColumn<String> badgesJson = GeneratedColumn<String>(
      'badges_json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fastShippingLabelsJsonMeta =
      const VerificationMeta('fastShippingLabelsJson');
  @override
  late final GeneratedColumn<String> fastShippingLabelsJson =
      GeneratedColumn<String>('fast_shipping_labels_json', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _eventsJsonMeta =
      const VerificationMeta('eventsJson');
  @override
  late final GeneratedColumn<String> eventsJson = GeneratedColumn<String>(
      'events_json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _pricesJsonMeta =
      const VerificationMeta('pricesJson');
  @override
  late final GeneratedColumn<String> pricesJson = GeneratedColumn<String>(
      'prices_json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _totalReviewsMeta =
      const VerificationMeta('totalReviews');
  @override
  late final GeneratedColumn<String> totalReviews = GeneratedColumn<String>(
      'total_reviews', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<String> rating = GeneratedColumn<String>(
      'rating', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _variantsJsonMeta =
      const VerificationMeta('variantsJson');
  @override
  late final GeneratedColumn<String> variantsJson = GeneratedColumn<String>(
      'variants_json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _multiPurposeIconJsonMeta =
      const VerificationMeta('multiPurposeIconJson');
  @override
  late final GeneratedColumn<String> multiPurposeIconJson =
      GeneratedColumn<String>('multi_purpose_icon_json', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _bankBadgeJsonMeta =
      const VerificationMeta('bankBadgeJson');
  @override
  late final GeneratedColumn<String> bankBadgeJson = GeneratedColumn<String>(
      'bank_badge_json', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _highlightsJsonMeta =
      const VerificationMeta('highlightsJson');
  @override
  late final GeneratedColumn<String> highlightsJson = GeneratedColumn<String>(
      'highlights_json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _accumulativePointsJsonMeta =
      const VerificationMeta('accumulativePointsJson');
  @override
  late final GeneratedColumn<String> accumulativePointsJson =
      GeneratedColumn<String>('accumulative_points_json', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isPromotedMeta =
      const VerificationMeta('isPromoted');
  @override
  late final GeneratedColumn<bool> isPromoted = GeneratedColumn<bool>(
      'is_promoted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_promoted" IN (0, 1))'));
  static const VerificationMeta _isInternationalMeta =
      const VerificationMeta('isInternational');
  @override
  late final GeneratedColumn<bool> isInternational = GeneratedColumn<bool>(
      'is_international', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_international" IN (0, 1))'));
  static const VerificationMeta _installmentsJsonMeta =
      const VerificationMeta('installmentsJson');
  @override
  late final GeneratedColumn<String> installmentsJson = GeneratedColumn<String>(
      'installments_json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _mediaUrlsJsonMeta =
      const VerificationMeta('mediaUrlsJson');
  @override
  late final GeneratedColumn<String> mediaUrlsJson = GeneratedColumn<String>(
      'media_urls_json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cachedAtMeta =
      const VerificationMeta('cachedAt');
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
      'cached_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        productId,
        merchantCategoryId,
        skuId,
        position,
        isPrimeEligible,
        displayName,
        brand,
        model,
        mediaJson,
        badgesJson,
        fastShippingLabelsJson,
        eventsJson,
        pricesJson,
        totalReviews,
        rating,
        variantsJson,
        multiPurposeIconJson,
        bankBadgeJson,
        highlightsJson,
        accumulativePointsJson,
        isPromoted,
        isInternational,
        installmentsJson,
        mediaUrlsJson,
        cachedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products';
  @override
  VerificationContext validateIntegrity(Insertable<Product> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('merchant_category_id')) {
      context.handle(
          _merchantCategoryIdMeta,
          merchantCategoryId.isAcceptableOrUnknown(
              data['merchant_category_id']!, _merchantCategoryIdMeta));
    } else if (isInserting) {
      context.missing(_merchantCategoryIdMeta);
    }
    if (data.containsKey('sku_id')) {
      context.handle(
          _skuIdMeta, skuId.isAcceptableOrUnknown(data['sku_id']!, _skuIdMeta));
    } else if (isInserting) {
      context.missing(_skuIdMeta);
    }
    if (data.containsKey('position')) {
      context.handle(_positionMeta,
          position.isAcceptableOrUnknown(data['position']!, _positionMeta));
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('is_prime_eligible')) {
      context.handle(
          _isPrimeEligibleMeta,
          isPrimeEligible.isAcceptableOrUnknown(
              data['is_prime_eligible']!, _isPrimeEligibleMeta));
    } else if (isInserting) {
      context.missing(_isPrimeEligibleMeta);
    }
    if (data.containsKey('display_name')) {
      context.handle(
          _displayNameMeta,
          displayName.isAcceptableOrUnknown(
              data['display_name']!, _displayNameMeta));
    } else if (isInserting) {
      context.missing(_displayNameMeta);
    }
    if (data.containsKey('brand')) {
      context.handle(
          _brandMeta, brand.isAcceptableOrUnknown(data['brand']!, _brandMeta));
    } else if (isInserting) {
      context.missing(_brandMeta);
    }
    if (data.containsKey('model')) {
      context.handle(
          _modelMeta, model.isAcceptableOrUnknown(data['model']!, _modelMeta));
    } else if (isInserting) {
      context.missing(_modelMeta);
    }
    if (data.containsKey('media_json')) {
      context.handle(_mediaJsonMeta,
          mediaJson.isAcceptableOrUnknown(data['media_json']!, _mediaJsonMeta));
    } else if (isInserting) {
      context.missing(_mediaJsonMeta);
    }
    if (data.containsKey('badges_json')) {
      context.handle(
          _badgesJsonMeta,
          badgesJson.isAcceptableOrUnknown(
              data['badges_json']!, _badgesJsonMeta));
    } else if (isInserting) {
      context.missing(_badgesJsonMeta);
    }
    if (data.containsKey('fast_shipping_labels_json')) {
      context.handle(
          _fastShippingLabelsJsonMeta,
          fastShippingLabelsJson.isAcceptableOrUnknown(
              data['fast_shipping_labels_json']!, _fastShippingLabelsJsonMeta));
    } else if (isInserting) {
      context.missing(_fastShippingLabelsJsonMeta);
    }
    if (data.containsKey('events_json')) {
      context.handle(
          _eventsJsonMeta,
          eventsJson.isAcceptableOrUnknown(
              data['events_json']!, _eventsJsonMeta));
    } else if (isInserting) {
      context.missing(_eventsJsonMeta);
    }
    if (data.containsKey('prices_json')) {
      context.handle(
          _pricesJsonMeta,
          pricesJson.isAcceptableOrUnknown(
              data['prices_json']!, _pricesJsonMeta));
    } else if (isInserting) {
      context.missing(_pricesJsonMeta);
    }
    if (data.containsKey('total_reviews')) {
      context.handle(
          _totalReviewsMeta,
          totalReviews.isAcceptableOrUnknown(
              data['total_reviews']!, _totalReviewsMeta));
    } else if (isInserting) {
      context.missing(_totalReviewsMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta));
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    if (data.containsKey('variants_json')) {
      context.handle(
          _variantsJsonMeta,
          variantsJson.isAcceptableOrUnknown(
              data['variants_json']!, _variantsJsonMeta));
    } else if (isInserting) {
      context.missing(_variantsJsonMeta);
    }
    if (data.containsKey('multi_purpose_icon_json')) {
      context.handle(
          _multiPurposeIconJsonMeta,
          multiPurposeIconJson.isAcceptableOrUnknown(
              data['multi_purpose_icon_json']!, _multiPurposeIconJsonMeta));
    } else if (isInserting) {
      context.missing(_multiPurposeIconJsonMeta);
    }
    if (data.containsKey('bank_badge_json')) {
      context.handle(
          _bankBadgeJsonMeta,
          bankBadgeJson.isAcceptableOrUnknown(
              data['bank_badge_json']!, _bankBadgeJsonMeta));
    }
    if (data.containsKey('highlights_json')) {
      context.handle(
          _highlightsJsonMeta,
          highlightsJson.isAcceptableOrUnknown(
              data['highlights_json']!, _highlightsJsonMeta));
    } else if (isInserting) {
      context.missing(_highlightsJsonMeta);
    }
    if (data.containsKey('accumulative_points_json')) {
      context.handle(
          _accumulativePointsJsonMeta,
          accumulativePointsJson.isAcceptableOrUnknown(
              data['accumulative_points_json']!, _accumulativePointsJsonMeta));
    } else if (isInserting) {
      context.missing(_accumulativePointsJsonMeta);
    }
    if (data.containsKey('is_promoted')) {
      context.handle(
          _isPromotedMeta,
          isPromoted.isAcceptableOrUnknown(
              data['is_promoted']!, _isPromotedMeta));
    } else if (isInserting) {
      context.missing(_isPromotedMeta);
    }
    if (data.containsKey('is_international')) {
      context.handle(
          _isInternationalMeta,
          isInternational.isAcceptableOrUnknown(
              data['is_international']!, _isInternationalMeta));
    } else if (isInserting) {
      context.missing(_isInternationalMeta);
    }
    if (data.containsKey('installments_json')) {
      context.handle(
          _installmentsJsonMeta,
          installmentsJson.isAcceptableOrUnknown(
              data['installments_json']!, _installmentsJsonMeta));
    } else if (isInserting) {
      context.missing(_installmentsJsonMeta);
    }
    if (data.containsKey('media_urls_json')) {
      context.handle(
          _mediaUrlsJsonMeta,
          mediaUrlsJson.isAcceptableOrUnknown(
              data['media_urls_json']!, _mediaUrlsJsonMeta));
    } else if (isInserting) {
      context.missing(_mediaUrlsJsonMeta);
    }
    if (data.containsKey('cached_at')) {
      context.handle(_cachedAtMeta,
          cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Product map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Product(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_id'])!,
      merchantCategoryId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}merchant_category_id'])!,
      skuId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sku_id'])!,
      position: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}position'])!,
      isPrimeEligible: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}is_prime_eligible'])!,
      displayName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}display_name'])!,
      brand: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}brand'])!,
      model: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}model'])!,
      mediaJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}media_json'])!,
      badgesJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}badges_json'])!,
      fastShippingLabelsJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}fast_shipping_labels_json'])!,
      eventsJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}events_json'])!,
      pricesJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}prices_json'])!,
      totalReviews: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}total_reviews'])!,
      rating: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}rating'])!,
      variantsJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}variants_json'])!,
      multiPurposeIconJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}multi_purpose_icon_json'])!,
      bankBadgeJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}bank_badge_json']),
      highlightsJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}highlights_json'])!,
      accumulativePointsJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}accumulative_points_json'])!,
      isPromoted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_promoted'])!,
      isInternational: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_international'])!,
      installmentsJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}installments_json'])!,
      mediaUrlsJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}media_urls_json'])!,
      cachedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}cached_at'])!,
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }
}

class Product extends DataClass implements Insertable<Product> {
  final int id;
  final String productId;
  final String merchantCategoryId;
  final String skuId;
  final int position;
  final bool isPrimeEligible;
  final String displayName;
  final String brand;
  final String model;
  final String mediaJson;
  final String badgesJson;
  final String fastShippingLabelsJson;
  final String eventsJson;
  final String pricesJson;
  final String totalReviews;
  final String rating;
  final String variantsJson;
  final String multiPurposeIconJson;
  final String? bankBadgeJson;
  final String highlightsJson;
  final String accumulativePointsJson;
  final bool isPromoted;
  final bool isInternational;
  final String installmentsJson;
  final String mediaUrlsJson;
  final DateTime cachedAt;
  const Product(
      {required this.id,
      required this.productId,
      required this.merchantCategoryId,
      required this.skuId,
      required this.position,
      required this.isPrimeEligible,
      required this.displayName,
      required this.brand,
      required this.model,
      required this.mediaJson,
      required this.badgesJson,
      required this.fastShippingLabelsJson,
      required this.eventsJson,
      required this.pricesJson,
      required this.totalReviews,
      required this.rating,
      required this.variantsJson,
      required this.multiPurposeIconJson,
      this.bankBadgeJson,
      required this.highlightsJson,
      required this.accumulativePointsJson,
      required this.isPromoted,
      required this.isInternational,
      required this.installmentsJson,
      required this.mediaUrlsJson,
      required this.cachedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['product_id'] = Variable<String>(productId);
    map['merchant_category_id'] = Variable<String>(merchantCategoryId);
    map['sku_id'] = Variable<String>(skuId);
    map['position'] = Variable<int>(position);
    map['is_prime_eligible'] = Variable<bool>(isPrimeEligible);
    map['display_name'] = Variable<String>(displayName);
    map['brand'] = Variable<String>(brand);
    map['model'] = Variable<String>(model);
    map['media_json'] = Variable<String>(mediaJson);
    map['badges_json'] = Variable<String>(badgesJson);
    map['fast_shipping_labels_json'] = Variable<String>(fastShippingLabelsJson);
    map['events_json'] = Variable<String>(eventsJson);
    map['prices_json'] = Variable<String>(pricesJson);
    map['total_reviews'] = Variable<String>(totalReviews);
    map['rating'] = Variable<String>(rating);
    map['variants_json'] = Variable<String>(variantsJson);
    map['multi_purpose_icon_json'] = Variable<String>(multiPurposeIconJson);
    if (!nullToAbsent || bankBadgeJson != null) {
      map['bank_badge_json'] = Variable<String>(bankBadgeJson);
    }
    map['highlights_json'] = Variable<String>(highlightsJson);
    map['accumulative_points_json'] = Variable<String>(accumulativePointsJson);
    map['is_promoted'] = Variable<bool>(isPromoted);
    map['is_international'] = Variable<bool>(isInternational);
    map['installments_json'] = Variable<String>(installmentsJson);
    map['media_urls_json'] = Variable<String>(mediaUrlsJson);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      id: Value(id),
      productId: Value(productId),
      merchantCategoryId: Value(merchantCategoryId),
      skuId: Value(skuId),
      position: Value(position),
      isPrimeEligible: Value(isPrimeEligible),
      displayName: Value(displayName),
      brand: Value(brand),
      model: Value(model),
      mediaJson: Value(mediaJson),
      badgesJson: Value(badgesJson),
      fastShippingLabelsJson: Value(fastShippingLabelsJson),
      eventsJson: Value(eventsJson),
      pricesJson: Value(pricesJson),
      totalReviews: Value(totalReviews),
      rating: Value(rating),
      variantsJson: Value(variantsJson),
      multiPurposeIconJson: Value(multiPurposeIconJson),
      bankBadgeJson: bankBadgeJson == null && nullToAbsent
          ? const Value.absent()
          : Value(bankBadgeJson),
      highlightsJson: Value(highlightsJson),
      accumulativePointsJson: Value(accumulativePointsJson),
      isPromoted: Value(isPromoted),
      isInternational: Value(isInternational),
      installmentsJson: Value(installmentsJson),
      mediaUrlsJson: Value(mediaUrlsJson),
      cachedAt: Value(cachedAt),
    );
  }

  factory Product.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Product(
      id: serializer.fromJson<int>(json['id']),
      productId: serializer.fromJson<String>(json['productId']),
      merchantCategoryId:
          serializer.fromJson<String>(json['merchantCategoryId']),
      skuId: serializer.fromJson<String>(json['skuId']),
      position: serializer.fromJson<int>(json['position']),
      isPrimeEligible: serializer.fromJson<bool>(json['isPrimeEligible']),
      displayName: serializer.fromJson<String>(json['displayName']),
      brand: serializer.fromJson<String>(json['brand']),
      model: serializer.fromJson<String>(json['model']),
      mediaJson: serializer.fromJson<String>(json['mediaJson']),
      badgesJson: serializer.fromJson<String>(json['badgesJson']),
      fastShippingLabelsJson:
          serializer.fromJson<String>(json['fastShippingLabelsJson']),
      eventsJson: serializer.fromJson<String>(json['eventsJson']),
      pricesJson: serializer.fromJson<String>(json['pricesJson']),
      totalReviews: serializer.fromJson<String>(json['totalReviews']),
      rating: serializer.fromJson<String>(json['rating']),
      variantsJson: serializer.fromJson<String>(json['variantsJson']),
      multiPurposeIconJson:
          serializer.fromJson<String>(json['multiPurposeIconJson']),
      bankBadgeJson: serializer.fromJson<String?>(json['bankBadgeJson']),
      highlightsJson: serializer.fromJson<String>(json['highlightsJson']),
      accumulativePointsJson:
          serializer.fromJson<String>(json['accumulativePointsJson']),
      isPromoted: serializer.fromJson<bool>(json['isPromoted']),
      isInternational: serializer.fromJson<bool>(json['isInternational']),
      installmentsJson: serializer.fromJson<String>(json['installmentsJson']),
      mediaUrlsJson: serializer.fromJson<String>(json['mediaUrlsJson']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'productId': serializer.toJson<String>(productId),
      'merchantCategoryId': serializer.toJson<String>(merchantCategoryId),
      'skuId': serializer.toJson<String>(skuId),
      'position': serializer.toJson<int>(position),
      'isPrimeEligible': serializer.toJson<bool>(isPrimeEligible),
      'displayName': serializer.toJson<String>(displayName),
      'brand': serializer.toJson<String>(brand),
      'model': serializer.toJson<String>(model),
      'mediaJson': serializer.toJson<String>(mediaJson),
      'badgesJson': serializer.toJson<String>(badgesJson),
      'fastShippingLabelsJson':
          serializer.toJson<String>(fastShippingLabelsJson),
      'eventsJson': serializer.toJson<String>(eventsJson),
      'pricesJson': serializer.toJson<String>(pricesJson),
      'totalReviews': serializer.toJson<String>(totalReviews),
      'rating': serializer.toJson<String>(rating),
      'variantsJson': serializer.toJson<String>(variantsJson),
      'multiPurposeIconJson': serializer.toJson<String>(multiPurposeIconJson),
      'bankBadgeJson': serializer.toJson<String?>(bankBadgeJson),
      'highlightsJson': serializer.toJson<String>(highlightsJson),
      'accumulativePointsJson':
          serializer.toJson<String>(accumulativePointsJson),
      'isPromoted': serializer.toJson<bool>(isPromoted),
      'isInternational': serializer.toJson<bool>(isInternational),
      'installmentsJson': serializer.toJson<String>(installmentsJson),
      'mediaUrlsJson': serializer.toJson<String>(mediaUrlsJson),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  Product copyWith(
          {int? id,
          String? productId,
          String? merchantCategoryId,
          String? skuId,
          int? position,
          bool? isPrimeEligible,
          String? displayName,
          String? brand,
          String? model,
          String? mediaJson,
          String? badgesJson,
          String? fastShippingLabelsJson,
          String? eventsJson,
          String? pricesJson,
          String? totalReviews,
          String? rating,
          String? variantsJson,
          String? multiPurposeIconJson,
          Value<String?> bankBadgeJson = const Value.absent(),
          String? highlightsJson,
          String? accumulativePointsJson,
          bool? isPromoted,
          bool? isInternational,
          String? installmentsJson,
          String? mediaUrlsJson,
          DateTime? cachedAt}) =>
      Product(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        merchantCategoryId: merchantCategoryId ?? this.merchantCategoryId,
        skuId: skuId ?? this.skuId,
        position: position ?? this.position,
        isPrimeEligible: isPrimeEligible ?? this.isPrimeEligible,
        displayName: displayName ?? this.displayName,
        brand: brand ?? this.brand,
        model: model ?? this.model,
        mediaJson: mediaJson ?? this.mediaJson,
        badgesJson: badgesJson ?? this.badgesJson,
        fastShippingLabelsJson:
            fastShippingLabelsJson ?? this.fastShippingLabelsJson,
        eventsJson: eventsJson ?? this.eventsJson,
        pricesJson: pricesJson ?? this.pricesJson,
        totalReviews: totalReviews ?? this.totalReviews,
        rating: rating ?? this.rating,
        variantsJson: variantsJson ?? this.variantsJson,
        multiPurposeIconJson: multiPurposeIconJson ?? this.multiPurposeIconJson,
        bankBadgeJson:
            bankBadgeJson.present ? bankBadgeJson.value : this.bankBadgeJson,
        highlightsJson: highlightsJson ?? this.highlightsJson,
        accumulativePointsJson:
            accumulativePointsJson ?? this.accumulativePointsJson,
        isPromoted: isPromoted ?? this.isPromoted,
        isInternational: isInternational ?? this.isInternational,
        installmentsJson: installmentsJson ?? this.installmentsJson,
        mediaUrlsJson: mediaUrlsJson ?? this.mediaUrlsJson,
        cachedAt: cachedAt ?? this.cachedAt,
      );
  Product copyWithCompanion(ProductsCompanion data) {
    return Product(
      id: data.id.present ? data.id.value : this.id,
      productId: data.productId.present ? data.productId.value : this.productId,
      merchantCategoryId: data.merchantCategoryId.present
          ? data.merchantCategoryId.value
          : this.merchantCategoryId,
      skuId: data.skuId.present ? data.skuId.value : this.skuId,
      position: data.position.present ? data.position.value : this.position,
      isPrimeEligible: data.isPrimeEligible.present
          ? data.isPrimeEligible.value
          : this.isPrimeEligible,
      displayName:
          data.displayName.present ? data.displayName.value : this.displayName,
      brand: data.brand.present ? data.brand.value : this.brand,
      model: data.model.present ? data.model.value : this.model,
      mediaJson: data.mediaJson.present ? data.mediaJson.value : this.mediaJson,
      badgesJson:
          data.badgesJson.present ? data.badgesJson.value : this.badgesJson,
      fastShippingLabelsJson: data.fastShippingLabelsJson.present
          ? data.fastShippingLabelsJson.value
          : this.fastShippingLabelsJson,
      eventsJson:
          data.eventsJson.present ? data.eventsJson.value : this.eventsJson,
      pricesJson:
          data.pricesJson.present ? data.pricesJson.value : this.pricesJson,
      totalReviews: data.totalReviews.present
          ? data.totalReviews.value
          : this.totalReviews,
      rating: data.rating.present ? data.rating.value : this.rating,
      variantsJson: data.variantsJson.present
          ? data.variantsJson.value
          : this.variantsJson,
      multiPurposeIconJson: data.multiPurposeIconJson.present
          ? data.multiPurposeIconJson.value
          : this.multiPurposeIconJson,
      bankBadgeJson: data.bankBadgeJson.present
          ? data.bankBadgeJson.value
          : this.bankBadgeJson,
      highlightsJson: data.highlightsJson.present
          ? data.highlightsJson.value
          : this.highlightsJson,
      accumulativePointsJson: data.accumulativePointsJson.present
          ? data.accumulativePointsJson.value
          : this.accumulativePointsJson,
      isPromoted:
          data.isPromoted.present ? data.isPromoted.value : this.isPromoted,
      isInternational: data.isInternational.present
          ? data.isInternational.value
          : this.isInternational,
      installmentsJson: data.installmentsJson.present
          ? data.installmentsJson.value
          : this.installmentsJson,
      mediaUrlsJson: data.mediaUrlsJson.present
          ? data.mediaUrlsJson.value
          : this.mediaUrlsJson,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Product(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('merchantCategoryId: $merchantCategoryId, ')
          ..write('skuId: $skuId, ')
          ..write('position: $position, ')
          ..write('isPrimeEligible: $isPrimeEligible, ')
          ..write('displayName: $displayName, ')
          ..write('brand: $brand, ')
          ..write('model: $model, ')
          ..write('mediaJson: $mediaJson, ')
          ..write('badgesJson: $badgesJson, ')
          ..write('fastShippingLabelsJson: $fastShippingLabelsJson, ')
          ..write('eventsJson: $eventsJson, ')
          ..write('pricesJson: $pricesJson, ')
          ..write('totalReviews: $totalReviews, ')
          ..write('rating: $rating, ')
          ..write('variantsJson: $variantsJson, ')
          ..write('multiPurposeIconJson: $multiPurposeIconJson, ')
          ..write('bankBadgeJson: $bankBadgeJson, ')
          ..write('highlightsJson: $highlightsJson, ')
          ..write('accumulativePointsJson: $accumulativePointsJson, ')
          ..write('isPromoted: $isPromoted, ')
          ..write('isInternational: $isInternational, ')
          ..write('installmentsJson: $installmentsJson, ')
          ..write('mediaUrlsJson: $mediaUrlsJson, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        productId,
        merchantCategoryId,
        skuId,
        position,
        isPrimeEligible,
        displayName,
        brand,
        model,
        mediaJson,
        badgesJson,
        fastShippingLabelsJson,
        eventsJson,
        pricesJson,
        totalReviews,
        rating,
        variantsJson,
        multiPurposeIconJson,
        bankBadgeJson,
        highlightsJson,
        accumulativePointsJson,
        isPromoted,
        isInternational,
        installmentsJson,
        mediaUrlsJson,
        cachedAt
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          other.id == this.id &&
          other.productId == this.productId &&
          other.merchantCategoryId == this.merchantCategoryId &&
          other.skuId == this.skuId &&
          other.position == this.position &&
          other.isPrimeEligible == this.isPrimeEligible &&
          other.displayName == this.displayName &&
          other.brand == this.brand &&
          other.model == this.model &&
          other.mediaJson == this.mediaJson &&
          other.badgesJson == this.badgesJson &&
          other.fastShippingLabelsJson == this.fastShippingLabelsJson &&
          other.eventsJson == this.eventsJson &&
          other.pricesJson == this.pricesJson &&
          other.totalReviews == this.totalReviews &&
          other.rating == this.rating &&
          other.variantsJson == this.variantsJson &&
          other.multiPurposeIconJson == this.multiPurposeIconJson &&
          other.bankBadgeJson == this.bankBadgeJson &&
          other.highlightsJson == this.highlightsJson &&
          other.accumulativePointsJson == this.accumulativePointsJson &&
          other.isPromoted == this.isPromoted &&
          other.isInternational == this.isInternational &&
          other.installmentsJson == this.installmentsJson &&
          other.mediaUrlsJson == this.mediaUrlsJson &&
          other.cachedAt == this.cachedAt);
}

class ProductsCompanion extends UpdateCompanion<Product> {
  final Value<int> id;
  final Value<String> productId;
  final Value<String> merchantCategoryId;
  final Value<String> skuId;
  final Value<int> position;
  final Value<bool> isPrimeEligible;
  final Value<String> displayName;
  final Value<String> brand;
  final Value<String> model;
  final Value<String> mediaJson;
  final Value<String> badgesJson;
  final Value<String> fastShippingLabelsJson;
  final Value<String> eventsJson;
  final Value<String> pricesJson;
  final Value<String> totalReviews;
  final Value<String> rating;
  final Value<String> variantsJson;
  final Value<String> multiPurposeIconJson;
  final Value<String?> bankBadgeJson;
  final Value<String> highlightsJson;
  final Value<String> accumulativePointsJson;
  final Value<bool> isPromoted;
  final Value<bool> isInternational;
  final Value<String> installmentsJson;
  final Value<String> mediaUrlsJson;
  final Value<DateTime> cachedAt;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.merchantCategoryId = const Value.absent(),
    this.skuId = const Value.absent(),
    this.position = const Value.absent(),
    this.isPrimeEligible = const Value.absent(),
    this.displayName = const Value.absent(),
    this.brand = const Value.absent(),
    this.model = const Value.absent(),
    this.mediaJson = const Value.absent(),
    this.badgesJson = const Value.absent(),
    this.fastShippingLabelsJson = const Value.absent(),
    this.eventsJson = const Value.absent(),
    this.pricesJson = const Value.absent(),
    this.totalReviews = const Value.absent(),
    this.rating = const Value.absent(),
    this.variantsJson = const Value.absent(),
    this.multiPurposeIconJson = const Value.absent(),
    this.bankBadgeJson = const Value.absent(),
    this.highlightsJson = const Value.absent(),
    this.accumulativePointsJson = const Value.absent(),
    this.isPromoted = const Value.absent(),
    this.isInternational = const Value.absent(),
    this.installmentsJson = const Value.absent(),
    this.mediaUrlsJson = const Value.absent(),
    this.cachedAt = const Value.absent(),
  });
  ProductsCompanion.insert({
    this.id = const Value.absent(),
    required String productId,
    required String merchantCategoryId,
    required String skuId,
    required int position,
    required bool isPrimeEligible,
    required String displayName,
    required String brand,
    required String model,
    required String mediaJson,
    required String badgesJson,
    required String fastShippingLabelsJson,
    required String eventsJson,
    required String pricesJson,
    required String totalReviews,
    required String rating,
    required String variantsJson,
    required String multiPurposeIconJson,
    this.bankBadgeJson = const Value.absent(),
    required String highlightsJson,
    required String accumulativePointsJson,
    required bool isPromoted,
    required bool isInternational,
    required String installmentsJson,
    required String mediaUrlsJson,
    this.cachedAt = const Value.absent(),
  })  : productId = Value(productId),
        merchantCategoryId = Value(merchantCategoryId),
        skuId = Value(skuId),
        position = Value(position),
        isPrimeEligible = Value(isPrimeEligible),
        displayName = Value(displayName),
        brand = Value(brand),
        model = Value(model),
        mediaJson = Value(mediaJson),
        badgesJson = Value(badgesJson),
        fastShippingLabelsJson = Value(fastShippingLabelsJson),
        eventsJson = Value(eventsJson),
        pricesJson = Value(pricesJson),
        totalReviews = Value(totalReviews),
        rating = Value(rating),
        variantsJson = Value(variantsJson),
        multiPurposeIconJson = Value(multiPurposeIconJson),
        highlightsJson = Value(highlightsJson),
        accumulativePointsJson = Value(accumulativePointsJson),
        isPromoted = Value(isPromoted),
        isInternational = Value(isInternational),
        installmentsJson = Value(installmentsJson),
        mediaUrlsJson = Value(mediaUrlsJson);
  static Insertable<Product> custom({
    Expression<int>? id,
    Expression<String>? productId,
    Expression<String>? merchantCategoryId,
    Expression<String>? skuId,
    Expression<int>? position,
    Expression<bool>? isPrimeEligible,
    Expression<String>? displayName,
    Expression<String>? brand,
    Expression<String>? model,
    Expression<String>? mediaJson,
    Expression<String>? badgesJson,
    Expression<String>? fastShippingLabelsJson,
    Expression<String>? eventsJson,
    Expression<String>? pricesJson,
    Expression<String>? totalReviews,
    Expression<String>? rating,
    Expression<String>? variantsJson,
    Expression<String>? multiPurposeIconJson,
    Expression<String>? bankBadgeJson,
    Expression<String>? highlightsJson,
    Expression<String>? accumulativePointsJson,
    Expression<bool>? isPromoted,
    Expression<bool>? isInternational,
    Expression<String>? installmentsJson,
    Expression<String>? mediaUrlsJson,
    Expression<DateTime>? cachedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productId != null) 'product_id': productId,
      if (merchantCategoryId != null)
        'merchant_category_id': merchantCategoryId,
      if (skuId != null) 'sku_id': skuId,
      if (position != null) 'position': position,
      if (isPrimeEligible != null) 'is_prime_eligible': isPrimeEligible,
      if (displayName != null) 'display_name': displayName,
      if (brand != null) 'brand': brand,
      if (model != null) 'model': model,
      if (mediaJson != null) 'media_json': mediaJson,
      if (badgesJson != null) 'badges_json': badgesJson,
      if (fastShippingLabelsJson != null)
        'fast_shipping_labels_json': fastShippingLabelsJson,
      if (eventsJson != null) 'events_json': eventsJson,
      if (pricesJson != null) 'prices_json': pricesJson,
      if (totalReviews != null) 'total_reviews': totalReviews,
      if (rating != null) 'rating': rating,
      if (variantsJson != null) 'variants_json': variantsJson,
      if (multiPurposeIconJson != null)
        'multi_purpose_icon_json': multiPurposeIconJson,
      if (bankBadgeJson != null) 'bank_badge_json': bankBadgeJson,
      if (highlightsJson != null) 'highlights_json': highlightsJson,
      if (accumulativePointsJson != null)
        'accumulative_points_json': accumulativePointsJson,
      if (isPromoted != null) 'is_promoted': isPromoted,
      if (isInternational != null) 'is_international': isInternational,
      if (installmentsJson != null) 'installments_json': installmentsJson,
      if (mediaUrlsJson != null) 'media_urls_json': mediaUrlsJson,
      if (cachedAt != null) 'cached_at': cachedAt,
    });
  }

  ProductsCompanion copyWith(
      {Value<int>? id,
      Value<String>? productId,
      Value<String>? merchantCategoryId,
      Value<String>? skuId,
      Value<int>? position,
      Value<bool>? isPrimeEligible,
      Value<String>? displayName,
      Value<String>? brand,
      Value<String>? model,
      Value<String>? mediaJson,
      Value<String>? badgesJson,
      Value<String>? fastShippingLabelsJson,
      Value<String>? eventsJson,
      Value<String>? pricesJson,
      Value<String>? totalReviews,
      Value<String>? rating,
      Value<String>? variantsJson,
      Value<String>? multiPurposeIconJson,
      Value<String?>? bankBadgeJson,
      Value<String>? highlightsJson,
      Value<String>? accumulativePointsJson,
      Value<bool>? isPromoted,
      Value<bool>? isInternational,
      Value<String>? installmentsJson,
      Value<String>? mediaUrlsJson,
      Value<DateTime>? cachedAt}) {
    return ProductsCompanion(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      merchantCategoryId: merchantCategoryId ?? this.merchantCategoryId,
      skuId: skuId ?? this.skuId,
      position: position ?? this.position,
      isPrimeEligible: isPrimeEligible ?? this.isPrimeEligible,
      displayName: displayName ?? this.displayName,
      brand: brand ?? this.brand,
      model: model ?? this.model,
      mediaJson: mediaJson ?? this.mediaJson,
      badgesJson: badgesJson ?? this.badgesJson,
      fastShippingLabelsJson:
          fastShippingLabelsJson ?? this.fastShippingLabelsJson,
      eventsJson: eventsJson ?? this.eventsJson,
      pricesJson: pricesJson ?? this.pricesJson,
      totalReviews: totalReviews ?? this.totalReviews,
      rating: rating ?? this.rating,
      variantsJson: variantsJson ?? this.variantsJson,
      multiPurposeIconJson: multiPurposeIconJson ?? this.multiPurposeIconJson,
      bankBadgeJson: bankBadgeJson ?? this.bankBadgeJson,
      highlightsJson: highlightsJson ?? this.highlightsJson,
      accumulativePointsJson:
          accumulativePointsJson ?? this.accumulativePointsJson,
      isPromoted: isPromoted ?? this.isPromoted,
      isInternational: isInternational ?? this.isInternational,
      installmentsJson: installmentsJson ?? this.installmentsJson,
      mediaUrlsJson: mediaUrlsJson ?? this.mediaUrlsJson,
      cachedAt: cachedAt ?? this.cachedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (merchantCategoryId.present) {
      map['merchant_category_id'] = Variable<String>(merchantCategoryId.value);
    }
    if (skuId.present) {
      map['sku_id'] = Variable<String>(skuId.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (isPrimeEligible.present) {
      map['is_prime_eligible'] = Variable<bool>(isPrimeEligible.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (brand.present) {
      map['brand'] = Variable<String>(brand.value);
    }
    if (model.present) {
      map['model'] = Variable<String>(model.value);
    }
    if (mediaJson.present) {
      map['media_json'] = Variable<String>(mediaJson.value);
    }
    if (badgesJson.present) {
      map['badges_json'] = Variable<String>(badgesJson.value);
    }
    if (fastShippingLabelsJson.present) {
      map['fast_shipping_labels_json'] =
          Variable<String>(fastShippingLabelsJson.value);
    }
    if (eventsJson.present) {
      map['events_json'] = Variable<String>(eventsJson.value);
    }
    if (pricesJson.present) {
      map['prices_json'] = Variable<String>(pricesJson.value);
    }
    if (totalReviews.present) {
      map['total_reviews'] = Variable<String>(totalReviews.value);
    }
    if (rating.present) {
      map['rating'] = Variable<String>(rating.value);
    }
    if (variantsJson.present) {
      map['variants_json'] = Variable<String>(variantsJson.value);
    }
    if (multiPurposeIconJson.present) {
      map['multi_purpose_icon_json'] =
          Variable<String>(multiPurposeIconJson.value);
    }
    if (bankBadgeJson.present) {
      map['bank_badge_json'] = Variable<String>(bankBadgeJson.value);
    }
    if (highlightsJson.present) {
      map['highlights_json'] = Variable<String>(highlightsJson.value);
    }
    if (accumulativePointsJson.present) {
      map['accumulative_points_json'] =
          Variable<String>(accumulativePointsJson.value);
    }
    if (isPromoted.present) {
      map['is_promoted'] = Variable<bool>(isPromoted.value);
    }
    if (isInternational.present) {
      map['is_international'] = Variable<bool>(isInternational.value);
    }
    if (installmentsJson.present) {
      map['installments_json'] = Variable<String>(installmentsJson.value);
    }
    if (mediaUrlsJson.present) {
      map['media_urls_json'] = Variable<String>(mediaUrlsJson.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('merchantCategoryId: $merchantCategoryId, ')
          ..write('skuId: $skuId, ')
          ..write('position: $position, ')
          ..write('isPrimeEligible: $isPrimeEligible, ')
          ..write('displayName: $displayName, ')
          ..write('brand: $brand, ')
          ..write('model: $model, ')
          ..write('mediaJson: $mediaJson, ')
          ..write('badgesJson: $badgesJson, ')
          ..write('fastShippingLabelsJson: $fastShippingLabelsJson, ')
          ..write('eventsJson: $eventsJson, ')
          ..write('pricesJson: $pricesJson, ')
          ..write('totalReviews: $totalReviews, ')
          ..write('rating: $rating, ')
          ..write('variantsJson: $variantsJson, ')
          ..write('multiPurposeIconJson: $multiPurposeIconJson, ')
          ..write('bankBadgeJson: $bankBadgeJson, ')
          ..write('highlightsJson: $highlightsJson, ')
          ..write('accumulativePointsJson: $accumulativePointsJson, ')
          ..write('isPromoted: $isPromoted, ')
          ..write('isInternational: $isInternational, ')
          ..write('installmentsJson: $installmentsJson, ')
          ..write('mediaUrlsJson: $mediaUrlsJson, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }
}

class $CartItemsTable extends CartItems
    with TableInfo<$CartItemsTable, CartItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CartItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
      'product_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES products (id)'));
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _addedAtMeta =
      const VerificationMeta('addedAt');
  @override
  late final GeneratedColumn<DateTime> addedAt = GeneratedColumn<DateTime>(
      'added_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, productId, quantity, addedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cart_items';
  @override
  VerificationContext validateIntegrity(Insertable<CartItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('added_at')) {
      context.handle(_addedAtMeta,
          addedAt.isAcceptableOrUnknown(data['added_at']!, _addedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CartItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CartItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_id'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      addedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}added_at'])!,
    );
  }

  @override
  $CartItemsTable createAlias(String alias) {
    return $CartItemsTable(attachedDatabase, alias);
  }
}

class CartItem extends DataClass implements Insertable<CartItem> {
  final int id;
  final int productId;
  final int quantity;
  final DateTime addedAt;
  const CartItem(
      {required this.id,
      required this.productId,
      required this.quantity,
      required this.addedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['product_id'] = Variable<int>(productId);
    map['quantity'] = Variable<int>(quantity);
    map['added_at'] = Variable<DateTime>(addedAt);
    return map;
  }

  CartItemsCompanion toCompanion(bool nullToAbsent) {
    return CartItemsCompanion(
      id: Value(id),
      productId: Value(productId),
      quantity: Value(quantity),
      addedAt: Value(addedAt),
    );
  }

  factory CartItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CartItem(
      id: serializer.fromJson<int>(json['id']),
      productId: serializer.fromJson<int>(json['productId']),
      quantity: serializer.fromJson<int>(json['quantity']),
      addedAt: serializer.fromJson<DateTime>(json['addedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'productId': serializer.toJson<int>(productId),
      'quantity': serializer.toJson<int>(quantity),
      'addedAt': serializer.toJson<DateTime>(addedAt),
    };
  }

  CartItem copyWith(
          {int? id, int? productId, int? quantity, DateTime? addedAt}) =>
      CartItem(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        quantity: quantity ?? this.quantity,
        addedAt: addedAt ?? this.addedAt,
      );
  CartItem copyWithCompanion(CartItemsCompanion data) {
    return CartItem(
      id: data.id.present ? data.id.value : this.id,
      productId: data.productId.present ? data.productId.value : this.productId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      addedAt: data.addedAt.present ? data.addedAt.value : this.addedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CartItem(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('quantity: $quantity, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, productId, quantity, addedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CartItem &&
          other.id == this.id &&
          other.productId == this.productId &&
          other.quantity == this.quantity &&
          other.addedAt == this.addedAt);
}

class CartItemsCompanion extends UpdateCompanion<CartItem> {
  final Value<int> id;
  final Value<int> productId;
  final Value<int> quantity;
  final Value<DateTime> addedAt;
  const CartItemsCompanion({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.addedAt = const Value.absent(),
  });
  CartItemsCompanion.insert({
    this.id = const Value.absent(),
    required int productId,
    required int quantity,
    this.addedAt = const Value.absent(),
  })  : productId = Value(productId),
        quantity = Value(quantity);
  static Insertable<CartItem> custom({
    Expression<int>? id,
    Expression<int>? productId,
    Expression<int>? quantity,
    Expression<DateTime>? addedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productId != null) 'product_id': productId,
      if (quantity != null) 'quantity': quantity,
      if (addedAt != null) 'added_at': addedAt,
    });
  }

  CartItemsCompanion copyWith(
      {Value<int>? id,
      Value<int>? productId,
      Value<int>? quantity,
      Value<DateTime>? addedAt}) {
    return CartItemsCompanion(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      addedAt: addedAt ?? this.addedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (addedAt.present) {
      map['added_at'] = Variable<DateTime>(addedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CartItemsCompanion(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('quantity: $quantity, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProductsTable products = $ProductsTable(this);
  late final $CartItemsTable cartItems = $CartItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [products, cartItems];
}

typedef $$ProductsTableCreateCompanionBuilder = ProductsCompanion Function({
  Value<int> id,
  required String productId,
  required String merchantCategoryId,
  required String skuId,
  required int position,
  required bool isPrimeEligible,
  required String displayName,
  required String brand,
  required String model,
  required String mediaJson,
  required String badgesJson,
  required String fastShippingLabelsJson,
  required String eventsJson,
  required String pricesJson,
  required String totalReviews,
  required String rating,
  required String variantsJson,
  required String multiPurposeIconJson,
  Value<String?> bankBadgeJson,
  required String highlightsJson,
  required String accumulativePointsJson,
  required bool isPromoted,
  required bool isInternational,
  required String installmentsJson,
  required String mediaUrlsJson,
  Value<DateTime> cachedAt,
});
typedef $$ProductsTableUpdateCompanionBuilder = ProductsCompanion Function({
  Value<int> id,
  Value<String> productId,
  Value<String> merchantCategoryId,
  Value<String> skuId,
  Value<int> position,
  Value<bool> isPrimeEligible,
  Value<String> displayName,
  Value<String> brand,
  Value<String> model,
  Value<String> mediaJson,
  Value<String> badgesJson,
  Value<String> fastShippingLabelsJson,
  Value<String> eventsJson,
  Value<String> pricesJson,
  Value<String> totalReviews,
  Value<String> rating,
  Value<String> variantsJson,
  Value<String> multiPurposeIconJson,
  Value<String?> bankBadgeJson,
  Value<String> highlightsJson,
  Value<String> accumulativePointsJson,
  Value<bool> isPromoted,
  Value<bool> isInternational,
  Value<String> installmentsJson,
  Value<String> mediaUrlsJson,
  Value<DateTime> cachedAt,
});

final class $$ProductsTableReferences
    extends BaseReferences<_$AppDatabase, $ProductsTable, Product> {
  $$ProductsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CartItemsTable, List<CartItem>>
      _cartItemsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.cartItems,
              aliasName:
                  $_aliasNameGenerator(db.products.id, db.cartItems.productId));

  $$CartItemsTableProcessedTableManager get cartItemsRefs {
    final manager = $$CartItemsTableTableManager($_db, $_db.cartItems)
        .filter((f) => f.productId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_cartItemsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ProductsTableFilterComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get merchantCategoryId => $composableBuilder(
      column: $table.merchantCategoryId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get skuId => $composableBuilder(
      column: $table.skuId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get position => $composableBuilder(
      column: $table.position, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isPrimeEligible => $composableBuilder(
      column: $table.isPrimeEligible,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get brand => $composableBuilder(
      column: $table.brand, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get model => $composableBuilder(
      column: $table.model, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mediaJson => $composableBuilder(
      column: $table.mediaJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get badgesJson => $composableBuilder(
      column: $table.badgesJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fastShippingLabelsJson => $composableBuilder(
      column: $table.fastShippingLabelsJson,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get eventsJson => $composableBuilder(
      column: $table.eventsJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get pricesJson => $composableBuilder(
      column: $table.pricesJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get totalReviews => $composableBuilder(
      column: $table.totalReviews, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get rating => $composableBuilder(
      column: $table.rating, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get variantsJson => $composableBuilder(
      column: $table.variantsJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get multiPurposeIconJson => $composableBuilder(
      column: $table.multiPurposeIconJson,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get bankBadgeJson => $composableBuilder(
      column: $table.bankBadgeJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get highlightsJson => $composableBuilder(
      column: $table.highlightsJson,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get accumulativePointsJson => $composableBuilder(
      column: $table.accumulativePointsJson,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isPromoted => $composableBuilder(
      column: $table.isPromoted, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isInternational => $composableBuilder(
      column: $table.isInternational,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get installmentsJson => $composableBuilder(
      column: $table.installmentsJson,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mediaUrlsJson => $composableBuilder(
      column: $table.mediaUrlsJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
      column: $table.cachedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> cartItemsRefs(
      Expression<bool> Function($$CartItemsTableFilterComposer f) f) {
    final $$CartItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.cartItems,
        getReferencedColumn: (t) => t.productId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CartItemsTableFilterComposer(
              $db: $db,
              $table: $db.cartItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ProductsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get merchantCategoryId => $composableBuilder(
      column: $table.merchantCategoryId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get skuId => $composableBuilder(
      column: $table.skuId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get position => $composableBuilder(
      column: $table.position, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isPrimeEligible => $composableBuilder(
      column: $table.isPrimeEligible,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get brand => $composableBuilder(
      column: $table.brand, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get model => $composableBuilder(
      column: $table.model, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mediaJson => $composableBuilder(
      column: $table.mediaJson, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get badgesJson => $composableBuilder(
      column: $table.badgesJson, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fastShippingLabelsJson => $composableBuilder(
      column: $table.fastShippingLabelsJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get eventsJson => $composableBuilder(
      column: $table.eventsJson, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get pricesJson => $composableBuilder(
      column: $table.pricesJson, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get totalReviews => $composableBuilder(
      column: $table.totalReviews,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get rating => $composableBuilder(
      column: $table.rating, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get variantsJson => $composableBuilder(
      column: $table.variantsJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get multiPurposeIconJson => $composableBuilder(
      column: $table.multiPurposeIconJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get bankBadgeJson => $composableBuilder(
      column: $table.bankBadgeJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get highlightsJson => $composableBuilder(
      column: $table.highlightsJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get accumulativePointsJson => $composableBuilder(
      column: $table.accumulativePointsJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isPromoted => $composableBuilder(
      column: $table.isPromoted, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isInternational => $composableBuilder(
      column: $table.isInternational,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get installmentsJson => $composableBuilder(
      column: $table.installmentsJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mediaUrlsJson => $composableBuilder(
      column: $table.mediaUrlsJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
      column: $table.cachedAt, builder: (column) => ColumnOrderings(column));
}

class $$ProductsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<String> get merchantCategoryId => $composableBuilder(
      column: $table.merchantCategoryId, builder: (column) => column);

  GeneratedColumn<String> get skuId =>
      $composableBuilder(column: $table.skuId, builder: (column) => column);

  GeneratedColumn<int> get position =>
      $composableBuilder(column: $table.position, builder: (column) => column);

  GeneratedColumn<bool> get isPrimeEligible => $composableBuilder(
      column: $table.isPrimeEligible, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => column);

  GeneratedColumn<String> get brand =>
      $composableBuilder(column: $table.brand, builder: (column) => column);

  GeneratedColumn<String> get model =>
      $composableBuilder(column: $table.model, builder: (column) => column);

  GeneratedColumn<String> get mediaJson =>
      $composableBuilder(column: $table.mediaJson, builder: (column) => column);

  GeneratedColumn<String> get badgesJson => $composableBuilder(
      column: $table.badgesJson, builder: (column) => column);

  GeneratedColumn<String> get fastShippingLabelsJson => $composableBuilder(
      column: $table.fastShippingLabelsJson, builder: (column) => column);

  GeneratedColumn<String> get eventsJson => $composableBuilder(
      column: $table.eventsJson, builder: (column) => column);

  GeneratedColumn<String> get pricesJson => $composableBuilder(
      column: $table.pricesJson, builder: (column) => column);

  GeneratedColumn<String> get totalReviews => $composableBuilder(
      column: $table.totalReviews, builder: (column) => column);

  GeneratedColumn<String> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<String> get variantsJson => $composableBuilder(
      column: $table.variantsJson, builder: (column) => column);

  GeneratedColumn<String> get multiPurposeIconJson => $composableBuilder(
      column: $table.multiPurposeIconJson, builder: (column) => column);

  GeneratedColumn<String> get bankBadgeJson => $composableBuilder(
      column: $table.bankBadgeJson, builder: (column) => column);

  GeneratedColumn<String> get highlightsJson => $composableBuilder(
      column: $table.highlightsJson, builder: (column) => column);

  GeneratedColumn<String> get accumulativePointsJson => $composableBuilder(
      column: $table.accumulativePointsJson, builder: (column) => column);

  GeneratedColumn<bool> get isPromoted => $composableBuilder(
      column: $table.isPromoted, builder: (column) => column);

  GeneratedColumn<bool> get isInternational => $composableBuilder(
      column: $table.isInternational, builder: (column) => column);

  GeneratedColumn<String> get installmentsJson => $composableBuilder(
      column: $table.installmentsJson, builder: (column) => column);

  GeneratedColumn<String> get mediaUrlsJson => $composableBuilder(
      column: $table.mediaUrlsJson, builder: (column) => column);

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);

  Expression<T> cartItemsRefs<T extends Object>(
      Expression<T> Function($$CartItemsTableAnnotationComposer a) f) {
    final $$CartItemsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.cartItems,
        getReferencedColumn: (t) => t.productId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CartItemsTableAnnotationComposer(
              $db: $db,
              $table: $db.cartItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ProductsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProductsTable,
    Product,
    $$ProductsTableFilterComposer,
    $$ProductsTableOrderingComposer,
    $$ProductsTableAnnotationComposer,
    $$ProductsTableCreateCompanionBuilder,
    $$ProductsTableUpdateCompanionBuilder,
    (Product, $$ProductsTableReferences),
    Product,
    PrefetchHooks Function({bool cartItemsRefs})> {
  $$ProductsTableTableManager(_$AppDatabase db, $ProductsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> productId = const Value.absent(),
            Value<String> merchantCategoryId = const Value.absent(),
            Value<String> skuId = const Value.absent(),
            Value<int> position = const Value.absent(),
            Value<bool> isPrimeEligible = const Value.absent(),
            Value<String> displayName = const Value.absent(),
            Value<String> brand = const Value.absent(),
            Value<String> model = const Value.absent(),
            Value<String> mediaJson = const Value.absent(),
            Value<String> badgesJson = const Value.absent(),
            Value<String> fastShippingLabelsJson = const Value.absent(),
            Value<String> eventsJson = const Value.absent(),
            Value<String> pricesJson = const Value.absent(),
            Value<String> totalReviews = const Value.absent(),
            Value<String> rating = const Value.absent(),
            Value<String> variantsJson = const Value.absent(),
            Value<String> multiPurposeIconJson = const Value.absent(),
            Value<String?> bankBadgeJson = const Value.absent(),
            Value<String> highlightsJson = const Value.absent(),
            Value<String> accumulativePointsJson = const Value.absent(),
            Value<bool> isPromoted = const Value.absent(),
            Value<bool> isInternational = const Value.absent(),
            Value<String> installmentsJson = const Value.absent(),
            Value<String> mediaUrlsJson = const Value.absent(),
            Value<DateTime> cachedAt = const Value.absent(),
          }) =>
              ProductsCompanion(
            id: id,
            productId: productId,
            merchantCategoryId: merchantCategoryId,
            skuId: skuId,
            position: position,
            isPrimeEligible: isPrimeEligible,
            displayName: displayName,
            brand: brand,
            model: model,
            mediaJson: mediaJson,
            badgesJson: badgesJson,
            fastShippingLabelsJson: fastShippingLabelsJson,
            eventsJson: eventsJson,
            pricesJson: pricesJson,
            totalReviews: totalReviews,
            rating: rating,
            variantsJson: variantsJson,
            multiPurposeIconJson: multiPurposeIconJson,
            bankBadgeJson: bankBadgeJson,
            highlightsJson: highlightsJson,
            accumulativePointsJson: accumulativePointsJson,
            isPromoted: isPromoted,
            isInternational: isInternational,
            installmentsJson: installmentsJson,
            mediaUrlsJson: mediaUrlsJson,
            cachedAt: cachedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String productId,
            required String merchantCategoryId,
            required String skuId,
            required int position,
            required bool isPrimeEligible,
            required String displayName,
            required String brand,
            required String model,
            required String mediaJson,
            required String badgesJson,
            required String fastShippingLabelsJson,
            required String eventsJson,
            required String pricesJson,
            required String totalReviews,
            required String rating,
            required String variantsJson,
            required String multiPurposeIconJson,
            Value<String?> bankBadgeJson = const Value.absent(),
            required String highlightsJson,
            required String accumulativePointsJson,
            required bool isPromoted,
            required bool isInternational,
            required String installmentsJson,
            required String mediaUrlsJson,
            Value<DateTime> cachedAt = const Value.absent(),
          }) =>
              ProductsCompanion.insert(
            id: id,
            productId: productId,
            merchantCategoryId: merchantCategoryId,
            skuId: skuId,
            position: position,
            isPrimeEligible: isPrimeEligible,
            displayName: displayName,
            brand: brand,
            model: model,
            mediaJson: mediaJson,
            badgesJson: badgesJson,
            fastShippingLabelsJson: fastShippingLabelsJson,
            eventsJson: eventsJson,
            pricesJson: pricesJson,
            totalReviews: totalReviews,
            rating: rating,
            variantsJson: variantsJson,
            multiPurposeIconJson: multiPurposeIconJson,
            bankBadgeJson: bankBadgeJson,
            highlightsJson: highlightsJson,
            accumulativePointsJson: accumulativePointsJson,
            isPromoted: isPromoted,
            isInternational: isInternational,
            installmentsJson: installmentsJson,
            mediaUrlsJson: mediaUrlsJson,
            cachedAt: cachedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$ProductsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({cartItemsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (cartItemsRefs) db.cartItems],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (cartItemsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$ProductsTableReferences._cartItemsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ProductsTableReferences(db, table, p0)
                                .cartItemsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.productId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ProductsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ProductsTable,
    Product,
    $$ProductsTableFilterComposer,
    $$ProductsTableOrderingComposer,
    $$ProductsTableAnnotationComposer,
    $$ProductsTableCreateCompanionBuilder,
    $$ProductsTableUpdateCompanionBuilder,
    (Product, $$ProductsTableReferences),
    Product,
    PrefetchHooks Function({bool cartItemsRefs})>;
typedef $$CartItemsTableCreateCompanionBuilder = CartItemsCompanion Function({
  Value<int> id,
  required int productId,
  required int quantity,
  Value<DateTime> addedAt,
});
typedef $$CartItemsTableUpdateCompanionBuilder = CartItemsCompanion Function({
  Value<int> id,
  Value<int> productId,
  Value<int> quantity,
  Value<DateTime> addedAt,
});

final class $$CartItemsTableReferences
    extends BaseReferences<_$AppDatabase, $CartItemsTable, CartItem> {
  $$CartItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProductsTable _productIdTable(_$AppDatabase db) =>
      db.products.createAlias(
          $_aliasNameGenerator(db.cartItems.productId, db.products.id));

  $$ProductsTableProcessedTableManager? get productId {
    if ($_item.productId == null) return null;
    final manager = $$ProductsTableTableManager($_db, $_db.products)
        .filter((f) => f.id($_item.productId!));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$CartItemsTableFilterComposer
    extends Composer<_$AppDatabase, $CartItemsTable> {
  $$CartItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get addedAt => $composableBuilder(
      column: $table.addedAt, builder: (column) => ColumnFilters(column));

  $$ProductsTableFilterComposer get productId {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $db.products,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsTableFilterComposer(
              $db: $db,
              $table: $db.products,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CartItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $CartItemsTable> {
  $$CartItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get addedAt => $composableBuilder(
      column: $table.addedAt, builder: (column) => ColumnOrderings(column));

  $$ProductsTableOrderingComposer get productId {
    final $$ProductsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $db.products,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsTableOrderingComposer(
              $db: $db,
              $table: $db.products,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CartItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CartItemsTable> {
  $$CartItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<DateTime> get addedAt =>
      $composableBuilder(column: $table.addedAt, builder: (column) => column);

  $$ProductsTableAnnotationComposer get productId {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $db.products,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsTableAnnotationComposer(
              $db: $db,
              $table: $db.products,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CartItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CartItemsTable,
    CartItem,
    $$CartItemsTableFilterComposer,
    $$CartItemsTableOrderingComposer,
    $$CartItemsTableAnnotationComposer,
    $$CartItemsTableCreateCompanionBuilder,
    $$CartItemsTableUpdateCompanionBuilder,
    (CartItem, $$CartItemsTableReferences),
    CartItem,
    PrefetchHooks Function({bool productId})> {
  $$CartItemsTableTableManager(_$AppDatabase db, $CartItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CartItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CartItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CartItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> productId = const Value.absent(),
            Value<int> quantity = const Value.absent(),
            Value<DateTime> addedAt = const Value.absent(),
          }) =>
              CartItemsCompanion(
            id: id,
            productId: productId,
            quantity: quantity,
            addedAt: addedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int productId,
            required int quantity,
            Value<DateTime> addedAt = const Value.absent(),
          }) =>
              CartItemsCompanion.insert(
            id: id,
            productId: productId,
            quantity: quantity,
            addedAt: addedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CartItemsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({productId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (productId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.productId,
                    referencedTable:
                        $$CartItemsTableReferences._productIdTable(db),
                    referencedColumn:
                        $$CartItemsTableReferences._productIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$CartItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CartItemsTable,
    CartItem,
    $$CartItemsTableFilterComposer,
    $$CartItemsTableOrderingComposer,
    $$CartItemsTableAnnotationComposer,
    $$CartItemsTableCreateCompanionBuilder,
    $$CartItemsTableUpdateCompanionBuilder,
    (CartItem, $$CartItemsTableReferences),
    CartItem,
    PrefetchHooks Function({bool productId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db, _db.products);
  $$CartItemsTableTableManager get cartItems =>
      $$CartItemsTableTableManager(_db, _db.cartItems);
}
