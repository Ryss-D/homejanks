import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/models/product.dart';
import '../../core/error/failures.dart';
import '../../data/repositories/product_repository.dart';

class GetProducts {
  final ProductRepository repository;

  GetProducts(this.repository);

  Future<Either<Failure, List<Product>>> call() async {
    return await repository.getProducts();
  }
}
