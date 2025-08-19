// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      productId: json['productId'] as String,
      merchantCategoryId: json['merchantCategoryId'] as String,
      skuId: json['skuId'] as String,
      position: json['position'] as String,
      isPrimeEligible: json['isPrimeEligible'] as bool,
      displayName: json['displayName'] as String,
      brand: json['brand'] as String,
      model: json['model'] as String,
      media: MediaModel.fromJson(json['media'] as Map<String, dynamic>),
      badges:
          (json['badges'] as List<dynamic>).map((e) => e as String).toList(),
      fastShippingLabels: FastShippingLabelsModel.fromJson(
          json['fastShippingLabels'] as Map<String, dynamic>),
      events: (json['events'] as List<dynamic>)
          .map((e) => EventModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      prices: (json['prices'] as List<dynamic>)
          .map((e) => PriceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalReviews: json['totalReviews'] as String,
      rating: json['rating'] as String,
      variants:
          (json['variants'] as List<dynamic>).map((e) => e as String).toList(),
      multiPurposeIcon: json['multiPurposeIcon'] as Map<String, dynamic>,
      bankBadge: json['bankBadge'] == null
          ? null
          : BankBadgeModel.fromJson(json['bankBadge'] as Map<String, dynamic>),
      highlights: (json['highlights'] as List<dynamic>)
          .map((e) => HighlightModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      accumulativePoints: (json['accumulativePoints'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      isPromoted: json['isPromoted'] as bool,
      isInternational: json['isInternational'] as String,
      installments: json['installments'] as Map<String, dynamic>,
      mediaUrls:
          (json['mediaUrls'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'productId': instance.productId,
      'merchantCategoryId': instance.merchantCategoryId,
      'skuId': instance.skuId,
      'position': instance.position,
      'isPrimeEligible': instance.isPrimeEligible,
      'displayName': instance.displayName,
      'brand': instance.brand,
      'model': instance.model,
      'media': instance.media,
      'badges': instance.badges,
      'fastShippingLabels': instance.fastShippingLabels,
      'events': instance.events,
      'prices': instance.prices,
      'totalReviews': instance.totalReviews,
      'rating': instance.rating,
      'variants': instance.variants,
      'multiPurposeIcon': instance.multiPurposeIcon,
      'bankBadge': instance.bankBadge,
      'highlights': instance.highlights,
      'accumulativePoints': instance.accumulativePoints,
      'isPromoted': instance.isPromoted,
      'isInternational': instance.isInternational,
      'installments': instance.installments,
      'mediaUrls': instance.mediaUrls,
    };

MediaModel _$MediaModelFromJson(Map<String, dynamic> json) => MediaModel(
      id: json['id'] as String,
      type: json['type'] as String,
      onImageHover: json['onImageHover'] as String,
    );

Map<String, dynamic> _$MediaModelToJson(MediaModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'onImageHover': instance.onImageHover,
    };

FastShippingLabelsModel _$FastShippingLabelsModelFromJson(
        Map<String, dynamic> json) =>
    FastShippingLabelsModel(
      hdSameDayZones: json['hd_same_day_zones'] as bool,
      hdNextDayZones: json['hd_next_day_zones'] as bool,
      ccSameDayZones: json['cc_same_day_zones'] as bool,
      ccNextDayZones: json['cc_next_day_zones'] as bool,
    );

Map<String, dynamic> _$FastShippingLabelsModelToJson(
        FastShippingLabelsModel instance) =>
    <String, dynamic>{
      'hd_same_day_zones': instance.hdSameDayZones,
      'hd_next_day_zones': instance.hdNextDayZones,
      'cc_same_day_zones': instance.ccSameDayZones,
      'cc_next_day_zones': instance.ccNextDayZones,
    };

EventModel _$EventModelFromJson(Map<String, dynamic> json) => EventModel(
      description: json['description'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$EventModelToJson(EventModel instance) =>
    <String, dynamic>{
      'description': instance.description,
      'value': instance.value,
    };

PriceModel _$PriceModelFromJson(Map<String, dynamic> json) => PriceModel(
      label: json['label'] as String,
      type: json['type'] as String,
      symbol: json['symbol'] as String,
      price: json['price'] as String,
      unit: json['unit'] as String,
      priceWithoutFormatting: (json['priceWithoutFormatting'] as num).toInt(),
    );

Map<String, dynamic> _$PriceModelToJson(PriceModel instance) =>
    <String, dynamic>{
      'label': instance.label,
      'type': instance.type,
      'symbol': instance.symbol,
      'price': instance.price,
      'unit': instance.unit,
      'priceWithoutFormatting': instance.priceWithoutFormatting,
    };

BankBadgeModel _$BankBadgeModelFromJson(Map<String, dynamic> json) =>
    BankBadgeModel(
      type: json['type'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$BankBadgeModelToJson(BankBadgeModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'value': instance.value,
    };

HighlightModel _$HighlightModelFromJson(Map<String, dynamic> json) =>
    HighlightModel(
      key: json['key'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$HighlightModelToJson(HighlightModel instance) =>
    <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
    };
