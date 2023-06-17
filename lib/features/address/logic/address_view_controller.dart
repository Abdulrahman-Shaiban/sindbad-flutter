import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'order_products/address_state.dart';
import 'order_products/addresss_state_notifier.dart';

final addressStateNotifierProvider =
    StateNotifierProvider<AddressStateNotifier, AddressState>(
  (ref) => AddressStateNotifier(),
);

class AddressViewController {
  late WidgetRef ref;

  AddressViewController({required this.ref});

  fetchOrders() async {
    await ref.read(addressStateNotifierProvider.notifier).getOrdersList();
  }
}
