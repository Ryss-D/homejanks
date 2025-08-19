import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product{
  final String productId;
  final String merchantCategoryId;
  final String skuId;
  final String position;
  final bool isPrimeEligible;
  final String displayName;
  final String brand;
  final String model;
  final MediaModel media;
  final List<String> badges;
  final FastShippingLabelsModel fastShippingLabels;
  final List<EventModel> events;
  final List<PriceModel> prices;
  final String totalReviews;
  final String rating;
  final List<String> variants;
  final Map<String, dynamic> multiPurposeIcon;
  final BankBadgeModel? bankBadge;
  final List<HighlightModel> highlights;
  final List<String> accumulativePoints;
  final bool isPromoted;
  final String isInternational;
  final Map<String, dynamic> installments;
  final List<String> mediaUrls;

  const Product({
    required this.productId,
    required this.merchantCategoryId,
    required this.skuId,
    required this.position,
    required this.isPrimeEligible,
    required this.displayName,
    required this.brand,
    required this.model,
    required this.media,
    required this.badges,
    required this.fastShippingLabels,
    required this.events,
    required this.prices,
    required this.totalReviews,
    required this.rating,
    required this.variants,
    required this.multiPurposeIcon,
    required this.bankBadge,
    required this.highlights,
    required this.accumulativePoints,
    required this.isPromoted,
    required this.isInternational,
    required this.installments,
    required this.mediaUrls,
  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);

}

@JsonSerializable()
class MediaModel {
  final String id;
  final String type;
  final String onImageHover;

  const MediaModel({
    required this.id,
    required this.type,
    required this.onImageHover,
  });

  factory MediaModel.fromJson(Map<String, dynamic> json) => _$MediaModelFromJson(json);
  Map<String, dynamic> toJson() => _$MediaModelToJson(this);

}

@JsonSerializable()
class FastShippingLabelsModel {
  @JsonKey(name: 'hd_same_day_zones')
  final bool hdSameDayZones;
  @JsonKey(name: 'hd_next_day_zones')
  final bool hdNextDayZones;
  @JsonKey(name: 'cc_same_day_zones')
  final bool ccSameDayZones;
  @JsonKey(name: 'cc_next_day_zones')
  final bool ccNextDayZones;

  const FastShippingLabelsModel({
    required this.hdSameDayZones,
    required this.hdNextDayZones,
    required this.ccSameDayZones,
    required this.ccNextDayZones,
  });

  factory FastShippingLabelsModel.fromJson(Map<String, dynamic> json) => _$FastShippingLabelsModelFromJson(json);
  Map<String, dynamic> toJson() => _$FastShippingLabelsModelToJson(this);

}

@JsonSerializable()
class EventModel {
  final String description;
  final String value;

  const EventModel({
    required this.description,
    required this.value,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) => _$EventModelFromJson(json);
  Map<String, dynamic> toJson() => _$EventModelToJson(this);

}

@JsonSerializable()
class PriceModel {
  final String label;
  final String type;
  final String symbol;
  final String price;
  final String unit;
  final int priceWithoutFormatting;

  const PriceModel({
    required this.label,
    required this.type,
    required this.symbol,
    required this.price,
    required this.unit,
    required this.priceWithoutFormatting,
  });

  factory PriceModel.fromJson(Map<String, dynamic> json) => _$PriceModelFromJson(json);
  Map<String, dynamic> toJson() => _$PriceModelToJson(this);

}

@JsonSerializable()
class BankBadgeModel {
  final String type;
  final String value;

  const BankBadgeModel({
    required this.type,
    required this.value,
  });

  factory BankBadgeModel.fromJson(Map<String, dynamic> json) => _$BankBadgeModelFromJson(json);
  Map<String, dynamic> toJson() => _$BankBadgeModelToJson(this);

}

@JsonSerializable()
class HighlightModel {
  final String key;
  final String value;

  const HighlightModel({
    required this.key,
    required this.value,
  });

  factory HighlightModel.fromJson(Map<String, dynamic> json) => _$HighlightModelFromJson(json);
  Map<String, dynamic> toJson() => _$HighlightModelToJson(this);

}
