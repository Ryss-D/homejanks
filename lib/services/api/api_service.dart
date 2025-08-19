import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';
import '../../data/models/product.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://www.homecenter.com.co/s/search/v1/soco")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  //TODO: implement plain getting producs
  @GET("/products")
  Future<List<Product>> getProducts();

  //TODO: implement right query parameters
  @GET("/products/?priceGroup=10&q={id}&currenpage=1")
  Future<Product> getProduct(@Path("id") int id);

  @GET("/products/categories")
  Future<List<String>> getCategories();

  @GET("/products/category/{category}")
  Future<List<Product>> getProductsByCategory(@Path("category") String category);
}

class ApiClient {
  static const String baseUrl = "https://www.homecenter.com.co/s/search/v1/soco";
  late final Dio _dio;
  late final ApiService _apiService;

  ApiClient() {
    _dio = Dio();
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 30);
    
    // Add interceptors for logging
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      logPrint: (object) => debugPrint(object.toString()),
    ));

    _apiService = ApiService(_dio);
  }

  ApiService get apiService => _apiService;
}
