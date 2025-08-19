import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_event.freezed.dart';

@freezed
class ProductEvent with _$ProductEvent {
  const factory ProductEvent.loadProducts() = LoadProducts;
  
  const factory ProductEvent.refreshProducts() = RefreshProducts;
  
  const factory ProductEvent.searchProducts({
    required String query,
  }) = SearchProducts;
  
  const factory ProductEvent.loadProductsByCategory({
    required String category,
  }) = LoadProductsByCategory;
}
