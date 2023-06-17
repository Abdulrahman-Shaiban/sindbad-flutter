import 'package:flutter/material.dart';

import '../../products/data/models/product.dart';
import '../data/models/cart.dart';

class CartChangeNotifier extends ChangeNotifier {
  Cart cart = Cart.init();
  double cartAllProductsTotal = 0.0;

  addToCart({required Product product}) {
    if (!cart.products.contains(product)) {
      cart.products.addAll(List.of([product]));
    }
    notifyListeners();
  }

  calcAllProductsTotal() {
    cartAllProductsTotal = 0.0;

    for (int i = 0; i < cart.products.length; i++) {
      double discount = cart.products[i].specialPrice != null
          ? cart.products[i].specialPrice!
          : 0.0;
      double price =
          cart.products[i].price != null && cart.products[i].price!.isNotEmpty
              ? double.parse(cart.products[i].price!)
              : 0.0;
      if (discount != 0.0) {
        cartAllProductsTotal =
            cartAllProductsTotal + (discount * cart.products[i].selectedQuantity);
      } else {
        cartAllProductsTotal =
            cartAllProductsTotal + (price * cart.products[i].selectedQuantity);
      }
    }
    notifyListeners();
  }

  deleteCartProduct({required Product product}) {
    cart.products.remove(product);
    calcAllProductsTotal();
    notifyListeners();
  }

}
