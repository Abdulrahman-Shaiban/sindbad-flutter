import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../../core/utils/constants/constants.dart';

class OffersLoadingWidget extends ConsumerWidget {
  const OffersLoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: Colors.grey,
      period: const Duration(milliseconds: 1300),
      child: Container(
        margin: const EdgeInsets.only(top: 5, bottom: 20, left: 17,right: 17),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: AppColors.grey,
        ),
      ),
    );
  }
}
