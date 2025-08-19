import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../lib/core/error/failures.dart';
import '../../../lib/models/cart.dart';
import '../../../lib/models/product.dart';
import '../../../lib/domain/usecases/cart_usecases.dart';
import '../../fixtures/test_fixtures.dart';
import '../../mocks/test_mocks.dart';

void main() {
  group('Cart Use Cases', () {
    late MockCartRepository mockCartRepository;

    setUp(() {
      mockCartRepository = MockCartRepository();
      
      // Register fallback values
      registerFallbackValue(TestFixtures.testProduct);
    });

    group('GetCart', () {
      late GetCart usecase;

      setUp(() {
        usecase = GetCart(mockCartRepository);
      });

      test('should get cart from the repository', () async {
        // arrange
        when(() => mockCartRepository.getCart())
            .thenAnswer((_) async => Right(TestFixtures.testCart));

        // act
        final result = await usecase();

        // assert
        expect(result, Right(TestFixtures.testCart));
        verify(() => mockCartRepository.getCart()).called(1);
        verifyNoMoreInteractions(mockCartRepository);
      });

      test('should return failure when repository fails', () async {
        // arrange
        when(() => mockCartRepository.getCart())
            .thenAnswer((_) async => Left(CacheFailure()));

        // act
        final result = await usecase();

        // assert
        expect(result, Left(CacheFailure()));
        verify(() => mockCartRepository.getCart()).called(1);
        verifyNoMoreInteractions(mockCartRepository);
      });
    });

    group('AddToCart', () {
      late AddToCart usecase;

      setUp(() {
        usecase = AddToCart(mockCartRepository);
      });

      test('should add product to cart via repository', () async {
        // arrange
        when(() => mockCartRepository.addToCart(any(), any()))
            .thenAnswer((_) async => const Right(unit));

        // act
        final result = await usecase(TestFixtures.testProduct, 2);

        // assert
        expect(result, const Right(unit));
        verify(() => mockCartRepository.addToCart(TestFixtures.testProduct, 2))
            .called(1);
        verifyNoMoreInteractions(mockCartRepository);
      });

      test('should return failure when repository fails', () async {
        // arrange
        when(() => mockCartRepository.addToCart(any(), any()))
            .thenAnswer((_) async => Left(CacheFailure()));

        // act
        final result = await usecase(TestFixtures.testProduct, 2);

        // assert
        expect(result, Left(CacheFailure()));
        verify(() => mockCartRepository.addToCart(TestFixtures.testProduct, 2))
            .called(1);
        verifyNoMoreInteractions(mockCartRepository);
      });

      test('should add product with default quantity of 1', () async {
        // arrange
        when(() => mockCartRepository.addToCart(any(), any()))
            .thenAnswer((_) async => const Right(unit));

        // act
        final result = await usecase(TestFixtures.testProduct, 1);

        // assert
        expect(result, const Right(unit));
        verify(() => mockCartRepository.addToCart(TestFixtures.testProduct, 1))
            .called(1);
        verifyNoMoreInteractions(mockCartRepository);
      });
    });

    group('RemoveFromCart', () {
      late RemoveFromCart usecase;

      setUp(() {
        usecase = RemoveFromCart(mockCartRepository);
      });

      test('should remove product from cart via repository', () async {
        // arrange
        when(() => mockCartRepository.removeFromCart(any()))
            .thenAnswer((_) async => const Right(unit));

        // act
        final result = await usecase('1');

        // assert
        expect(result, const Right(unit));
        verify(() => mockCartRepository.removeFromCart('1')).called(1);
        verifyNoMoreInteractions(mockCartRepository);
      });

      test('should return failure when repository fails', () async {
        // arrange
        when(() => mockCartRepository.removeFromCart(any()))
            .thenAnswer((_) async => Left(CacheFailure()));

        // act
        final result = await usecase('1');

        // assert
        expect(result, Left(CacheFailure()));
        verify(() => mockCartRepository.removeFromCart('1')).called(1);
        verifyNoMoreInteractions(mockCartRepository);
      });
    });

    group('UpdateCartItemQuantity', () {
      late UpdateCartItemQuantity usecase;

      setUp(() {
        usecase = UpdateCartItemQuantity(mockCartRepository);
      });

      test('should update cart item quantity via repository', () async {
        // arrange
        when(() => mockCartRepository.updateCartItemQuantity(any(), any()))
            .thenAnswer((_) async => const Right(unit));

        // act
        final result = await usecase('1', 3);

        // assert
        expect(result, const Right(unit));
        verify(() => mockCartRepository.updateCartItemQuantity('1', 3)).called(1);
        verifyNoMoreInteractions(mockCartRepository);
      });

      test('should return failure when repository fails', () async {
        // arrange
        when(() => mockCartRepository.updateCartItemQuantity(any(), any()))
            .thenAnswer((_) async => Left(CacheFailure()));

        // act
        final result = await usecase('1', 3);

        // assert
        expect(result, Left(CacheFailure()));
        verify(() => mockCartRepository.updateCartItemQuantity('1', 3)).called(1);
        verifyNoMoreInteractions(mockCartRepository);
      });

      test('should handle zero quantity update', () async {
        // arrange
        when(() => mockCartRepository.updateCartItemQuantity(any(), any()))
            .thenAnswer((_) async => const Right(unit));

        // act
        final result = await usecase('1', 0);

        // assert
        expect(result, const Right(unit));
        verify(() => mockCartRepository.updateCartItemQuantity('1', 0)).called(1);
        verifyNoMoreInteractions(mockCartRepository);
      });
    });

    group('ClearCart', () {
      late ClearCart usecase;

      setUp(() {
        usecase = ClearCart(mockCartRepository);
      });

      test('should clear cart via repository', () async {
        // arrange
        when(() => mockCartRepository.clearCart())
            .thenAnswer((_) async => const Right(unit));

        // act
        final result = await usecase();

        // assert
        expect(result, const Right(unit));
        verify(() => mockCartRepository.clearCart()).called(1);
        verifyNoMoreInteractions(mockCartRepository);
      });

      test('should return failure when repository fails', () async {
        // arrange
        when(() => mockCartRepository.clearCart())
            .thenAnswer((_) async => Left(CacheFailure()));

        // act
        final result = await usecase();

        // assert
        expect(result, Left(CacheFailure()));
        verify(() => mockCartRepository.clearCart()).called(1);
        verifyNoMoreInteractions(mockCartRepository);
      });
    });
  });
}
