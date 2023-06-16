import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/emuns/favorite_status_enum.dart';
import '../../../products/data/models/product.dart';
import '../../../products/data/models/product_image.dart';
import 'favorites_state.dart';

class FavoritesStateStateNotifier extends StateNotifier<FavoritesState> {
  FavoritesStateStateNotifier() : super(const FavoritesInitial());

  Future<void> fetchFavorites() async {
    try {
      state = const FavoritesLoading();
      // final favoritesResponse = await _favoritesRepository.fetchFavorites();
      final favoritesResponse = await getFakeFavoritesProducts();
      state = FavoritesLoaded(favorites: favoritesResponse);
    } catch (e) {
      state = const FavoritesError(error: 'Error');
    }
  }
}

getFakeFavoritesProducts() {
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
    ),];
}
