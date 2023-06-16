import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/supplier.dart';
import 'supplier_state.dart';

class SupplierStateNotifier extends StateNotifier<SupplierState> {
  SupplierStateNotifier() : super(const SuppliersInitial());

  Future<void> getSuppliers() async {
    try {
      state = const SuppliersLoading();
      // final suppliersResponse = await _supplierRepository.fetchSuppliers();
      final suppliersResponse = await fetchSuppliers();
      state = SuppliersLoaded(suppliers: suppliersResponse);
    } catch (e) {
      state = const SuppliersError(
        error: 'Error',
      );
    }
  }
}

fetchSuppliers() {
  return [
    Supplier(
      id: '1',
      name: 'موؤسسة ابو الرجال',
    ),
    Supplier(
      id: '1',
      name: 'موؤسسة ابو الرجال',
    ),
    Supplier(
      id: '1',
      name: 'موؤسسة ابو الرجال',
    ),
    Supplier(
      id: '1',
      name: 'موؤسسة ابو الرجال',
    ),
    Supplier(
      id: '1',
      name: 'موؤسسة ابو الرجال',
    ),
  ];
}
