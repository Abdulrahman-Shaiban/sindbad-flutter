import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'suppliers_products/supplier_products_state.dart';
import 'suppliers_products/supplier_products_state_notifier.dart';

final supplierProductsStateNotifierProvider =
StateNotifierProvider<SupplierProductsStateNotifier, SupplierProductsState>(
      (ref) => SupplierProductsStateNotifier(),
);

class SupplierProductsViewController {
  late WidgetRef ref;

  SupplierProductsViewController({required this.ref});

  fetchSupplierProducts() async {
    await ref
        .read(supplierProductsStateNotifierProvider.notifier)
        .getSupplierProducts();
  }
}