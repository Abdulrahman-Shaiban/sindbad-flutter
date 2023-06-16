import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/routes/app_routes.dart';
import '../data/models/product.dart';
import 'product_details/product_details_state.dart';
import 'product_details/product_details_state_notifier.dart';

final productDetailsStateNotifierProvider =
    StateNotifierProvider<ProductDetailsStateNotifier, ProductDetailsState>(
  (ref) => ProductDetailsStateNotifier(),
);

final carouselSliderCurrentIndexProvider = StateProvider<int>(
  (ref) => 0,
);

class ProductDetailsViewController {
  late WidgetRef ref;

  ProductDetailsViewController({required this.ref});

  fetchProductDetails({required Product product}) async {
    await ref
        .read(productDetailsStateNotifierProvider.notifier)
        .getProductDetails(
          product: product,
        );
  }
}

navigateToProductDetailsView(
    {required BuildContext context, required Product product}) {
  Navigator.pushNamed(
    context,
    AppRoutes.productDetailsView,
    arguments: product,
  );
}
