import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../data/models/product.dart';

part 'cart_event.freezed.dart';

@freezed
class CartEvent with _$CartEvent {
  const factory CartEvent.loadCart() = LoadCart;
  
  const factory CartEvent.addToCart({
    required Product product,
    required int quantity,
  }) = AddToCart;
  
  const factory CartEvent.removeFromCart({
    required String productId,
  }) = RemoveFromCart;
  
  const factory CartEvent.updateCartItemQuantity({
    required String productId,
    required int quantity,
  }) = UpdateCartItemQuantity;
  
  const factory CartEvent.clearCart() = ClearCart;
}
