import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sindebad/features/products/data/models/product.dart';

import '../../../products/data/models/product_image.dart';
import '../../data/models/category.dart';
import 'category_products_state.dart';

class CategoryProductsStateNotifier
    extends StateNotifier<CategoryProductsState> {
  CategoryProductsStateNotifier() : super(const CategoryProductsInitial());

  Future<void> getCategoryProducts() async {
    try {
      state = const CategoryProductsLoading();
      // final categoryProductsResponse = await _categoryRepository.getCategoryProducts(category: category);
      final categoryProductsResponse = await getFakeCategoryProducts();
      state = CategoryProductsLoaded(products: categoryProductsResponse);
    } catch (e,s) {
      state = const CategoryProductsError(error: 'Error');
    }
  }
}

getFakeCategoryProducts() {
  return [
    Product(
      id: '1',
      name: 'مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون ',
      price: '200.67',
      ratingAverage: 4.6,
      totalRatingsNumber: 430,
      description:
      'مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون',
      availableQuantity: 97,
      productImages: [
        ProductImage(
            imagePath:
            'image-vector/cosmetic-product-ad-transparent-circle-600w-1777871555.jpg'),
        ProductImage(
            imagePath:
            'image-vector/3d-illustration-various-blank-cosmetic-600w-1730749870.jpg'),
        ProductImage(
            imagePath:
            'image-vector/3d-illustration-green-tea-seed-600w-1782648659.jpg'),
      ],
      subCategoryName: "الدايت",
      supplierName: "اليمن الشامل التجارية",
    ),
    Product(
      id: '1',
      name: 'مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون ',
      price: '200.67',
      ratingAverage: 4.6,
      totalRatingsNumber: 430,
      description:
      'مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون',
      availableQuantity: 97,
      productImages: [
        ProductImage(
            imagePath:
            'image-vector/cosmetic-product-ad-transparent-circle-600w-1777871555.jpg'),
        ProductImage(
            imagePath:
            'image-vector/3d-illustration-various-blank-cosmetic-600w-1730749870.jpg'),
        ProductImage(
            imagePath:
            'image-vector/3d-illustration-green-tea-seed-600w-1782648659.jpg'),
      ],
      subCategoryName: "الدايت",
      supplierName: "اليمن الشامل التجارية",
    ),Product(
      id: '1',
      name: 'مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون ',
      price: '200.67',
      ratingAverage: 4.6,
      totalRatingsNumber: 430,
      description:
      'مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون',
      availableQuantity: 97,
      productImages: [
        ProductImage(
            imagePath:
            'image-vector/cosmetic-product-ad-transparent-circle-600w-1777871555.jpg'),
        ProductImage(
            imagePath:
            'image-vector/3d-illustration-various-blank-cosmetic-600w-1730749870.jpg'),
        ProductImage(
            imagePath:
            'image-vector/3d-illustration-green-tea-seed-600w-1782648659.jpg'),
      ],
      subCategoryName: "الدايت",
      supplierName: "اليمن الشامل التجارية",
    ),Product(
      id: '1',
      name: 'مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون ',
      price: '200.67',
      ratingAverage: 4.6,
      totalRatingsNumber: 430,
      description:
      'مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون',
      availableQuantity: 97,
      productImages: [
        ProductImage(
            imagePath:
            'image-vector/cosmetic-product-ad-transparent-circle-600w-1777871555.jpg'),
        ProductImage(
            imagePath:
            'image-vector/3d-illustration-various-blank-cosmetic-600w-1730749870.jpg'),
        ProductImage(
            imagePath:
            'image-vector/3d-illustration-green-tea-seed-600w-1782648659.jpg'),
      ],
      subCategoryName: "الدايت",
      supplierName: "اليمن الشامل التجارية",
    ),Product(
      id: '1',
      name: 'مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون ',
      price: '200.67',
      ratingAverage: 4.6,
      totalRatingsNumber: 430,
      description:
      'مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون',
      availableQuantity: 97,
      productImages: [
        ProductImage(
            imagePath:
            'image-vector/cosmetic-product-ad-transparent-circle-600w-1777871555.jpg'),
        ProductImage(
            imagePath:
            'image-vector/3d-illustration-various-blank-cosmetic-600w-1730749870.jpg'),
        ProductImage(
            imagePath:
            'image-vector/3d-illustration-green-tea-seed-600w-1782648659.jpg'),
      ],
      subCategoryName: "الدايت",
      supplierName: "اليمن الشامل التجارية",
    ),Product(
      id: '1',
      name: 'مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون ',
      price: '200.67',
      ratingAverage: 4.6,
      totalRatingsNumber: 430,
      description:
      'مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون',
      availableQuantity: 97,
      productImages: [
        ProductImage(
            imagePath:
            'image-vector/cosmetic-product-ad-transparent-circle-600w-1777871555.jpg'),
        ProductImage(
            imagePath:
            'image-vector/3d-illustration-various-blank-cosmetic-600w-1730749870.jpg'),
        ProductImage(
            imagePath:
            'image-vector/3d-illustration-green-tea-seed-600w-1782648659.jpg'),
      ],
      subCategoryName: "الدايت",
      supplierName: "اليمن الشامل التجارية",
    ),Product(
      id: '1',
      name: 'مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون ',
      price: '200.67',
      ratingAverage: 4.6,
      totalRatingsNumber: 430,
      description:
      'مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون',
      availableQuantity: 97,
      productImages: [
        ProductImage(
            imagePath:
            'image-vector/cosmetic-product-ad-transparent-circle-600w-1777871555.jpg'),
        ProductImage(
            imagePath:
            'image-vector/3d-illustration-various-blank-cosmetic-600w-1730749870.jpg'),
        ProductImage(
            imagePath:
            'image-vector/3d-illustration-green-tea-seed-600w-1782648659.jpg'),
      ],
      subCategoryName: "الدايت",
      supplierName: "اليمن الشامل التجارية",
    ),Product(
      id: '1',
      name: 'مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون ',
      price: '200.67',
      ratingAverage: 4.6,
      totalRatingsNumber: 430,
      description:
      'مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون',
      availableQuantity: 97,
      productImages: [
        ProductImage(
            imagePath:
            'image-vector/cosmetic-product-ad-transparent-circle-600w-1777871555.jpg'),
        ProductImage(
            imagePath:
            'image-vector/3d-illustration-various-blank-cosmetic-600w-1730749870.jpg'),
        ProductImage(
            imagePath:
            'image-vector/3d-illustration-green-tea-seed-600w-1782648659.jpg'),
      ],
      subCategoryName: "الدايت",
      supplierName: "اليمن الشامل التجارية",
    ),







  ];
}
