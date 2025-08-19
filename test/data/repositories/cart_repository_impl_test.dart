import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../lib/core/error/failures.dart';
import '../../../lib/data/datasources/cart_local_data_source.dart';
import '../../../lib/data/repositories/cart_repository_impl.dart';
import '../../../lib/models/cart.dart';
import '../../../lib/models/product.dart';
import '../../fixtures/test_fixtures.dart';

class MockCartLocalDataSource extends Mock implements CartLocalDataSource {}

void main() {
  group('CartRepositoryImpl', () {
    late CartRepositoryImpl repository;
    late MockCartLocalDataSource mockLocalDataSource;

    setUp(() {
      mockLocalDataSource = MockCartLocalDataSource();
      repository = CartRepositoryImpl(localDataSource: mockLocalDataSource);

      // Register fallback values
      registerFallbackValue(TestFixtures.testProduct);
    });

    group('getCart', () {
      test('should return Cart when local data source succeeds', () async {
        // arrange
        when(() => mockLocalDataSource.getCartItems())
            .thenAnswer((_) async => TestFixtures.testCartItems);

        // act
        final result = await repository.getCart();

        // assert
        expect(result, equals(Right(TestFixtures.testCart)));
        verify(() => mockLocalDataSource.getCartItems()).called(1);
      });

      test('should return CacheFailure when local data source throws exception', () async {
        // arrange
        when(() => mockLocalDataSource.getCartItems())
            .thenThrow(Exception('Database error'));

        // act
        final result = await repository.getCart();

        // assert
        expect(result, equals(Left(CacheFailure())));
        verify(() => mockLocalDataSource.getCartItems()).called(1);
      });

      test('should return empty cart when no items exist', () async {
        // arrange
        when(() => mockLocalDataSource.getCartItems())
            .thenAnswer((_) async => []);

        // act
        final result = await repository.getCart();

        // assert
        expect(result, equals(Right(TestFixtures.emptyCart)));
        verify(() => mockLocalDataSource.getCartItems()).called(1);
      });
    });

    group('addToCart', () {
      test('should return Unit when item is added successfully', () async {
        // arrange
        when(() => mockLocalDataSource.addToCart(any(), any()))
            .thenAnswer((_) async {});

        // act
        final result = await repository.addToCart(TestFixtures.testProduct, 2);

        // assert
        expect(result, equals(const Right(unit)));
        verify(() => mockLocalDataSource.addToCart(TestFixtures.testProduct, 2))
            .called(1);
      });

      test('should return CacheFailure when adding item fails', () async {
        // arrange
        when(() => mockLocalDataSource.addToCart(any(), any()))
            .thenThrow(Exception('Database error'));

        // act
        final result = await repository.addToCart(TestFixtures.testProduct, 2);

        // assert
        expect(result, equals(Left(CacheFailure())));
        verify(() => mockLocalDataSource.addToCart(TestFixtures.testProduct, 2))
            .called(1);
      });
    });

    group('removeFromCart', () {
      test('should return Unit when item is removed successfully', () async {
        // arrange
        when(() => mockLocalDataSource.removeFromCart(any()))
            .thenAnswer((_) async {});

        // act
        final result = await repository.removeFromCart('1');

        // assert
        expect(result, equals(const Right(unit)));
        verify(() => mockLocalDataSource.removeFromCart('1')).called(1);
      });

      test('should return CacheFailure when removing item fails', () async {
        // arrange
        when(() => mockLocalDataSource.removeFromCart(any()))
            .thenThrow(Exception('Database error'));

        // act
        final result = await repository.removeFromCart('1');

        // assert
        expect(result, equals(Left(CacheFailure())));
        verify(() => mockLocalDataSource.removeFromCart('1')).called(1);
      });
    });

    group('updateCartItemQuantity', () {
      test('should return Unit when quantity is updated successfully', () async {
        // arrange
        when(() => mockLocalDataSource.updateCartItemQuantity(any(), any()))
            .thenAnswer((_) async {});

        // act
        final result = await repository.updateCartItemQuantity('1', 3);

        // assert
        expect(result, equals(const Right(unit)));
        verify(() => mockLocalDataSource.updateCartItemQuantity('1', 3)).called(1);
      });

      test('should return CacheFailure when updating quantity fails', () async {
        // arrange
        when(() => mockLocalDataSource.updateCartItemQuantity(any(), any()))
            .thenThrow(Exception('Database error'));

        // act
        final result = await repository.updateCartItemQuantity('1',3);

        // assert
        expect(result, equals(Left(CacheFailure())));
        verify(() => mockLocalDataSource.updateCartItemQuantity('1', 3)).called(1);
      });
    });

    group('clearCart', () {
      test('should return Unit when cart is cleared successfully', () async {
        // arrange
        when(() => mockLocalDataSource.clearCart()).thenAnswer((_) async {});

        // act
        final result = await repository.clearCart();

        // assert
        expect(result, equals(const Right(unit)));
        verify(() => mockLocalDataSource.clearCart()).called(1);
      });

      test('should return CacheFailure when clearing cart fails', () async {
        // arrange
        when(() => mockLocalDataSource.clearCart())
            .thenThrow(Exception('Database error'));

        // act
        final result = await repository.clearCart();

        // assert
        expect(result, equals(Left(CacheFailure())));
        verify(() => mockLocalDataSource.clearCart()).called(1);
      });
    });
  });
}
