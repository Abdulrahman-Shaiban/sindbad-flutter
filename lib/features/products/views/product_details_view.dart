import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sindebad/core/styles/size_utils.dart';

import '../../../core/styles/app_colors.dart';
import '../../cart/views/widgets/cart_icon_widget.dart';
import '../data/models/product.dart';
import '../logic/product_details/product_details_state.dart';
import '../logic/product_details_view_controller.dart';
import 'widgets/product_details_widget.dart';

class ProductDetailsView extends ConsumerStatefulWidget {
  const ProductDetailsView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _ProductsViewState();
}

class _ProductsViewState extends ConsumerState<ProductDetailsView> {
  @override
  void initState() {
    WidgetsBinding.instance.endOfFrame.then(
      (_) async {
        ProductDetailsViewController(ref: ref).fetchProductDetails(
            product: ModalRoute.of(context)!.settings.arguments as Product);
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;
    final state = ref.watch(productDetailsStateNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appName,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.white)),
        actions: [
          const CartIconWidget(),
          SizedBox(
            width: 5.msbt0,
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: SizedBox(
          child: Builder(builder: (BuildContext context) {
            switch (state.runtimeType) {
              case ProductDetailsLoaded:
                return ProductDetailsWidget(product: state.product!);
              case ProductDetailsError:
                return Center(
                  child: Text((state as ProductDetailsError).error),
                );
              case ProductDetailsLoading:
                return const Center(
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                    ),
                  ),
                );
              default:
                return const Center(
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                    ),
                  ),
                );
            }
          }),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
