import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sindebad/core/styles/app_colors.dart';

import '../../data/models/product.dart';
import '../../data/models/product_image.dart';
import 'horizontal_product_card.dart';

class ProductsHorizontalListView extends ConsumerStatefulWidget {
  ProductsHorizontalListView({
    Key? key,
  }) : super(key: key);

  final List<Product> products = getFakeProducts();

  @override
  ConsumerState createState() => _ProductsGridViewState();
}

class _ProductsGridViewState extends ConsumerState<ProductsHorizontalListView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            'العروض والخصومات',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 17,
                  color: AppColors.primaryColor,
                ),
            strutStyle: const StrutStyle(
              height: 1,
              forceStrutHeight: true,
            ),
          ),
        ),
        Expanded(
          flex: 10,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            scrollDirection: Axis.horizontal,
            itemCount: widget.products.length, //widget.products.length,
            itemBuilder: (context, index) => HorizontalProductCard(
              products: widget.products,
              index: index,
            ),
          ),
        ),
      ],
    );
  }
}

getFakeProducts() {
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
    ),
  ];
}
