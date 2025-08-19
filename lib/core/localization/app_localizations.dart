import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      AppLocalizationsDelegate();

  // App Title
  String get appTitle {
    switch (locale.languageCode) {
      case 'es':
        return 'Aplicación de Comercio Electrónico';
      default:
        return 'E-Commerce App';
    }
  }

  // Home Screen
  String get homeTitle {
    switch (locale.languageCode) {
      case 'es':
        return 'Productos';
      default:
        return 'Products';
    }
  }

  // Cart Screen
  String get cartTitle {
    switch (locale.languageCode) {
      case 'es':
        return 'Carrito de Compras';
      default:
        return 'Shopping Cart';
    }
  }

  // Search
  String get searchProducts {
    switch (locale.languageCode) {
      case 'es':
        return 'Buscar productos...';
      default:
        return 'Search products...';
    }
  }

  String get noSuggestionsFound {
    switch (locale.languageCode) {
      case 'es':
        return 'No se encontraron sugerencias';
      default:
        return 'No suggestions found';
    }
  }

  // Cart Actions
  String get addToCart {
    switch (locale.languageCode) {
      case 'es':
        return 'Agregar al Carrito';
      default:
        return 'Add to Cart';
    }
  }

  String get removeFromCart {
    switch (locale.languageCode) {
      case 'es':
        return 'Quitar del Carrito';
      default:
        return 'Remove from Cart';
    }
  }

  String get emptyCart {
    switch (locale.languageCode) {
      case 'es':
        return 'Tu carrito está vacío';
      default:
        return 'Your cart is empty';
    }
  }

  String get startShopping {
    switch (locale.languageCode) {
      case 'es':
        return 'Comenzar a Comprar';
      default:
        return 'Start Shopping';
    }
  }

  // General
  String get total {
    switch (locale.languageCode) {
      case 'es':
        return 'Total';
      default:
        return 'Total';
    }
  }

  String get checkout {
    switch (locale.languageCode) {
      case 'es':
        return 'Finalizar Compra';
      default:
        return 'Checkout';
    }
  }

  String get quantity {
    switch (locale.languageCode) {
      case 'es':
        return 'Cantidad';
      default:
        return 'Quantity';
    }
  }

  String get price {
    switch (locale.languageCode) {
      case 'es':
        return 'Precio';
      default:
        return 'Price';
    }
  }

  String get currency {
    return '\$';
  }

  String get loading {
    switch (locale.languageCode) {
      case 'es':
        return 'Cargando...';
      default:
        return 'Loading...';
    }
  }

  String get error {
    switch (locale.languageCode) {
      case 'es':
        return 'Error';
      default:
        return 'Error';
    }
  }

  String get retry {
    switch (locale.languageCode) {
      case 'es':
        return 'Reintentar';
      default:
        return 'Retry';
    }
  }

  String get noProductsFound {
    switch (locale.languageCode) {
      case 'es':
        return 'No se encontraron productos';
      default:
        return 'No products found';
    }
  }

  String searchResultsFor(String query) {
    switch (locale.languageCode) {
      case 'es':
        return 'Resultados de búsqueda para "$query"';
      default:
        return 'Search results for "$query"';
    }
  }

  String itemsInCart(int count) {
    switch (locale.languageCode) {
      case 'es':
        if (count == 0) return 'Sin artículos';
        if (count == 1) return '1 artículo';
        return '$count artículos';
      default:
        if (count == 0) return 'No items';
        if (count == 1) return '1 item';
        return '$count items';
    }
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'es'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
