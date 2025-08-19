import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/blocs/product/product_bloc.dart';
import '../../../domain/blocs/product/product_event.dart';
import '../../../domain/blocs/product/product_state.dart';

class CategoryFilter extends StatelessWidget {
  final String selectedCategory;
  final ValueChanged<String> onCategorySelected;

  const CategoryFilter({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
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
              final isSelected = selectedCategory == category;
              
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: FilterChip(
                  label: Text(category),
                  selected: isSelected,
                  onSelected: (selected) {
                    onCategorySelected(category);
                    
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
    );
  }
}
