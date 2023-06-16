import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/routes/app_routes.dart';
import '../data/models/category.dart';
import 'categories/category_state.dart';
import 'categories/category_state_notifier.dart';

final categoriesStateNotifierProvider =
StateNotifierProvider<CategoryStateNotifier, CategoryState>(
      (ref) => CategoryStateNotifier(),
);

class CategoriesViewController {
  late WidgetRef ref;

  CategoriesViewController({required this.ref});

  fetchCategories() async {
    await ref.read(categoriesStateNotifierProvider.notifier).getCategories();
  }

}


navigateToCategoryProductsView(
    {required BuildContext context, required Category category}) {
  Navigator.pushNamed(
    context,
    AppRoutes.categoryProductsView,
    arguments: category,
  );
}