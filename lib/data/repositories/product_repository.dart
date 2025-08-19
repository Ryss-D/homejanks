import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/models/product.dart';
import '../../core/error/failures.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProducts();
  Future<Either<Failure, Product>> getProduct(int id);
  Future<Either<Failure, List<String>>> getCategories();
  Future<Either<Failure, List<Product>>> getProductsByCategory(String category);
  Future<Either<Failure, List<Product>>> searchProducts(String query);
}
