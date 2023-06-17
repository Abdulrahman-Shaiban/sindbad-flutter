import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../logic/address_view_controller.dart';
import '../logic/order_products/address_state.dart';
import 'widgets/address_list_widget.dart';
import 'widgets/address_shimmer_widget.dart';

class AddressView extends ConsumerStatefulWidget {
  const AddressView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _OrdersViewState();
}

class _OrdersViewState extends ConsumerState<AddressView> {
  @override
  void initState() {
    WidgetsBinding.instance.endOfFrame.then(
      (_) async {
        AddressViewController(ref: ref).fetchOrders();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AddressState ordersState = ref.watch(addressStateNotifierProvider);

    return RefreshIndicator(
      onRefresh: () async {
        AddressViewController(ref: ref).fetchOrders();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'العناوين',
          ),
        ),
        body: Builder(builder: (BuildContext context) {
          switch (ordersState.runtimeType) {
            case AddressLoaded:
              return AddressListWidget(
                address: (ordersState as AddressLoaded).orders,
              );
            case AddressError:
              return Text((ordersState as AddressError).error);
            case AddressLoading:
              return const AddressShimmerWidget();
            default:
              return const AddressShimmerWidget();
          }
        }),
      ),
    );
  }
}
