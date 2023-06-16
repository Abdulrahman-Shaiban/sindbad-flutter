
import '../../../products/data/models/product.dart';

abstract class MerchantProductsState {
  const MerchantProductsState();
}

class MerchantProductsInitial extends MerchantProductsState {
  const MerchantProductsInitial();
}

class MerchantProductsLoading extends MerchantProductsState {
  const MerchantProductsLoading();
}

class MerchantProductsLoaded extends MerchantProductsState {
  final List<Product> merchantProducts;

  const MerchantProductsLoaded({required this.merchantProducts});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MerchantProductsLoaded &&
          runtimeType == other.runtimeType &&
          merchantProducts == other.merchantProducts;

  @override
  int get hashCode => merchantProducts.hashCode;
}

class MerchantProductsError extends MerchantProductsState {
  final String error;

  const MerchantProductsError({required this.error});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MerchantProductsError && other.error == error;
  }

  @override
  int get hashCode => error.hashCode;
}
