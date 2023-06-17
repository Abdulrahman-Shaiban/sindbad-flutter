import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/address.dart';
import 'address_state.dart';

class AddressStateNotifier extends StateNotifier<AddressState> {
  AddressStateNotifier() : super(AddressInitial());

  Future<void> getOrdersList() async {
    try {
      state = AddressLoading();
      // final getOrdersResponse = await _orderRepository.getOrdersList();
      final getOrdersResponse = await getFakeAddress();

      state = AddressLoaded(orders: getOrdersResponse ?? []);
    } catch (e) {
      state = AddressError(error: 'Error');
    }
  }
}

getFakeAddress() {
  return [
    Address(
      id: '1',
      addressName: 'الجزائر - جوار الليبي مول',
    ),
    Address(
      id: '1',
      addressName: 'الجزائر - جوار الليبي مول',
    ),
    Address(
      id: '1',
      addressName: 'الجزائر - جوار الليبي مول',
    ),
  ];
}
