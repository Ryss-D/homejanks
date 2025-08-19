import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/models/product.dart';
import 'package:ecommerce_app/data/models/cart.dart';
import '../../core/error/failures.dart';
import '../../data/repositories/cart_repository.dart';

class GetCart {
  final CartRepository repository;

  GetCart(this.repository);

  Future<Either<Failure, Cart>> call() async {
    return await repository.getCart();
  }
}

class AddToCart {
  final CartRepository repository;

  AddToCart(this.repository);

  Future<Either<Failure, Unit>> call(Product product, int quantity) async {
    return await repository.addToCart(product, quantity);
  }
}

class RemoveFromCart {
  final CartRepository repository;

  RemoveFromCart(this.repository);

  Future<Either<Failure, Unit>> call(String productId) async {
    return await repository.removeFromCart(productId);
  }
}

class UpdateCartItemQuantity {
  final CartRepository repository;

  UpdateCartItemQuantity(this.repository);

  Future<Either<Failure, Unit>> call(String productId, int quantity) async {
    return await repository.updateCartItemQuantity(productId, quantity);
  }
}

class ClearCart {
  final CartRepository repository;

  ClearCart(this.repository);

  Future<Either<Failure, Unit>> call() async {
    return await repository.clearCart();
  }
}
