import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sindebad/core/styles/size_utils.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../products/data/models/product.dart';
import '../../logic/merchant_products_view_controller.dart';
import 'merchant_product_card.dart';

final tabIndexProvider = StateProvider<int>(
  (ref) => 0,
);

class MerchantProductsGridView extends ConsumerStatefulWidget {
  const MerchantProductsGridView({
    Key? key,
    required this.products,
  }) : super(key: key);

  final List<Product> products;

  @override
  ConsumerState createState() => _MerchantProductsGridViewState();
}

class _MerchantProductsGridViewState
    extends ConsumerState<MerchantProductsGridView>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
    WidgetsBinding.instance.endOfFrame.then(
      (_) async {},
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.products.isEmpty
        ? SizedBox(
            width: 100.wsbt0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context)!.noProductsToBeShown,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColors.grey, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 50,
                  width: 50.wsbt0,
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      backgroundColor: AppColors.secondarySwatch[500],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      side:
                          const BorderSide(width: 1.0, color: AppColors.white),
                    ),
                    onPressed: () {
                      navigateToAddProductView(context: context);
                    },
                    icon: const Icon(
                      Icons.add,
                      color: AppColors.white,
                    ),
                    label: Text(
                      AppLocalizations.of(context)!.addProduct,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: AppColors.white, fontWeight: FontWeight.bold),
                      strutStyle: const StrutStyle(
                        height: 1,
                        forceStrutHeight: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        : Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 9.wsbt0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        width: 0.9,
                        color: AppColors.grey,
                      ),
                    ),
                    padding: EdgeInsets.zero,
                    child: TabBar(
                      controller: tabController,
                      isScrollable: false,
                      dividerColor: AppColors.primaryColor,
                      labelColor: AppColors.white,
                      unselectedLabelColor: AppColors.grey,
                      labelStyle: Theme.of(context).textTheme.bodyLarge,
                      unselectedLabelStyle:
                          Theme.of(context).textTheme.bodyMedium,
                      splashBorderRadius: BorderRadius.circular(
                        50,
                      ),
                      overlayColor: MaterialStateProperty.all<Color>(
                        AppColors.grey,
                      ),
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          color: AppColors.primaryColor),
                      physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics(),
                      ),
                      tabs: [
                        Tab(
                          text: AppLocalizations.of(context)!.mainProduct,
                        ),
                        Tab(
                          text: AppLocalizations.of(context)!.specialOffer,
                        ),
                      ],
                      onTap: (index) {
                        ref.read(tabIndexProvider.notifier).state = index;
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 25,
                    width: 100,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          textStyle: Theme.of(context).textTheme.displaySmall,
                          backgroundColor: AppColors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          side: const BorderSide(
                            color: Colors.red,
                          )),
                      onPressed: () {},
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.delete_forever_outlined,
                              size: 15,
                              color: Colors.red,
                            ),
                            const SizedBox(width: 3),
                            Text(
                              'حذف المحدد',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 12,
                                    color: Colors.red,
                                  ),
                              strutStyle: const StrutStyle(
                                height: 1,
                                forceStrutHeight: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                flex: 17,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  itemCount: widget.products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.67,
                  ),
                  itemBuilder: (context, index) {
                    return MerchantProductCard(
                      products: widget.products,
                      index: index,
                      isInFavoriteScreen: false,
                    );
                  },
                ),
              ),
            ],
          );
  }
}
