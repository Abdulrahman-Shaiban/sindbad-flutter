import '../../../products/data/models/product.dart';
import '../../data/models/supplier.dart';

abstract class SupplierProductsState {
  const SupplierProductsState();
}

class SupplierProductsInitial extends SupplierProductsState {
  const SupplierProductsInitial();
}

class SupplierProductsLoading extends SupplierProductsState {
  const SupplierProductsLoading();
}

class SupplierProductsLoaded extends SupplierProductsState {
  final List<Product> products;

  const SupplierProductsLoaded({required this.products});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SupplierProductsLoaded && other.products == products;
  }

  @override
  int get hashCode => products.hashCode;
}

class SupplierProductsError extends SupplierProductsState {
  final String error;

  const SupplierProductsError({required this.error});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SupplierProductsError && other.error == error;
  }

  @override
  int get hashCode => error.hashCode;
}
