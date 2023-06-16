import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sindebad/core/styles/size_utils.dart';
import 'package:sindebad/features/products/data/models/product.dart';

import '../../../../core/emuns/favorite_status_enum.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../core/utils/constants/constants.dart';
import '../../logic/change_product_favorite_status/change_product_favorite_status_state.dart';
import '../../logic/product_change_favorite_status_widget_controller.dart';

class FavoriteIconWidget extends StatelessWidget {
  const FavoriteIconWidget({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final changeProductFavoriteStatusState =
            ref.watch(addToFavoritesStateStateNotifierProvider);

        return Center(
          child: IconButton(
            icon: Container(
              height: 23.msbt0,
              width: 22.msbt0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(radius),
              ),
              child: changeProductFavoriteStatusState
                      is ChangeProductFavoriteStatusLoading
                  ? Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.secondarySwatch[500]!,
                        ),
                        strokeWidth: 2,
                      ),
                    )
                  : product.favoriteStatus == FavoriteStatus.favorite
                      ? Icon(
                          Iconsax.heart5,
                          color: AppColors.secondarySwatch[500],
                          size: 13.msbt0,
                        )
                      : Icon(
                          Iconsax.heart,
                          color: AppColors.secondarySwatch[500],
                          size: 12.msbt0,
                        ),
            ),
            onPressed: () {
                if (product.favoriteStatus == FavoriteStatus.favorite) {
                  // deleteFromFavorites
                } else {
                  // changeFavoriteStates
                }

            },
          ),
        );
      },
    );
  }
}
