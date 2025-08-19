import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../data/models/cart_item.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = CartInitial;
  
  const factory CartState.loading() = CartLoading;
  
  const factory CartState.loaded({
    required List<CartItem> items,
  }) = CartLoaded;
  
  const factory CartState.error({
    required String message,
  }) = CartError;
}

extension CartStateExtension on CartState {
  int get totalItems => maybeWhen(
    loaded: (items) => items.fold(0, (sum, item) => sum + item.quantity),
    orElse: () => 0,
  );

  double get totalPrice => maybeWhen(
    loaded: (items) => items.fold(0.0, (sum, item) {
      final price = item.product.prices.isNotEmpty 
          ? item.product.prices.first.priceWithoutFormatting / 100.0 
          : 0.0;
      return sum + (price * item.quantity);
    }),
    orElse: () => 0.0,
  );
}
