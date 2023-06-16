import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sindebad/core/styles/size_utils.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../../core/utils/constants/constants.dart';

class OrdersShimmerWidget extends ConsumerWidget {
  const OrdersShimmerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 2.ws,
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.black45,
        highlightColor: Colors.black87,
        period: const Duration(milliseconds: 1300),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              height: 280,
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(radius),
              ),
              margin: const EdgeInsets.all(4.0),
            );
          },
        ),
      ),
    );
  }
}
