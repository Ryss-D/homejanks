import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/models/product.dart';
import 'package:ecommerce_app/data/models/cart.dart';
import '../../core/error/failures.dart';
import 'cart_repository.dart';
import '../datasources/cart_local_data_source.dart';

class CartRepositoryImpl implements CartRepository {
  final CartLocalDataSource localDataSource;

  CartRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, Cart>> getCart() async {
    try {
      final cartItems = await localDataSource.getCartItems();
      return Right(Cart(items: cartItems));
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> addToCart(Product product, int quantity) async {
    try {
      await localDataSource.addToCart(product, quantity);
      return Right(unit);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> removeFromCart(String productId) async {
    try {
      await localDataSource.removeFromCart(productId);
      return Right(unit);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateCartItemQuantity(String productId, int quantity) async {
    try {
      await localDataSource.updateCartItemQuantity(productId, quantity);
      return Right(unit);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> clearCart() async {
    try {
      await localDataSource.clearCart();
      return Right(unit);
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}
