import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sindebad/core/styles/size_utils.dart';

import '../../../../core/emuns/favorite_status_enum.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../products/data/models/product.dart';
import '../../../products/logic/change_product_favorite_status/change_product_favorite_status_state.dart';
import '../../logic/product_change_favorite_status_widget_controller.dart';

class ProductChangeFavoriteStatusWidget extends ConsumerWidget {
  const ProductChangeFavoriteStatusWidget({
    Key? key,
    required this.product,
    this.index,
    this.decoration,
    this.emptyIconColor,
    this.size,
  }) : super(key: key);

  final int? index;
  final Product product;
  final BoxDecoration? decoration;
  final Color? emptyIconColor;
  final double? size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (context, ref, child) {
      final changeProductFavoriteStatusState =
          ref.watch(addToFavoritesStateStateNotifierProvider);
      return Container(
        height: size!= null ? 18.msbt0 :14.5.msbt0,
        width: size!= null ? 18.msbt0 :14.5.msbt0,
        decoration: decoration ??
            BoxDecoration(
              color: AppColors.lightBlack.withOpacity(0.2),
              borderRadius: const BorderRadius.all(
                Radius.circular(50),
              ),
            ),
        child: InkWell(
          borderRadius: const BorderRadius.all(
            Radius.circular(50),
          ),
          onTap: () {
            // changeFavoriteStates(
            //          product: state.products[index],
            //          productId: state.products[index].id!,
            //          index: index,
            //          favoriteProductType: favoriteProductType);
          },
          child: changeProductFavoriteStatusState
                      is ChangeProductFavoriteStatusLoading &&
                  changeProductFavoriteStatusState.index == index
              ? const Padding(
                  padding: EdgeInsets.all(7.0),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    strokeWidth: 2,
                  ),
                )
              : (product.favoriteStatus == FavoriteStatus.favorite)
                  ? Icon(
                      Iconsax.heart5,
                      color: AppColors.secondarySwatch[500],
                      size: size != null ? size! + 1.5.msbt0 : 10.msbt0,
                    )
                  : Icon(
                      Iconsax.heart,
                      color: emptyIconColor ?? AppColors.white,
                      size: size ?? 9.msbt0,
                    ),
        ),
      );
    });
  }
}
