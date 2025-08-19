import 'package:freezed_annotation/freezed_annotation.dart';
import '../../models/product.dart';

part 'product_state.freezed.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = ProductInitial;
  
  const factory ProductState.loading() = ProductLoading;
  
  const factory ProductState.loaded({
    required List<Product> products,
    required List<String> categories,
  }) = ProductLoaded;
  
  const factory ProductState.searchLoaded({
    required List<Product> products,
  }) = ProductSearchLoaded;
  
  const factory ProductState.error({
    required String message,
  }) = ProductError;
}
