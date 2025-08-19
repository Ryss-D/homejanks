// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Aplicación de Comercio Electrónico';

  @override
  String get homeTitle => 'Productos';

  @override
  String get cartTitle => 'Carrito de Compras';

  @override
  String get searchProducts => 'Buscar productos...';

  @override
  String get noSuggestionsFound => 'No se encontraron sugerencias';

  @override
  String get addToCart => 'Agregar al Carrito';

  @override
  String get removeFromCart => 'Quitar del Carrito';

  @override
  String get emptyCart => 'Tu carrito está vacío';

  @override
  String get startShopping => 'Comenzar a Comprar';

  @override
  String get total => 'Total';

  @override
  String get checkout => 'Finalizar Compra';

  @override
  String get quantity => 'Cantidad';

  @override
  String get price => 'Precio';

  @override
  String get currency => '\$';

  @override
  String get loading => 'Cargando...';

  @override
  String get error => 'Error';

  @override
  String get retry => 'Reintentar';

  @override
  String get noProductsFound => 'No se encontraron productos';

  @override
  String searchResultsFor(String query) {
    return 'Resultados de búsqueda para \"$query\"';
  }

  @override
  String itemsInCart(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count artículos',
      one: '1 artículo',
      zero: 'Sin artículos',
    );
    return '$_temp0';
  }
}
