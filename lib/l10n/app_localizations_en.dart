// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'E-Commerce App';

  @override
  String get homeTitle => 'Products';

  @override
  String get cartTitle => 'Shopping Cart';

  @override
  String get searchProducts => 'Search products...';

  @override
  String get noSuggestionsFound => 'No suggestions found';

  @override
  String get addToCart => 'Add to Cart';

  @override
  String get removeFromCart => 'Remove from Cart';

  @override
  String get emptyCart => 'Your cart is empty';

  @override
  String get startShopping => 'Start Shopping';

  @override
  String get total => 'Total';

  @override
  String get checkout => 'Checkout';

  @override
  String get quantity => 'Quantity';

  @override
  String get price => 'Price';

  @override
  String get currency => '\$';

  @override
  String get loading => 'Loading...';

  @override
  String get error => 'Error';

  @override
  String get retry => 'Retry';

  @override
  String get noProductsFound => 'No products found';

  @override
  String searchResultsFor(String query) {
    return 'Search results for \"$query\"';
  }

  @override
  String itemsInCart(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items',
      one: '1 item',
      zero: 'No items',
    );
    return '$_temp0';
  }
}
