import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sindebad/core/styles/size_utils.dart';

import '../../../../core/styles/app_colors.dart';
import '../../logic/change_product_favorite_status/change_product_favorite_status_state.dart';
import '../../logic/product_change_favorite_status_widget_controller.dart';

class ChangeProductFavoriteStatusWidget extends ConsumerWidget {
  const ChangeProductFavoriteStatusWidget({
    Key? key,
    required this.index,
    required this.onTap,
    required this.isInFavoriteScreen,
  }) : super(key: key);

  final int index;
  final Function() onTap;
  final bool isInFavoriteScreen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final changeProductFavoriteStatusState =
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
        onTap: onTap,
        child: changeProductFavoriteStatusState is ChangeProductFavoriteStatusLoading &&
            (changeProductFavoriteStatusState as ChangeProductFavoriteStatusLoading).index == index
            ? const Padding(
              padding: EdgeInsets.all(7.0),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                strokeWidth: 2,
              ),
            )
            : isInFavoriteScreen
                ? Icon(
                    Iconsax.heart5,
                    color: AppColors.secondarySwatch[500],
                    size: 10.msbt0,
                  )
                : Icon(
                    Iconsax.heart,
                    color: AppColors.white,
                    size: 9.msbt0,
                  ),
      ),
    );
  }
}
