import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../../core/utils/constants/app_assets.dart';
import '../../../../core/utils/constants/constants.dart';
import '../../../products/data/models/product.dart';
import '../../logic/cart_view_controller.dart';

class CartProductsWidget extends ConsumerWidget {
  const CartProductsWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          height: 100,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: CachedNetworkImage(
                  imageUrl: product.productImages.isNotEmpty
                      ? imagesBaseUrl + product.productImages.first.imagePath!
                      : '',
                  placeholder: (context, _) => Image.asset(AppAssets.noImage),
                  imageBuilder: (context, imageProvider) => Container(
                    height: 80,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: imageProvider,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(radius),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(radius),
                      ),
                    ),
                    child: SizedBox(
                        height: double.infinity,
                        child: Image.asset(AppAssets.noImage)),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              product.name!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontSize: 11,
                                  ),
                              strutStyle: const StrutStyle(
                                height: 0.9,
                                forceStrutHeight: true,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Row(
                              children: [
                                Text(
                                  'الفئة: ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        fontSize: 12,
                                        color: AppColors.grey,
                                      ),
                                  strutStyle: const StrutStyle(
                                    height: 1.3,
                                    forceStrutHeight: true,
                                  ),
                                ),
                                Text(
                                  '${product.categoryName}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        fontSize: 12,
                                        color: AppColors.primaryColor,
                                      ),
                                  strutStyle: const StrutStyle(
                                    height: 1,
                                    forceStrutHeight: true,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'العدد: ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        fontSize: 12,
                                        color: AppColors.grey,
                                      ),
                                  strutStyle: const StrutStyle(
                                    height: 1.3,
                                    forceStrutHeight: true,
                                  ),
                                ),
                                Text(
                                  '${product.selectedQuantity}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        fontSize: 12,
                                        color: AppColors.primaryColor,
                                      ),
                                  strutStyle: const StrutStyle(
                                    height: 1,
                                    forceStrutHeight: true,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 50.0),
                          child: Row(
                            children: [
                              Text(
                                'السعر: ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontSize: 12,
                                      color: AppColors.grey,
                                    ),
                                strutStyle: const StrutStyle(
                                  height: 1,
                                  forceStrutHeight: true,
                                ),
                              ),
                              Text(
                                '\S${product.price}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontSize: 12,
                                      color: Colors.red,
                                    ),
                                strutStyle: const StrutStyle(
                                  height: 1.3,
                                  forceStrutHeight: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
            top: -5,
            left: -5,
            child: IconButton(
              icon: const Icon(Icons.highlight_remove, color: AppColors.grey),
              onPressed: () {
                CartViewController(ref: ref).removeFromCart(product: product);
              },
            ))
      ],
    );
  }
}
