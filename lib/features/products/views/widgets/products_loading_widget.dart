import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sindebad/core/styles/size_utils.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../../core/utils/constants/constants.dart';
import '../../../../core/widgets/text_shimmer_widget.dart';

class ProductsLoadingWidget extends ConsumerWidget {
  const ProductsLoadingWidget({
    Key? key,
    this.forHomeView = true,
  }) : super(key: key);

  final bool forHomeView;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Shimmer.fromColors(
      baseColor: Colors.black45,
      highlightColor: Colors.black87,
      period: const Duration(milliseconds: 1300),
      child: forHomeView
          ? ListView.builder(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) => Container(
                padding: EdgeInsets.only(left: 3.5.wsbt0),
                decoration: const BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(radius),
                  ),
                ),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 80.msbt0,
                    minWidth: 60.msbt0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 15,
                        child: Container(
                          alignment: Alignment.topRight,
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(radius),
                              ),
                              color: AppColors.grey),
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: TextShimmerWidget(
                                width: 40.wsbt0,
                                margin: const EdgeInsets.symmetric(vertical: 5),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: TextShimmerWidget(
                                width: 25.wsbt0,
                                margin: const EdgeInsets.symmetric(
                                  vertical: 5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : GridView.builder(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 25,
                mainAxisSpacing: 25,
                childAspectRatio: 0.67,
              ),
              itemBuilder: (context, index) => Container(
                constraints: BoxConstraints(
                  maxWidth: 80.msbt0,
                  minWidth: 60.msbt0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 15,
                      child: Container(
                        alignment: Alignment.topRight,
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(radius),
                            ),
                            color: AppColors.grey),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: TextShimmerWidget(
                              width: 40.wsbt0,
                              margin: const EdgeInsets.symmetric(vertical: 5),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: TextShimmerWidget(
                              width: 25.wsbt0,
                              margin: const EdgeInsets.symmetric(
                                vertical: 5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
