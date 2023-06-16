import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sindebad/core/styles/size_utils.dart';

import '../../../core/styles/app_colors.dart';
import '../logic/get_merchant_products/merchant_products_state.dart';
import '../logic/merchant_products_view_controller.dart';
import 'widgets/merchant_products_grid_view.dart';
import '../../products/views/widgets/products_loading_widget.dart';
import '../logic/offers_slider_widget_controller.dart';

class MerchantProductsView extends ConsumerStatefulWidget {
  const MerchantProductsView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _MerchantProductsViewState();
}

class _MerchantProductsViewState extends ConsumerState<MerchantProductsView> {
  @override
  void initState() {
    WidgetsBinding.instance.endOfFrame.then(
      (_) async {
        MerchantProductsViewController(ref: ref).fetchMerchantProducts();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MerchantProductsState state = ref.watch(merchantProductsStateNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
            AppLocalizations.of(context)!
                .merchantAccount,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Iconsax.add_circle,
              size: 11.5.msbt0,
              color: AppColors.white,
            ),
            onPressed: () {
              navigateToAddProductView(context: context);
            },
          ),
          SizedBox(
            width: 2.3.wsbt0,
          )
        ],      ),
      body: RefreshIndicator(
        onRefresh: () async {
          MerchantProductsViewController(ref: ref).fetchMerchantProducts();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.ws),
          child: Builder(
            builder: (BuildContext context) {
              switch (state.runtimeType) {
                case MerchantProductsLoaded:
                  return MerchantProductsGridView(
                    products: (state as MerchantProductsLoaded).merchantProducts,
                  );
                case MerchantProductsError:
                  return Center(child: Text((state as MerchantProductsError).error));
                case MerchantProductsLoading:
                  return const ProductsLoadingWidget(
                    forHomeView: false,
                  );
                default:
                  return const ProductsLoadingWidget(
                    forHomeView: false,
                  );
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
