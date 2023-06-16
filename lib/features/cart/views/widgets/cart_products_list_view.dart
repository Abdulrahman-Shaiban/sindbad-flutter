import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/constants/constants.dart';
import '../../logic/cart_view_controller.dart';
import 'cart_product_widget.dart';

class CartProductsListView extends ConsumerStatefulWidget {
  const CartProductsListView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _CartProductsListViewState();
}

class _CartProductsListViewState extends ConsumerState<CartProductsListView> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(cartChangeNotifierProvider);

    return state.cart.products.isEmpty
        ? Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.5),
            child: Center(
              child: Text(
                AppLocalizations.of(context)!.emptyDataMessage(
                  AppLocalizations.of(context)!.products,
                ),
              ),
            ),
          )
        : ListView.builder(
            padding: const EdgeInsets.only(top: 25),
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            shrinkWrap: true,
            itemCount: state.cart.products.length,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.only(bottom: 12, left: 5, right: 5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius),
                ),
                child: CartProductsWidget(
                  product: state.cart.products[index],
                ),
              );
            },
          );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
