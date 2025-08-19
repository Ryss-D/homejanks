// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadProducts,
    required TResult Function() refreshProducts,
    required TResult Function(String query) searchProducts,
    required TResult Function(String category) loadProductsByCategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadProducts,
    TResult? Function()? refreshProducts,
    TResult? Function(String query)? searchProducts,
    TResult? Function(String category)? loadProductsByCategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadProducts,
    TResult Function()? refreshProducts,
    TResult Function(String query)? searchProducts,
    TResult Function(String category)? loadProductsByCategory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProducts value) loadProducts,
    required TResult Function(RefreshProducts value) refreshProducts,
    required TResult Function(SearchProducts value) searchProducts,
    required TResult Function(LoadProductsByCategory value)
        loadProductsByCategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProducts value)? loadProducts,
    TResult? Function(RefreshProducts value)? refreshProducts,
    TResult? Function(SearchProducts value)? searchProducts,
    TResult? Function(LoadProductsByCategory value)? loadProductsByCategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProducts value)? loadProducts,
    TResult Function(RefreshProducts value)? refreshProducts,
    TResult Function(SearchProducts value)? searchProducts,
    TResult Function(LoadProductsByCategory value)? loadProductsByCategory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductEventCopyWith<$Res> {
  factory $ProductEventCopyWith(
          ProductEvent value, $Res Function(ProductEvent) then) =
      _$ProductEventCopyWithImpl<$Res, ProductEvent>;
}

/// @nodoc
class _$ProductEventCopyWithImpl<$Res, $Val extends ProductEvent>
    implements $ProductEventCopyWith<$Res> {
  _$ProductEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadProductsImplCopyWith<$Res> {
  factory _$$LoadProductsImplCopyWith(
          _$LoadProductsImpl value, $Res Function(_$LoadProductsImpl) then) =
      __$$LoadProductsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadProductsImplCopyWithImpl<$Res>
    extends _$ProductEventCopyWithImpl<$Res, _$LoadProductsImpl>
    implements _$$LoadProductsImplCopyWith<$Res> {
  __$$LoadProductsImplCopyWithImpl(
      _$LoadProductsImpl _value, $Res Function(_$LoadProductsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadProductsImpl implements LoadProducts {
  const _$LoadProductsImpl();

  @override
  String toString() {
    return 'ProductEvent.loadProducts()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadProductsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadProducts,
    required TResult Function() refreshProducts,
    required TResult Function(String query) searchProducts,
    required TResult Function(String category) loadProductsByCategory,
  }) {
    return loadProducts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadProducts,
    TResult? Function()? refreshProducts,
    TResult? Function(String query)? searchProducts,
    TResult? Function(String category)? loadProductsByCategory,
  }) {
    return loadProducts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadProducts,
    TResult Function()? refreshProducts,
    TResult Function(String query)? searchProducts,
    TResult Function(String category)? loadProductsByCategory,
    required TResult orElse(),
  }) {
    if (loadProducts != null) {
      return loadProducts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProducts value) loadProducts,
    required TResult Function(RefreshProducts value) refreshProducts,
    required TResult Function(SearchProducts value) searchProducts,
    required TResult Function(LoadProductsByCategory value)
        loadProductsByCategory,
  }) {
    return loadProducts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProducts value)? loadProducts,
    TResult? Function(RefreshProducts value)? refreshProducts,
    TResult? Function(SearchProducts value)? searchProducts,
    TResult? Function(LoadProductsByCategory value)? loadProductsByCategory,
  }) {
    return loadProducts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProducts value)? loadProducts,
    TResult Function(RefreshProducts value)? refreshProducts,
    TResult Function(SearchProducts value)? searchProducts,
    TResult Function(LoadProductsByCategory value)? loadProductsByCategory,
    required TResult orElse(),
  }) {
    if (loadProducts != null) {
      return loadProducts(this);
    }
    return orElse();
  }
}

abstract class LoadProducts implements ProductEvent {
  const factory LoadProducts() = _$LoadProductsImpl;
}

/// @nodoc
abstract class _$$RefreshProductsImplCopyWith<$Res> {
  factory _$$RefreshProductsImplCopyWith(_$RefreshProductsImpl value,
          $Res Function(_$RefreshProductsImpl) then) =
      __$$RefreshProductsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshProductsImplCopyWithImpl<$Res>
    extends _$ProductEventCopyWithImpl<$Res, _$RefreshProductsImpl>
    implements _$$RefreshProductsImplCopyWith<$Res> {
  __$$RefreshProductsImplCopyWithImpl(
      _$RefreshProductsImpl _value, $Res Function(_$RefreshProductsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RefreshProductsImpl implements RefreshProducts {
  const _$RefreshProductsImpl();

  @override
  String toString() {
    return 'ProductEvent.refreshProducts()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshProductsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadProducts,
    required TResult Function() refreshProducts,
    required TResult Function(String query) searchProducts,
    required TResult Function(String category) loadProductsByCategory,
  }) {
    return refreshProducts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadProducts,
    TResult? Function()? refreshProducts,
    TResult? Function(String query)? searchProducts,
    TResult? Function(String category)? loadProductsByCategory,
  }) {
    return refreshProducts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadProducts,
    TResult Function()? refreshProducts,
    TResult Function(String query)? searchProducts,
    TResult Function(String category)? loadProductsByCategory,
    required TResult orElse(),
  }) {
    if (refreshProducts != null) {
      return refreshProducts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProducts value) loadProducts,
    required TResult Function(RefreshProducts value) refreshProducts,
    required TResult Function(SearchProducts value) searchProducts,
    required TResult Function(LoadProductsByCategory value)
        loadProductsByCategory,
  }) {
    return refreshProducts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProducts value)? loadProducts,
    TResult? Function(RefreshProducts value)? refreshProducts,
    TResult? Function(SearchProducts value)? searchProducts,
    TResult? Function(LoadProductsByCategory value)? loadProductsByCategory,
  }) {
    return refreshProducts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProducts value)? loadProducts,
    TResult Function(RefreshProducts value)? refreshProducts,
    TResult Function(SearchProducts value)? searchProducts,
    TResult Function(LoadProductsByCategory value)? loadProductsByCategory,
    required TResult orElse(),
  }) {
    if (refreshProducts != null) {
      return refreshProducts(this);
    }
    return orElse();
  }
}

abstract class RefreshProducts implements ProductEvent {
  const factory RefreshProducts() = _$RefreshProductsImpl;
}

/// @nodoc
abstract class _$$SearchProductsImplCopyWith<$Res> {
  factory _$$SearchProductsImplCopyWith(_$SearchProductsImpl value,
          $Res Function(_$SearchProductsImpl) then) =
      __$$SearchProductsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$SearchProductsImplCopyWithImpl<$Res>
    extends _$ProductEventCopyWithImpl<$Res, _$SearchProductsImpl>
    implements _$$SearchProductsImplCopyWith<$Res> {
  __$$SearchProductsImplCopyWithImpl(
      _$SearchProductsImpl _value, $Res Function(_$SearchProductsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$SearchProductsImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchProductsImpl implements SearchProducts {
  const _$SearchProductsImpl({required this.query});

  @override
  final String query;

  @override
  String toString() {
    return 'ProductEvent.searchProducts(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchProductsImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchProductsImplCopyWith<_$SearchProductsImpl> get copyWith =>
      __$$SearchProductsImplCopyWithImpl<_$SearchProductsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadProducts,
    required TResult Function() refreshProducts,
    required TResult Function(String query) searchProducts,
    required TResult Function(String category) loadProductsByCategory,
  }) {
    return searchProducts(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadProducts,
    TResult? Function()? refreshProducts,
    TResult? Function(String query)? searchProducts,
    TResult? Function(String category)? loadProductsByCategory,
  }) {
    return searchProducts?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadProducts,
    TResult Function()? refreshProducts,
    TResult Function(String query)? searchProducts,
    TResult Function(String category)? loadProductsByCategory,
    required TResult orElse(),
  }) {
    if (searchProducts != null) {
      return searchProducts(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProducts value) loadProducts,
    required TResult Function(RefreshProducts value) refreshProducts,
    required TResult Function(SearchProducts value) searchProducts,
    required TResult Function(LoadProductsByCategory value)
        loadProductsByCategory,
  }) {
    return searchProducts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProducts value)? loadProducts,
    TResult? Function(RefreshProducts value)? refreshProducts,
    TResult? Function(SearchProducts value)? searchProducts,
    TResult? Function(LoadProductsByCategory value)? loadProductsByCategory,
  }) {
    return searchProducts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProducts value)? loadProducts,
    TResult Function(RefreshProducts value)? refreshProducts,
    TResult Function(SearchProducts value)? searchProducts,
    TResult Function(LoadProductsByCategory value)? loadProductsByCategory,
    required TResult orElse(),
  }) {
    if (searchProducts != null) {
      return searchProducts(this);
    }
    return orElse();
  }
}

abstract class SearchProducts implements ProductEvent {
  const factory SearchProducts({required final String query}) =
      _$SearchProductsImpl;

  String get query;
  @JsonKey(ignore: true)
  _$$SearchProductsImplCopyWith<_$SearchProductsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadProductsByCategoryImplCopyWith<$Res> {
  factory _$$LoadProductsByCategoryImplCopyWith(
          _$LoadProductsByCategoryImpl value,
          $Res Function(_$LoadProductsByCategoryImpl) then) =
      __$$LoadProductsByCategoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String category});
}

/// @nodoc
class __$$LoadProductsByCategoryImplCopyWithImpl<$Res>
    extends _$ProductEventCopyWithImpl<$Res, _$LoadProductsByCategoryImpl>
    implements _$$LoadProductsByCategoryImplCopyWith<$Res> {
  __$$LoadProductsByCategoryImplCopyWithImpl(
      _$LoadProductsByCategoryImpl _value,
      $Res Function(_$LoadProductsByCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
  }) {
    return _then(_$LoadProductsByCategoryImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadProductsByCategoryImpl implements LoadProductsByCategory {
  const _$LoadProductsByCategoryImpl({required this.category});

  @override
  final String category;

  @override
  String toString() {
    return 'ProductEvent.loadProductsByCategory(category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadProductsByCategoryImpl &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadProductsByCategoryImplCopyWith<_$LoadProductsByCategoryImpl>
      get copyWith => __$$LoadProductsByCategoryImplCopyWithImpl<
          _$LoadProductsByCategoryImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadProducts,
    required TResult Function() refreshProducts,
    required TResult Function(String query) searchProducts,
    required TResult Function(String category) loadProductsByCategory,
  }) {
    return loadProductsByCategory(category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadProducts,
    TResult? Function()? refreshProducts,
    TResult? Function(String query)? searchProducts,
    TResult? Function(String category)? loadProductsByCategory,
  }) {
    return loadProductsByCategory?.call(category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadProducts,
    TResult Function()? refreshProducts,
    TResult Function(String query)? searchProducts,
    TResult Function(String category)? loadProductsByCategory,
    required TResult orElse(),
  }) {
    if (loadProductsByCategory != null) {
      return loadProductsByCategory(category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProducts value) loadProducts,
    required TResult Function(RefreshProducts value) refreshProducts,
    required TResult Function(SearchProducts value) searchProducts,
    required TResult Function(LoadProductsByCategory value)
        loadProductsByCategory,
  }) {
    return loadProductsByCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProducts value)? loadProducts,
    TResult? Function(RefreshProducts value)? refreshProducts,
    TResult? Function(SearchProducts value)? searchProducts,
    TResult? Function(LoadProductsByCategory value)? loadProductsByCategory,
  }) {
    return loadProductsByCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProducts value)? loadProducts,
    TResult Function(RefreshProducts value)? refreshProducts,
    TResult Function(SearchProducts value)? searchProducts,
    TResult Function(LoadProductsByCategory value)? loadProductsByCategory,
    required TResult orElse(),
  }) {
    if (loadProductsByCategory != null) {
      return loadProductsByCategory(this);
    }
    return orElse();
  }
}

abstract class LoadProductsByCategory implements ProductEvent {
  const factory LoadProductsByCategory({required final String category}) =
      _$LoadProductsByCategoryImpl;

  String get category;
  @JsonKey(ignore: true)
  _$$LoadProductsByCategoryImplCopyWith<_$LoadProductsByCategoryImpl>
      get copyWith => throw _privateConstructorUsedError;
}
