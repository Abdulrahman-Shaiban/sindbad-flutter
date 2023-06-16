import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/routes/app_routes.dart';
import '../../products/data/models/product.dart';
import '../../products/logic/change_product_favorite_status/change_product_favorite_status_state.dart';
import '../../products/logic/change_product_favorite_status/change_product_favorite_status_state_notifier.dart';
import '../../products/logic/product_details/product_details_state.dart';
import '../../products/logic/product_details/product_details_state_notifier.dart';

final addToFavoritesStateStateNotifierProvider = StateNotifierProvider<
    ChangeProductFavoriteStatusStateNotifier,
    ChangeProductFavoriteStatusState>(
      (ref) => ChangeProductFavoriteStatusStateNotifier(),
);


class ProductDetailsViewController {
  late WidgetRef ref;

  ProductDetailsViewController({required this.ref});

  fetchProductDetails({required Product product}) async {

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
