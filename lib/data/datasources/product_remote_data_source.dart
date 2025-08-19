import 'package:dio/dio.dart';
import 'package:ecommerce_app/data/models/product.dart';
import 'package:retrofit/retrofit.dart';

part 'product_remote_data_source.g.dart';

@RestApi(baseUrl: "https://fakestoreapi.com")
abstract class ProductRemoteDataSource {
  factory ProductRemoteDataSource(Dio dio, {String baseUrl}) = _ProductRemoteDataSource;

  @GET("/products")
  Future<List<Product>> getProducts();

  @GET("/products/{id}")
  Future<Product> getProduct(@Path("id") int id);

  @GET("/products/categories")
  Future<List<String>> getCategories();

  @GET("/products/category/{category}")
  Future<List<Product>> getProductsByCategory(@Path("category") String category);
}
