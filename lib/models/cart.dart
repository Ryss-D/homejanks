import 'package:freezed_annotation/freezed_annotation.dart';
import 'cart_item.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
class Cart with _$Cart {
  const factory Cart({
    required List<CartItem> items,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}
