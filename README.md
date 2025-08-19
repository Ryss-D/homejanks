# Flutter E-Commerce App

A Flutter e-commerce application built with Dio for network requests, BloC for state management, and Drift for local data persistence.

## Features

- **Product Browsing**: View products fetched from a REST API
- **Search Functionality**: Search products by title or description
- **Category Filtering**: Filter products by categories
- **Shopping Cart**: Add, remove, and update product quantities
- **Local Storage**: Products and cart data are cached locally using Drift
- **Offline Support**: Browse cached products when offline

## Architecture

### State Management
- **BloC Pattern**: Used for managing application state
- **Events & States**: Separate events and states for products and cart

### Data Layer
- **Dio**: HTTP client for API requests
- **Retrofit**: Type-safe API client generation
- **Drift**: Local SQLite database for caching

### UI Layer
- **Material Design**: Clean and modern UI
- **Cached Images**: Network images with caching
- **Shimmer Loading**: Beautiful loading states

## Project Structure

```
lib/
├── blocs/
│   ├── cart/
│   │   ├── cart_bloc.dart
│   │   ├── cart_event.dart
│   │   └── cart_state.dart
│   └── product/
│       ├── product_bloc.dart
│       ├── product_event.dart
│       └── product_state.dart
├── core/
│   └── di/
│       └── injection.dart
├── database/
│   └── database.dart
├── models/
│   ├── cart_item.dart
│   └── product.dart
├── screens/
│   ├── cart_screen.dart
│   └── home_screen.dart
├── services/
│   └── api_service.dart
└── main.dart
```

## Dependencies

### Main Dependencies
- `flutter_bloc`: State management
- `dio`: HTTP client
- `retrofit`: API client generation
- `drift`: Local database
- `get_it`: Dependency injection
- `cached_network_image`: Image caching
- `shimmer`: Loading animations

### Dev Dependencies
- `build_runner`: Code generation
- `drift_dev`: Drift code generation
- `retrofit_generator`: Retrofit code generation
- `json_serializable`: JSON serialization

## Getting Started

1. **Install Dependencies**
   ```bash
   flutter pub get
   ```

2. **Generate Code**
   ```bash
   flutter packages pub run build_runner build
   ```

3. **Run the App**
   ```bash
   flutter run
   ```

## API

The app uses the [Fake Store API](https://fakestoreapi.com/) for demo data:
- Products: `https://fakestoreapi.com/products`
- Categories: `https://fakestoreapi.com/products/categories`

## Known Issues

There are some type conflicts between generated Drift models and custom models that need to be resolved:
- Product model conflicts between database and API models
- CartItem model conflicts
- Some type casting issues in BloC implementations

## Future Improvements

- Fix type conflicts between database and API models
- Add user authentication
- Implement product details screen
- Add order history
- Implement push notifications
- Add product reviews and ratings
- Implement wishlist functionality

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run tests and ensure code quality
5. Submit a pull request

## License

This project is for educational purposes and uses the MIT License.
