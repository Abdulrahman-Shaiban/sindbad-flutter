import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'category_products/category_products_state.dart';
import 'category_products/category_products_state_notifier.dart';


final categoryProductsStateNotifierProvider =
StateNotifierProvider<CategoryProductsStateNotifier, CategoryProductsState>(
      (ref) => CategoryProductsStateNotifier(),
);

class CategoryProductsViewController {
  late WidgetRef ref;

  CategoryProductsViewController({required this.ref});

  fetchCategoryProducts() async {
    await ref
        .read(categoryProductsStateNotifierProvider.notifier)
        .getCategoryProducts();
  }

}
