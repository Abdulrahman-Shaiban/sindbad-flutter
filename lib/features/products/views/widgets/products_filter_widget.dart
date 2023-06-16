import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sindebad/core/styles/app_colors.dart';
import 'package:sindebad/core/styles/size_utils.dart';

import '../../../../core/utils/constants/constants.dart';

class ProductsFilterWidget extends ConsumerStatefulWidget {
  const ProductsFilterWidget({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _ProductsViewState();
}

class _ProductsViewState extends ConsumerState<ProductsFilterWidget> {
  @override
  void initState() {
    WidgetsBinding.instance.endOfFrame.then(
      (_) async {
        // ref.read(productsViewController).fetchProducts();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(
        start: 10,
      ),
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 23.msbt0,
          width: 22.msbt0,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Icon(
            Iconsax.filter,
            size: 13.msbt0,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
