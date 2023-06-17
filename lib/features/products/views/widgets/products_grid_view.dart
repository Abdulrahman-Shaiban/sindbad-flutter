import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sindebad/features/products/views/widgets/product_card.dart';

import '../../data/models/product.dart';
import 'products_filter_widget.dart';
import 'search_bar_widget.dart';

class ProductsGridView extends ConsumerWidget {
  const ProductsGridView({
    Key? key,
    required this.products,
    this.isInFavoriteScreen = false,
  }) : super(key: key);

  final List<Product> products;
  final bool isInFavoriteScreen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: const EdgeInsets.only(top: 20),
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      children: [
        const SizedBox(
          height: 45,
          child: Row(
            children: [
              Expanded(
                flex: 12,
                child: SearchBarWidget(),
              ),
              Expanded(flex: 2, child: ProductsFilterWidget()),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        products.isEmpty
            ? Center(
                child: Text(
                  AppLocalizations.of(context)!
                      .emptyDataMessage(AppLocalizations.of(context)!.products),
                ),
              )
            : GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(
                    products: products,
                    index: index,
                    isInFavoriteScreen: isInFavoriteScreen,
                  );
                },
              ),
      ],
    );
  }
}
