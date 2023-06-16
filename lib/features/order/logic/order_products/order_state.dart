import '../../data/models/order.dart';

abstract class OrderState {}

class OrderInitial extends OrderState {
  OrderInitial();
}

class OrdersLoading extends OrderState {
  OrdersLoading();
}

class OrdersLoaded extends OrderState {
  final List<Order> orders;

  OrdersLoaded({required this.orders});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrdersLoaded && other.orders == orders;
  }

  @override
  int get hashCode => orders.hashCode;
}

class OrdersError extends OrderState {
  final String error;

  OrdersError({required this.error});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrdersError && other.error == error;
  }

  @override
  int get hashCode => error.hashCode;
}
