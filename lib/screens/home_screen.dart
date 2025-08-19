import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import '../blocs/product/product_bloc.dart';
import '../blocs/product/product_event.dart';
import '../blocs/product/product_state.dart';
import '../blocs/cart/cart_bloc.dart';
import '../blocs/cart/cart_event.dart';
import '../blocs/cart/cart_state.dart';
import '../models/product.dart';
import '../core/di/injection.dart';
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
        title: const Text('E-Commerce App'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              int itemCount = 0;
              if (state is CartLoaded) {
                itemCount = state.totalItems;
              }
              return Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
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
                  if (itemCount > 0)
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Text(
                          '$itemCount',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search products...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    context.read<ProductBloc>().add(const ProductEvent.loadProducts());
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onSubmitted: (query) {
                if (query.isNotEmpty) {
                  context.read<ProductBloc>().add(ProductEvent.searchProducts(query: query));
                } else {
                  context.read<ProductBloc>().add(const ProductEvent.loadProducts());
                }
              },
            ),
          ),
          // Category Filter
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              List<String> categories = ['All'];
              if (state is ProductLoaded) {
                categories.addAll(state.categories);
              }
              
              return Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    final isSelected = _selectedCategory == category;
                    
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: FilterChip(
                        label: Text(category),
                        selected: isSelected,
                        onSelected: (selected) {
                          setState(() {
                            _selectedCategory = category;
                          });
                          
                          if (category == 'All') {
                            context.read<ProductBloc>().add(const ProductEvent.loadProducts());
                          } else {
                            context.read<ProductBloc>().add(ProductEvent.loadProductsByCategory(category: category));
                          }
                        },
                      ),
                    );
                  },
                ),
              );
            },
          ),
          // Products Grid
          Expanded(
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return _buildShimmerGrid();
                } else if (state is ProductLoaded) {
                  return _buildProductGrid(state.products);
                } else if (state is ProductSearchLoaded) {
                  return _buildProductGrid(state.products);
                } else if (state is ProductError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.error, size: 64, color: Colors.red),
                        const SizedBox(height: 16),
                        Text(state.message),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            context.read<ProductBloc>().add(const ProductEvent.loadProducts());
                          },
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
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

  Widget _buildProductGrid(List<Product> products) {
    if (products.isEmpty) {
      return const Center(
        child: Text('No products found'),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return _buildProductCard(product);
      },
    );
  }

  Widget _buildProductCard(Product product) {
    return Card(
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
              child: CachedNetworkImage(
                imageUrl: product.mediaUrls.isNotEmpty ? product.mediaUrls.first : '',
                fit: BoxFit.cover,
                width: double.infinity,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    color: Colors.white,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.displayName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product.prices.isNotEmpty ? '\$${(product.prices.first.priceWithoutFormatting / 100).toStringAsFixed(2)}' : 'Price not available',
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<CartBloc>().add(CartEvent.addToCart(product: product, quantity: 1));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${product.displayName} added to cart'),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 4),
                      ),
                      child: const Text('Add to Cart', style: TextStyle(fontSize: 10)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Card(
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 12,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 4),
                        Container(
                          height: 12,
                          width: 60,
                          color: Colors.white,
                        ),
                        const Spacer(),
                        Container(
                          height: 30,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
