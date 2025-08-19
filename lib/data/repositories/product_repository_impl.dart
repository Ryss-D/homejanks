import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/models/product.dart';
import '../../core/error/failures.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_local_data_source.dart';
import '../datasources/product_remote_data_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;

  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      // Check if we have valid cached data
      final hasValidCache = await localDataSource.hasValidCache();
      
      if (hasValidCache) {
        // Return cached data
        final cachedProducts = await localDataSource.getCachedProducts();
        return Right(cachedProducts);
      }
      
      // Fetch from API if no valid cache
      final remoteProducts = await remoteDataSource.getProducts();
      
      // Cache the results
      await localDataSource.cacheProducts(remoteProducts);
      
      return Right(remoteProducts);
    } catch (e) {
      // If API fails, try to return cached data even if expired
      try {
        final cachedProducts = await localDataSource.getCachedProducts();
        if (cachedProducts.isNotEmpty) {
          return Right(cachedProducts);
        }
      } catch (_) {
        // Ignore cache errors
      }
      
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Product>>> searchProducts(String query) async {
    try {
      // Check if we have valid cached data
      final hasValidCache = await localDataSource.hasValidCache();
      
      if (hasValidCache) {
        // Search in cached data
        final cachedResults = await localDataSource.searchCachedProducts(query);
        return Right(cachedResults);
      }
      
      // If no cache, first get all products (which will cache them)
      final allProductsResult = await getProducts();
      
      return allProductsResult.fold(
        (failure) => Left(failure),
        (products) {
          // Filter products locally
          final filteredProducts = products.where((product) =>
            product.displayName.toLowerCase().contains(query.toLowerCase()) ||
            product.brand.toLowerCase().contains(query.toLowerCase()) ||
            product.model.toLowerCase().contains(query.toLowerCase())
          ).toList();
          
          return Right(filteredProducts);
        },
      );
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Product>> getProduct(int id) async {
    try {
      // Get all products first (from cache or API)
      final productsResult = await getProducts();
      
      return productsResult.fold(
        (failure) => Left(failure),
        (products) {
          try {
            final product = products.firstWhere(
              (product) => int.tryParse(product.productId) == id,
            );
            return Right(product);
          } catch (e) {
            return Left(ServerFailure());
          }
        },
      );
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getProductsByCategory(String category) async {
    try {
      // Get all products first (from cache or API)
      final productsResult = await getProducts();
      
      return productsResult.fold(
        (failure) => Left(failure),
        (products) {
          final filteredProducts = products
              .where((product) => product.merchantCategoryId == category)
              .toList();
          
          return Right(filteredProducts);
        },
      );
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<String>>> getCategories() async {
    try {
      // Get products first (from cache or API)
      final productsResult = await getProducts();
      
      return productsResult.fold(
        (failure) => Left(failure),
        (products) {
          // Extract unique categories
          final categories = products
              .map((product) => product.merchantCategoryId)
              .toSet()
              .toList();
          
          return Right(categories);
        },
      );
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
