import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sindebad/core/styles/size_utils.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../../core/utils/constants/app_localizations.dart';
import '../../../../core/utils/initializer.dart';
import '../../logic/cart_view_controller.dart';

class CartIconWidget extends StatelessWidget {
  const CartIconWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(cartChangeNotifierProvider);

        return Center(
          child: badges.Badge(
            badgeAnimation: const badges.BadgeAnimation.fade(
                animationDuration: Duration(seconds: 1)),
            badgeStyle: badges.BadgeStyle(
              shape: badges.BadgeShape.circle,
              badgeColor: AppColors.secondarySwatch[400]!,
            ),
            position: locator<Locale>() == AppConstLocalizations.english
                ? badges.BadgePosition.topEnd(top: 2, end: 5)
                : badges.BadgePosition.topStart(top: 2, start: 5),
            badgeContent: Center(
              child: Text(
                state.cart.products.length.toString(),
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            child: IconButton(
              icon: Icon(
                Iconsax.shopping_cart,
                size: 12.5.msbt0,
              ),
              onPressed: () => navigateToCartView(context: context),
            ),
          ),
        );
      },
    );
  }
}
