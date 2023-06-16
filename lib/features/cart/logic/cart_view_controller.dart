import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/routes/app_routes.dart';
import '../../products/data/models/product.dart';
import 'cart_change_notifier.dart';

final cartChangeNotifierProvider =
    ChangeNotifierProvider<CartChangeNotifier>((ref) {
  return CartChangeNotifier();
});

class CartViewController {
  late WidgetRef ref;

  CartViewController({required this.ref});

  Future<void> addToCart({
    required Product product,
  }) async {
    ref.read(cartChangeNotifierProvider).addToCart(product: product);
  }

  Future<void> removeFromCart({
    required Product product,
  }) async {
    ref.read(cartChangeNotifierProvider).deleteCartProduct(product: product);
  }
}

navigateToCartView({required BuildContext context}) {
  Navigator.pushNamed(
    context,
    AppRoutes.cartView,
  );
}
