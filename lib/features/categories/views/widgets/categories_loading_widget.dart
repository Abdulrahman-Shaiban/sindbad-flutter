import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../../core/utils/constants/constants.dart';


class CategoriesLoadingWidget extends ConsumerStatefulWidget {
  const CategoriesLoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _ProductsLoadingWidgetState();
}

class _ProductsLoadingWidgetState
    extends ConsumerState<CategoriesLoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black45,
      highlightColor: Colors.black87,
      period: const Duration(milliseconds: 1300),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(top: 7, bottom: 7, left: 7),
            constraints: const BoxConstraints(
              maxWidth: 120,
              minWidth: 120,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              color: AppColors.grey,
            ),
          );
        },
      ),
    );
  }
}
