import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import '../../usecases/get_products.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProducts getProducts;
  final Logger _logger = Logger();

  ProductBloc({
    required this.getProducts,
  }) : super(const ProductState.initial()) {
    on<LoadProducts>(_onLoadProducts);
    on<RefreshProducts>(_onRefreshProducts);
    on<SearchProducts>(_onSearchProducts);
    on<LoadProductsByCategory>(_onLoadProductsByCategory);
  }

  Future<void> _onLoadProducts(
    LoadProducts event,
    Emitter<ProductState> emit,
  ) async {
    try {
      emit(const ProductState.loading());

      final result = await getProducts();
      result.fold(
        (failure) => emit(const ProductState.error(message: 'Failed to load products')),
        (products) {
          final categories = _extractCategories(products);
          emit(ProductState.loaded(products: products, categories: categories));
        },
      );
    } catch (e) {
      _logger.e('Error loading products: $e');
      emit(ProductState.error(message: 'Failed to load products: ${e.toString()}'));
    }
  }

  Future<void> _onRefreshProducts(
    RefreshProducts event,
    Emitter<ProductState> emit,
  ) async {
    try {
      final result = await getProducts();
      result.fold(
        (failure) => emit(const ProductState.error(message: 'Failed to refresh products')),
        (products) {
          final categories = _extractCategories(products);
          emit(ProductState.loaded(products: products, categories: categories));
        },
      );
    } catch (e) {
      _logger.e('Error refreshing products: $e');
      emit(ProductState.error(message: 'Failed to refresh products: ${e.toString()}'));
    }
  }

  Future<void> _onSearchProducts(
    SearchProducts event,
    Emitter<ProductState> emit,
  ) async {
    try {
      emit(const ProductState.loading());

      final result = await getProducts();
      result.fold(
        (failure) => emit(const ProductState.error(message: 'Failed to search products')),
        (products) {
          final filteredProducts = products.where((product) =>
            product.displayName.toLowerCase().contains(event.query.toLowerCase()) ||
            product.brand.toLowerCase().contains(event.query.toLowerCase()) ||
            product.model.toLowerCase().contains(event.query.toLowerCase())
          ).toList();
          
          emit(ProductState.searchLoaded(products: filteredProducts));
        },
      );
    } catch (e) {
      _logger.e('Error searching products: $e');
      emit(ProductState.error(message: 'Failed to search products: ${e.toString()}'));
    }
  }

  Future<void> _onLoadProductsByCategory(
    LoadProductsByCategory event,
    Emitter<ProductState> emit,
  ) async {
    try {
      emit(const ProductState.loading());

      final result = await getProducts();
      result.fold(
        (failure) => emit(const ProductState.error(message: 'Failed to load products by category')),
        (products) {
          final filteredProducts = products.where((product) =>
            product.merchantCategoryId == event.category
          ).toList();
          
          final categories = _extractCategories(products);
          emit(ProductState.loaded(products: filteredProducts, categories: categories));
        },
      );
    } catch (e) {
      _logger.e('Error loading products by category: $e');
      emit(ProductState.error(message: 'Failed to load products by category: ${e.toString()}'));
    }
  }

  List<String> _extractCategories(List<dynamic> products) {
    return products
        .map((product) => product.merchantCategoryId as String)
        .toSet()
        .toList();
  }
}
