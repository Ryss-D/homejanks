import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import '../../data/database/app_database.dart';
import '../../data/datasources/cart_local_data_source.dart';
import '../../data/datasources/product_local_data_source.dart';
import '../../data/datasources/product_remote_data_source.dart';
import '../../data/repositories/cart_repository_impl.dart';
import '../../data/repositories/product_repository_impl.dart';
import '../../domain/repositories/cart_repository.dart';
import '../../domain/repositories/product_repository.dart';
import '../../domain/usecases/cart_usecases.dart';
import '../../domain/usecases/get_products.dart';
import '../../blocs/cart/cart_bloc.dart';
import '../../blocs/product/product_bloc.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // Database
  getIt.registerSingleton<AppDatabase>(AppDatabase());

  // Dio
  getIt.registerSingleton<Dio>(Dio());

  // Data Sources
  getIt.registerSingleton<CartLocalDataSource>(
    CartLocalDataSourceImpl(getIt<AppDatabase>()),
  );

  getIt.registerSingleton<ProductLocalDataSource>(
    ProductLocalDataSourceImpl(getIt<AppDatabase>()),
  );

  getIt.registerSingleton<ProductRemoteDataSource>(
    ProductRemoteDataSource(getIt<Dio>()),
  );

  // Repositories
  getIt.registerSingleton<CartRepository>(
    CartRepositoryImpl(
      localDataSource: getIt<CartLocalDataSource>(),
    ),
  );

  getIt.registerSingleton<ProductRepository>(
    ProductRepositoryImpl(
      remoteDataSource: getIt<ProductRemoteDataSource>(),
      localDataSource: getIt<ProductLocalDataSource>(),
    ),
  );

  // Use Cases
  getIt.registerSingleton<GetCart>(
    GetCart(getIt<CartRepository>()),
  );

  getIt.registerSingleton<AddToCart>(
    AddToCart(getIt<CartRepository>()),
  );

  getIt.registerSingleton<RemoveFromCart>(
    RemoveFromCart(getIt<CartRepository>()),
  );

  getIt.registerSingleton<UpdateCartItemQuantity>(
    UpdateCartItemQuantity(getIt<CartRepository>()),
  );

  getIt.registerSingleton<ClearCart>(
    ClearCart(getIt<CartRepository>()),
  );

  getIt.registerSingleton<GetProducts>(
    GetProducts(getIt<ProductRepository>()),
  );

  // BLoCs
  getIt.registerFactory<CartBloc>(
    () => CartBloc(
      getCart: getIt<GetCart>(),
      addToCart: getIt<AddToCart>(),
      removeFromCart: getIt<RemoveFromCart>(),
      updateCartItemQuantity: getIt<UpdateCartItemQuantity>(),
      clearCart: getIt<ClearCart>(),
    ),
  );

  getIt.registerFactory<ProductBloc>(
    () => ProductBloc(
      getProducts: getIt<GetProducts>(),
    ),
  );
}
