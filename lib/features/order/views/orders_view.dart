import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../logic/order_products/order_state.dart';
import '../logic/orders_view_controller.dart';
import 'widgets/orders_list_widget.dart';
import 'widgets/orders_shimmer_widget.dart';

class OrdersView extends ConsumerStatefulWidget {
  const OrdersView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _OrdersViewState();
}

class _OrdersViewState extends ConsumerState<OrdersView>{

  @override
  void initState() {
    WidgetsBinding.instance.endOfFrame.then(
      (_) async {
        OrdersViewController(ref:ref).fetchOrders();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final OrderState ordersState = ref.watch(ordersStateNotifierProvider);

    return RefreshIndicator(
      onRefresh: () async {
        OrdersViewController(ref:ref).fetchOrders();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.orders,
          ),
        ),
        body: Builder(builder: (BuildContext context) {
          switch (ordersState.runtimeType) {
            case OrdersLoaded:
              return OrdersListWidget(
                orders: (ordersState as OrdersLoaded).orders,
              );
            case OrdersError:
              return Text(
                  (ordersState as OrdersError).error
              );
            case OrdersLoading:
              return const OrdersShimmerWidget();
            default:
              return const OrdersShimmerWidget();
          }
        }),
      ),
    );
  }

}
