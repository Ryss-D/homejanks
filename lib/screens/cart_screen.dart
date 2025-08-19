import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../blocs/cart/cart_bloc.dart';
import '../blocs/cart/cart_event.dart';
import '../blocs/cart/cart_state.dart';
import '../models/cart_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CartBloc>().add(const CartEvent.loadCart());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is CartLoaded && state.items.isNotEmpty) {
                return IconButton(
                  icon: const Icon(Icons.delete_sweep),
                  onPressed: () {
                    _showClearCartDialog();
                  },
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CartLoaded) {
            if (state.items.isEmpty) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_cart_outlined, size: 64, color: Colors.grey),
                    SizedBox(height: 16),
                    Text(
                      'Your cart is empty',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Add some products to get started!',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              );
            }

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: state.items.length,
                    itemBuilder: (context, index) {
                      final item = state.items[index];
                      return _buildCartItem(item);
                    },
                  ),
                ),
                _buildCartSummary(state),
              ],
            );
          } else if (state is CartError) {
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
                      context.read<CartBloc>().add(const CartEvent.loadCart());
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
    );
  }

  Widget _buildCartItem(CartItem item) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Product Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: item.product.mediaUrls.isNotEmpty ? item.product.mediaUrls.first : '',
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  width: 80,
                  height: 80,
                  color: Colors.grey[300],
                  child: const Icon(Icons.image),
                ),
                errorWidget: (context, url, error) => Container(
                  width: 80,
                  height: 80,
                  color: Colors.grey[300],
                  child: const Icon(Icons.error),
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Product Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.product.displayName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.product.prices.isNotEmpty ? '\$${(item.product.prices.first.priceWithoutFormatting / 100).toStringAsFixed(2)}' : 'Price not available',
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      // Quantity Controls
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                if (item.quantity > 1) {
                                  context.read<CartBloc>().add(
                                    CartEvent.updateCartItemQuantity(
                                      productId: item.product.productId,
                                      quantity: item.quantity - 1,
                                    ),
                                  );
                                } else {
                        context.read<CartBloc>().add(
                          CartEvent.removeFromCart(productId: item.product.productId),
                        );
                                }
                              },
                              icon: const Icon(Icons.remove),
                              constraints: const BoxConstraints(
                                minWidth: 32,
                                minHeight: 32,
                              ),
                              padding: EdgeInsets.zero,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                '${item.quantity}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                context.read<CartBloc>().add(
                                  CartEvent.updateCartItemQuantity(
                                    productId: item.product.productId,
                                    quantity: item.quantity + 1,
                                  ),
                                );
                              },
                              icon: const Icon(Icons.add),
                              constraints: const BoxConstraints(
                                minWidth: 32,
                                minHeight: 32,
                              ),
                              padding: EdgeInsets.zero,
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      // Remove Button
                      IconButton(
                        onPressed: () {
                        context.read<CartBloc>().add(
                          CartEvent.removeFromCart(productId: item.product.productId),
                        );
                        },
                        icon: const Icon(Icons.delete, color: Colors.red),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartSummary(CartLoaded state) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Items: ${state.totalItems}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Total: \$${state.totalPrice.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                _showCheckoutDialog(state.totalPrice);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'Proceed to Checkout',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showClearCartDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Clear Cart'),
          content: const Text('Are you sure you want to remove all items from your cart?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                context.read<CartBloc>().add(const CartEvent.clearCart());
                Navigator.of(context).pop();
              },
              child: const Text('Clear', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  void _showCheckoutDialog(double totalPrice) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Checkout'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('This is a demo app. In a real app, you would integrate with a payment processor.'),
              const SizedBox(height: 16),
              Text(
                'Total Amount: \$${totalPrice.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<CartBloc>().add(const CartEvent.clearCart());
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Order placed successfully! (Demo)'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              child: const Text('Place Order'),
            ),
          ],
        );
      },
    );
  }
}
