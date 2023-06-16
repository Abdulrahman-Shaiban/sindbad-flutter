import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/category.dart';
import 'category_state.dart';

class CategoryStateNotifier extends StateNotifier<CategoryState> {
  CategoryStateNotifier() : super(const CategoriesInitial());

  Future<void> getCategories() async {
    try {
      state = const CategoriesLoading();
      // final categoriesResponse = await _categoryRepository.fetchCategories();
      final categoriesResponse = await fetchCategories();
      state = CategoriesLoaded(categories: categoriesResponse);
    } catch (e) {
      state = const CategoriesError(
        error: 'Error',
      );
    }
  }
}

fetchCategories() {
  return [
    Category(
      id: '1',
      name: 'معدات الصيانة',
      imageName: 'maintenance-',
    ),
    Category(
      id: '1',
      name: 'الكترونيات',
      imageName: 'shower',
    ),
    Category(
      id: '1',
      name: 'الادوات الصحية',
      imageName: 'Path 5727',
    ),
    Category(
      id: '1',
      name: 'معدات الصيانة',
      imageName: 'heavy-construction-equipment',
    ),
    Category(
      id: '1',
      name: 'الكترونيات',
      imageName: 'electricity',
    ),
    Category(
      id: '1',
      name: 'الادوات الصحية',
      imageName: 'heavy-construction-equipment',
    ),
  ];
}
