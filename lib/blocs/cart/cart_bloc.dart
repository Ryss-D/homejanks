import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import '../../domain/usecases/cart_usecases.dart' as usecases;
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final usecases.GetCart getCart;
  final usecases.AddToCart addToCart;
  final usecases.RemoveFromCart removeFromCart;
  final usecases.UpdateCartItemQuantity updateCartItemQuantity;
  final usecases.ClearCart clearCart;
  final Logger _logger = Logger();

  CartBloc({
    required this.getCart,
    required this.addToCart,
    required this.removeFromCart,
    required this.updateCartItemQuantity,
    required this.clearCart,
  }) : super(const CartState.initial()) {
    on<LoadCart>(_onLoadCart);
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<UpdateCartItemQuantity>(_onUpdateCartItemQuantity);
    on<ClearCart>(_onClearCart);
  }

  Future<void> _onLoadCart(
    LoadCart event,
    Emitter<CartState> emit,
  ) async {
    try {
      emit(const CartState.loading());

      final result = await getCart();
      result.fold(
        (failure) => emit(const CartState.error(message: 'Failed to load cart')),
        (cart) {
          emit(CartState.loaded(items: cart.items));
        },
      );
    } catch (e) {
      _logger.e('Error loading cart: $e');
      emit(CartState.error(message: 'Failed to load cart: ${e.toString()}'));
    }
  }

  Future<void> _onAddToCart(
    AddToCart event,
    Emitter<CartState> emit,
  ) async {
    try {
      final result = await addToCart(event.product, event.quantity);
      result.fold(
        (failure) => emit(const CartState.error(message: 'Failed to add item to cart')),
        (_) => add(const CartEvent.loadCart()),
      );
    } catch (e) {
      _logger.e('Error adding to cart: $e');
      emit(CartState.error(message: 'Failed to add item to cart: ${e.toString()}'));
    }
  }

  Future<void> _onRemoveFromCart(
    RemoveFromCart event,
    Emitter<CartState> emit,
  ) async {
    try {
      final result = await removeFromCart(event.productId);
      result.fold(
        (failure) => emit(const CartState.error(message: 'Failed to remove item from cart')),
        (_) => add(const CartEvent.loadCart()),
      );
    } catch (e) {
      _logger.e('Error removing from cart: $e');
      emit(CartState.error(message: 'Failed to remove item from cart: ${e.toString()}'));
    }
  }

  Future<void> _onUpdateCartItemQuantity(
    UpdateCartItemQuantity event,
    Emitter<CartState> emit,
  ) async {
    try {
      if (event.quantity <= 0) {
        final result = await removeFromCart(event.productId);
        result.fold(
          (failure) => emit(const CartState.error(message: 'Failed to remove item from cart')),
          (_) => add(const CartEvent.loadCart()),
        );
      } else {
        final result = await updateCartItemQuantity(event.productId, event.quantity);
        result.fold(
          (failure) => emit(const CartState.error(message: 'Failed to update item quantity')),
          (_) => add(const CartEvent.loadCart()),
        );
      }
    } catch (e) {
      _logger.e('Error updating cart item quantity: $e');
      emit(CartState.error(message: 'Failed to update item quantity: ${e.toString()}'));
    }
  }

  Future<void> _onClearCart(
    ClearCart event,
    Emitter<CartState> emit,
  ) async {
    try {
      final result = await clearCart();
      result.fold(
        (failure) => emit(const CartState.error(message: 'Failed to clear cart')),
        (_) => emit(const CartState.loaded(items: [])),
      );
    } catch (e) {
      _logger.e('Error clearing cart: $e');
      emit(CartState.error(message: 'Failed to clear cart: ${e.toString()}'));
    }
  }
}
