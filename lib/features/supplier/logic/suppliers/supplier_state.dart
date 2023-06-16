import '../../data/models/supplier.dart';

abstract class SupplierState {
  const SupplierState();
}

class SuppliersInitial extends SupplierState {
  const SuppliersInitial();
}

class SuppliersLoading extends SupplierState {
  const SuppliersLoading();
}

class SuppliersLoaded extends SupplierState {
  final List<Supplier> suppliers;

  const SuppliersLoaded({required this.suppliers});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SuppliersLoaded && other.suppliers == suppliers;
  }

  @override
  int get hashCode => suppliers.hashCode;
}

class SuppliersError extends SupplierState {
  final String error;

  const SuppliersError({required this.error});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SuppliersError && other.error == error;
  }

  @override
  int get hashCode => error.hashCode;
}
