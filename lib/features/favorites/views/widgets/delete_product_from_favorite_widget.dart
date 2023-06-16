import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sindebad/core/styles/size_utils.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../products/data/models/product.dart';
import '../../logic/change_product_favorite_status/change_product_favorite_status_state.dart';
import '../../logic/delete_product_from_favorite_widget_controller.dart';
import '../../logic/product_change_favorite_status_widget_controller.dart';

class DeleteProductFromFavoriteWidget extends ConsumerWidget {
  const DeleteProductFromFavoriteWidget({
    Key? key,
    required this.index,
    required this.product,
  }) : super(key: key);

  final int index;
  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deletingFromFavoriteState =
        ref.watch(addToFavoritesStateStateNotifierProvider);
    return Container(
      height: 14.5.msbt0,
      width: 14.5.msbt0,
      decoration: BoxDecoration(
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
          DeleteProductFromFavoriteWidgetController(ref: ref)
              .deleteFromFavoriteList(
            index: index,
            context: context,
          );
        },
        child:
            deletingFromFavoriteState is ChangeProductFavoriteStatusLoading &&
                    (deletingFromFavoriteState
                                as ChangeProductFavoriteStatusLoading)
                            .index ==
                        index
                ? const Padding(
                    padding: EdgeInsets.all(7.0),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      strokeWidth: 2,
                    ),
                  )
                : Icon(
                    Iconsax.heart5,
                    color: AppColors.secondarySwatch[500],
                    size: 10.msbt0,
                  ),
      ),
    );
  }
}
