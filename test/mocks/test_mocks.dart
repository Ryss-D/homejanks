import 'package:mocktail/mocktail.dart';
import '../../lib/domain/repositories/cart_repository.dart';
import '../../lib/domain/usecases/cart_usecases.dart';

// Repository Mocks
class MockCartRepository extends Mock implements CartRepository {}

// Use Case Mocks
class MockGetCart extends Mock implements GetCart {}
class MockAddToCart extends Mock implements AddToCart {}
class MockRemoveFromCart extends Mock implements RemoveFromCart {}
class MockUpdateCartItemQuantity extends Mock implements UpdateCartItemQuantity {}
class MockClearCart extends Mock implements ClearCart {}
