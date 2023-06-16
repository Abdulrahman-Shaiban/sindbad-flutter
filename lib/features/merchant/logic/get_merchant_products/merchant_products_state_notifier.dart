import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/emuns/favorite_status_enum.dart';
import '../../../products/data/models/product.dart';
import '../../../products/data/models/product_image.dart';
import 'merchant_products_state.dart';

class MerchantProductsStateNotifier extends StateNotifier<MerchantProductsState> {
  MerchantProductsStateNotifier() : super(const MerchantProductsInitial());

  Future<void> fetchMerchantProducts() async {
    try {
      state = const MerchantProductsLoading();
      // final merchantProductsResponse = await _MerchantProductsRepository.fetchMerchantProducts();
      final merchantProductsResponse = await getFakeMerchantProductsProducts();
      state = MerchantProductsLoaded(merchantProducts: merchantProductsResponse);
    } catch (e) {
      state = const MerchantProductsError(error: 'Error');
    }
  }
}

getFakeMerchantProductsProducts() {
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
