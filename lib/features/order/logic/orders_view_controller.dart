import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'order_products/order_state.dart';
import 'order_products/orders_state_notifier.dart';

final ordersStateNotifierProvider =
    StateNotifierProvider<OrdersStateNotifier, OrderState>(
  (ref) => OrdersStateNotifier(),
);

class OrdersViewController {
  late WidgetRef ref;

  OrdersViewController({required this.ref});

  fetchOrders() async {
    await ref.read(ordersStateNotifierProvider.notifier).getOrdersList();
  }
}

