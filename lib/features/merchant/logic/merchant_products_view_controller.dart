import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/routes/app_routes.dart';
import 'get_merchant_products/merchant_products_state.dart';
import 'get_merchant_products/merchant_products_state_notifier.dart';

final merchantProductsStateNotifierProvider =
StateNotifierProvider<MerchantProductsStateNotifier, MerchantProductsState>(
      (ref) => MerchantProductsStateNotifier(),
);

class MerchantProductsViewController {
  late WidgetRef ref;

  MerchantProductsViewController({required this.ref});

  Future<void> fetchMerchantProducts() async {
    await ref
        .read(merchantProductsStateNotifierProvider.notifier)
        .fetchMerchantProducts();
  }
}

navigateToAddProductView({
  required BuildContext context,
}) {
  Navigator.pushNamed(
    context,
    AppRoutes.addProductView,
  );
}
