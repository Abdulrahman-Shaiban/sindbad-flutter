import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/routes/app_routes.dart';
import '../data/models/supplier.dart';
import 'suppliers/supplier_state.dart';
import 'suppliers/supplier_state_notifier.dart';
import 'suppliers_products/supplier_products_state.dart';
import 'suppliers_products/supplier_products_state_notifier.dart';


final supplierStateNotifierProvider =
StateNotifierProvider<SupplierStateNotifier, SupplierState>(
      (ref) => SupplierStateNotifier(),
);

class SuppliersViewController {
  late WidgetRef ref;

  SuppliersViewController({required this.ref});

  fetchSuppliers() async {
    await ref.read(supplierStateNotifierProvider.notifier).getSuppliers();
  }

}


navigateToSupplierProductsView(
    {required BuildContext context, required Supplier supplier}) {
  Navigator.pushNamed(
    context,
    AppRoutes.supplierProductsView,
    arguments: supplier,
  );
}