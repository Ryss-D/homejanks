import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/blocs/product/product_bloc.dart';
import '../../domain/blocs/product/product_event.dart';
import '../../domain/blocs/product/product_state.dart';
import '../../domain/blocs/cart/cart_bloc.dart';
import '../../domain/blocs/cart/cart_event.dart';
import '../../core/di/injection.dart';
import '../../core/localization/app_localizations.dart';
import '../widgets/common/cart_badge.dart';
import '../widgets/common/error_widget.dart' as custom_error;
import '../widgets/home/search_bar.dart';
import '../widgets/home/category_filter.dart';
import '../widgets/home/product_grid.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'All';

  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(const ProductEvent.loadProducts());
    context.read<CartBloc>().add(const CartEvent.loadCart());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.homeTitle),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          CartBadge(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider.value(
                    value: getIt<CartBloc>(),
                    child: const CartScreen(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          ProductSearchBar(
            controller: _searchController,
          ),
          // Category Filter
          CategoryFilter(
            selectedCategory: _selectedCategory,
            onCategorySelected: (category) {
              setState(() {
                _selectedCategory = category;
              });
            },
          ),
          // Products Grid
          Expanded(
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return const ShimmerProductGrid();
                } else if (state is ProductLoaded) {
                  return ProductGrid(products: state.products);
                } else if (state is ProductSearchLoaded) {
                  return ProductGrid(products: state.products);
                } else if (state is ProductError) {
                  return custom_error.CustomErrorWidget(
                    message: state.message,
                    onRetry: () {
                      context.read<ProductBloc>().add(const ProductEvent.loadProducts());
                    },
                  );
                }
                
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }


  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
