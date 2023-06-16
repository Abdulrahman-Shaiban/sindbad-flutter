import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sindebad/core/styles/size_utils.dart';
import 'package:sindebad/core/utils/constants/constants.dart';
import 'package:sindebad/features/cart/views/widgets/cart_products_list_view.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/utils/common_functions.dart';
import '../logic/cart_view_controller.dart';

class CartView extends ConsumerStatefulWidget {
  const CartView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _ProductsViewState();
}

class _ProductsViewState extends ConsumerState<CartView> {
  @override
  void initState() {
    WidgetsBinding.instance.endOfFrame.then(
      (_) async {},
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.cart,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 3.ws,
        ),
        child: const Column(
          children: [
            CartProductsListView(),
          ],
        ),
      ),
      bottomNavigationBar: Material(
        elevation: 50,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(radius),
          topLeft: Radius.circular(radius),
        ),
        child: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: const BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(radius)),
          ),
          // padding: EdgeInsets.symmetric(horizontal: 5.ws, vertical: 2.hsbt0),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Text(
                      "${AppLocalizations.of(context)!.total}: ",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: AppColors.white,
                            fontSize: 16,
                          ),
                      strutStyle: const StrutStyle(
                        height: 1,
                        forceStrutHeight: true,
                      ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      ' ${formatPrices(
                        number: ref
                            .watch(cartChangeNotifierProvider)
                            .cartAllProductsTotal,
                      )} ريال',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: AppColors.white,
                            fontSize: 15,
                          ),
                      strutStyle: const StrutStyle(
                        height: 1,
                        forceStrutHeight: true,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  height: 40,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.displaySmall,
                      backgroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () {},
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'متابعة',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 15,
                                      color: AppColors.primaryColor,
                                    ),
                            strutStyle: const StrutStyle(
                              height: 1,
                              forceStrutHeight: true,
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Icon(
                            Icons.arrow_back_ios_new_outlined,
                            size: 15,
                            color: AppColors.primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
