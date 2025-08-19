import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../lib/blocs/cart/cart_bloc.dart';
import '../../../lib/blocs/cart/cart_event.dart';
import '../../../lib/blocs/cart/cart_state.dart';
import '../../../lib/core/error/failures.dart';
import '../../../lib/domain/repositories/cart_repository.dart';
import '../../../lib/models/cart.dart';
import '../../../lib/models/product.dart';
import '../../fixtures/test_fixtures.dart';
import '../../mocks/test_mocks.dart';

void main() {
  group('CartBloc', () {
    late CartBloc cartBloc;
    late MockGetCart mockGetCart;
    late MockAddToCart mockAddToCart;
    late MockRemoveFromCart mockRemoveFromCart;
    late MockUpdateCartItemQuantity mockUpdateCartItemQuantity;
    late MockClearCart mockClearCart;

    setUp(() {
      mockGetCart = MockGetCart();
      mockAddToCart = MockAddToCart();
      mockRemoveFromCart = MockRemoveFromCart();
      mockUpdateCartItemQuantity = MockUpdateCartItemQuantity();
      mockClearCart = MockClearCart();

      cartBloc = CartBloc(
        getCart: mockGetCart,
        addToCart: mockAddToCart,
        removeFromCart: mockRemoveFromCart,
        updateCartItemQuantity: mockUpdateCartItemQuantity,
        clearCart: mockClearCart,
      );

      // Register fallback values for mocktail
      registerFallbackValue(TestFixtures.testProduct);
    });

    tearDown(() {
      cartBloc.close();
    });

    test('initial state is CartInitial', () {
      expect(cartBloc.state, equals(const CartState.initial()));
    });

    group('LoadCart', () {
      blocTest<CartBloc, CartState>(
        'emits [CartLoading, CartLoaded] when cart is loaded successfully',
        build: () {
          when(() => mockGetCart()).thenAnswer(
            (_) async => Right(TestFixtures.testCart),
          );
          return cartBloc;
        },
        act: (bloc) => bloc.add(const CartEvent.loadCart()),
        expect: () => [
          const CartState.loading(),
          CartState.loaded(items: TestFixtures.testCartItems),
        ],
        verify: (_) {
          verify(() => mockGetCart()).called(1);
        },
      );

      blocTest<CartBloc, CartState>(
        'emits [CartLoading, CartLoaded] with empty cart when cart is empty',
        build: () {
          when(() => mockGetCart()).thenAnswer(
            (_) async => Right(TestFixtures.emptyCart),
          );
          return cartBloc;
        },
        act: (bloc) => bloc.add(const CartEvent.loadCart()),
        expect: () => [
          const CartState.loading(),
          const CartState.loaded(items: []),
        ],
        verify: (_) {
          verify(() => mockGetCart()).called(1);
        },
      );

      blocTest<CartBloc, CartState>(
        'emits [CartLoading, CartError] when loading cart fails',
        build: () {
          when(() => mockGetCart()).thenAnswer(
            (_) async => Left(CacheFailure()),
          );
          return cartBloc;
        },
        act: (bloc) => bloc.add(const CartEvent.loadCart()),
        expect: () => [
          const CartState.loading(),
          const CartState.error(message: 'Failed to load cart'),
        ],
        verify: (_) {
          verify(() => mockGetCart()).called(1);
        },
      );
    });

    group('AddToCart', () {
      blocTest<CartBloc, CartState>(
        'emits [CartLoading, CartLoaded] when item is added successfully',
        build: () {
          when(() => mockAddToCart(any(), any())).thenAnswer(
            (_) async => const Right(unit),
          );
          when(() => mockGetCart()).thenAnswer(
            (_) async => Right(TestFixtures.testCart),
          );
          return cartBloc;
        },
        act: (bloc) => bloc.add(
          CartEvent.addToCart(product: TestFixtures.testProduct, quantity: 1),
        ),
        expect: () => [
          const CartState.loading(),
          CartState.loaded(items: TestFixtures.testCartItems),
        ],
        verify: (_) {
          verify(() => mockAddToCart(TestFixtures.testProduct, 1)).called(1);
          verify(() => mockGetCart()).called(1);
        },
      );

      blocTest<CartBloc, CartState>(
        'emits [CartError] when adding item fails',
        build: () {
          when(() => mockAddToCart(any(), any())).thenAnswer(
            (_) async => Left(CacheFailure()),
          );
          return cartBloc;
        },
        act: (bloc) => bloc.add(
          CartEvent.addToCart(product: TestFixtures.testProduct, quantity: 1),
        ),
        expect: () => [
          const CartState.error(message: 'Failed to add item to cart'),
        ],
        verify: (_) {
          verify(() => mockAddToCart(TestFixtures.testProduct, 1)).called(1);
          verifyNever(() => mockGetCart());
        },
      );
    });

    group('RemoveFromCart', () {
      blocTest<CartBloc, CartState>(
        'emits [CartLoading, CartLoaded] when item is removed successfully',
        build: () {
          when(() => mockRemoveFromCart(any())).thenAnswer(
            (_) async => const Right(unit),
          );
          when(() => mockGetCart()).thenAnswer(
            (_) async => Right(TestFixtures.emptyCart),
          );
          return cartBloc;
        },
        act: (bloc) => bloc.add(const CartEvent.removeFromCart(productId: '1')),
        expect: () => [
          const CartState.loading(),
          const CartState.loaded(items: []),
        ],
        verify: (_) {
          verify(() => mockRemoveFromCart('1')).called(1);
          verify(() => mockGetCart()).called(1);
        },
      );

      blocTest<CartBloc, CartState>(
        'emits [CartError] when removing item fails',
        build: () {
          when(() => mockRemoveFromCart(any())).thenAnswer(
            (_) async => Left(CacheFailure()),
          );
          return cartBloc;
        },
        act: (bloc) => bloc.add(const CartEvent.removeFromCart(productId: '1')),
        expect: () => [
          const CartState.error(message: 'Failed to remove item from cart'),
        ],
        verify: (_) {
          verify(() => mockRemoveFromCart('1')).called(1);
          verifyNever(() => mockGetCart());
        },
      );
    });

    group('UpdateCartItemQuantity', () {
      blocTest<CartBloc, CartState>(
        'emits [CartLoading, CartLoaded] when quantity is updated successfully',
        build: () {
          when(() => mockUpdateCartItemQuantity(any(), any())).thenAnswer(
            (_) async => const Right(unit),
          );
          when(() => mockGetCart()).thenAnswer(
            (_) async => Right(TestFixtures.testCart),
          );
          return cartBloc;
        },
        act: (bloc) => bloc.add(
          const CartEvent.updateCartItemQuantity(productId: '1', quantity: 3),
        ),
        expect: () => [
          const CartState.loading(),
          CartState.loaded(items: TestFixtures.testCartItems),
        ],
        verify: (_) {
          verify(() => mockUpdateCartItemQuantity('1', 3)).called(1);
          verify(() => mockGetCart()).called(1);
        },
      );

      blocTest<CartBloc, CartState>(
        'removes item when quantity is 0 or less',
        build: () {
          when(() => mockRemoveFromCart(any())).thenAnswer(
            (_) async => const Right(unit),
          );
          when(() => mockGetCart()).thenAnswer(
            (_) async => Right(TestFixtures.emptyCart),
          );
          return cartBloc;
        },
        act: (bloc) => bloc.add(
          const CartEvent.updateCartItemQuantity(productId: '1', quantity: 0),
        ),
        expect: () => [
          const CartState.loading(),
          CartState.loaded(items: TestFixtures.testCartItems),
        ],
        verify: (_) {
          verify(() => mockRemoveFromCart('1')).called(1);
          verify(() => mockGetCart()).called(1);
          verifyNever(() => mockUpdateCartItemQuantity(any(), any()));
        },
      );

      blocTest<CartBloc, CartState>(
        'emits [CartError] when updating quantity fails',
        build: () {
          when(() => mockUpdateCartItemQuantity(any(), any())).thenAnswer(
            (_) async => Left(CacheFailure()),
          );
          return cartBloc;
        },
        act: (bloc) => bloc.add(
          const CartEvent.updateCartItemQuantity(productId: '1', quantity: 3),
        ),
        expect: () => [
          const CartState.error(message: 'Failed to update item quantity'),
        ],
        verify: (_) {
          verify(() => mockUpdateCartItemQuantity('1', 3)).called(1);
          verifyNever(() => mockGetCart());
        },
      );
    });

    group('ClearCart', () {
      blocTest<CartBloc, CartState>(
        'emits [CartLoaded] with empty list when cart is cleared successfully',
        build: () {
          when(() => mockClearCart()).thenAnswer(
            (_) async => const Right(unit),
          );
          return cartBloc;
        },
        act: (bloc) => bloc.add(const CartEvent.clearCart()),
        expect: () => [
          const CartState.loaded(items: []),
        ],
        verify: (_) {
          verify(() => mockClearCart()).called(1);
        },
      );

      blocTest<CartBloc, CartState>(
        'emits [CartError] when clearing cart fails',
        build: () {
          when(() => mockClearCart()).thenAnswer(
            (_) async => Left(CacheFailure()),
          );
          return cartBloc;
        },
        act: (bloc) => bloc.add(const CartEvent.clearCart()),
        expect: () => [
          const CartState.error(message: 'Failed to clear cart'),
        ],
        verify: (_) {
          verify(() => mockClearCart()).called(1);
        },
      );
    });

    group('Multiple Events', () {
      blocTest<CartBloc, CartState>(
        'handles multiple events correctly',
        build: () {
          when(() => mockAddToCart(any(), any())).thenAnswer(
            (_) async => const Right(unit),
          );
          when(() => mockGetCart()).thenAnswer(
            (_) async => Right(TestFixtures.testCart),
          );
          when(() => mockRemoveFromCart(any())).thenAnswer(
            (_) async => const Right(unit),
          );
          return cartBloc;
        },
        act: (bloc) {
          bloc.add(CartEvent.addToCart(product: TestFixtures.testProduct, quantity: 1));
          bloc.add(const CartEvent.removeFromCart(productId: '1'));
        },
        expect: () => [
          const CartState.loading(),
          CartState.loaded(items: TestFixtures.testCartItems),
          const CartState.loading(),
          CartState.loaded(items: TestFixtures.testCartItems),
        ],
        verify: (_) {
          verify(() => mockAddToCart(TestFixtures.testProduct, 1)).called(1);
          verify(() => mockRemoveFromCart('1')).called(1);
          verify(() => mockGetCart()).called(2);
        },
      );
    });
  });
}
