import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/models/product.dart';
import 'package:ecommerce_app/data/models/cart.dart';
import '../../core/error/failures.dart';

abstract class CartRepository {
  Future<Either<Failure, Cart>> getCart();
  Future<Either<Failure, Unit>> addToCart(Product product, int quantity);
  Future<Either<Failure, Unit>> removeFromCart(String productId);
  Future<Either<Failure, Unit>> updateCartItemQuantity(String productId, int quantity);
  Future<Either<Failure, Unit>> clearCart();
}
