import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/models/product.dart';
import '../../core/error/failures.dart';
import '../repositories/product_repository.dart';

class GetProducts {
  final ProductRepository repository;

  GetProducts(this.repository);

  Future<Either<Failure, List<Product>>> call() async {
    return await repository.getProducts();
  }
}
