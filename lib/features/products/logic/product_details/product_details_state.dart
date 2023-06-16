import '../../data/models/product.dart';

abstract class ProductDetailsState {
  Product? product;

  ProductDetailsState(
      {this.product});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductDetailsState &&
          runtimeType == other.runtimeType &&
          product == other.product;

  @override
  int get hashCode => product.hashCode;
}

class ProductDetailsInitial extends ProductDetailsState {
  ProductDetailsInitial ();
}

class ProductDetailsLoading extends ProductDetailsState {
  ProductDetailsLoading();
}

class ProductDetailsLoaded extends ProductDetailsState {
  ProductDetailsLoaded({required Product product})
      : super(product: product);
}

class ProductDetailsError extends ProductDetailsState {
  final String error;

  ProductDetailsError({required this.error});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductDetailsError && other.error == error;
  }

  @override
  int get hashCode => error.hashCode;
}

