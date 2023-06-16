import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sindebad/features/favorites/views/widgets/product_change_favorite_status_widget.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../../core/utils/constants/app_assets.dart';
import '../../../../core/utils/constants/constants.dart';
import '../../../../core/utils/squircle.helper.dart';
import '../../data/models/product.dart';
import '../../logic/product_details_view_controller.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.products,
    required this.index,
    required this.isInFavoriteScreen,
  });

  final List<Product> products;
  final bool isInFavoriteScreen;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateToProductDetailsView(
            context: context, product: products[index]);
      },
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 140,
          minWidth: 100,
        ),
        margin: const EdgeInsets.only(top: 7, bottom: 7),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: squircle(radius: 0.02),
          shadows: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0.0, 4.0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: CachedNetworkImage(
                imageUrl: products[index].productImages.isNotEmpty
                    ? imagesBaseUrl +
                        products[index].productImages.first.imagePath!
                    : '',
                placeholder: (context, _) => Image.asset(AppAssets.noImage),
                imageBuilder: (context, imageProvider) => Container(
                  alignment: Alignment.topLeft,
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
                  child: ProductChangeFavoriteStatusWidget(
                    index: index,
                    product: products[index],
                  ),
                ),
                //TODO:edit
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
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      products[index].name!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 11,
                          ),
                      strutStyle: const StrutStyle(
                        height: 1,
                        forceStrutHeight: true,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 17,
                        ),
                        Text(
                          products[index].ratingAverage.toString(),
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 12,
                                  ),
                          strutStyle: const StrutStyle(
                            height: 1.3,
                            forceStrutHeight: true,
                          ),
                        ),
                        Text(
                          ' (${AppLocalizations.of(context)!.rating}${products[index].totalRatingsNumber})',
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 10,
                                    color: AppColors.grey,
                                  ),
                          strutStyle: const StrutStyle(
                            height: 1,
                            forceStrutHeight: true,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Text(
                            products[index].price.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontSize: 13, color: Colors.red),
                            strutStyle: const StrutStyle(
                              height: 1.3,
                              forceStrutHeight: true,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(
                            height: 22,
                            padding: const EdgeInsetsDirectional.only(
                                start: 7, end: 1.7),
                            decoration: ShapeDecoration(
                              color: Colors.red[600],
                              shape: squircle(radius: 0.013),
                              shadows: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 10,
                                  offset: const Offset(0.0, 4.0),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Text(
                                    'اضف للسلة',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            fontSize: 9,
                                            color: AppColors.white,
                                            fontWeight: FontWeight.bold),
                                    strutStyle: const StrutStyle(
                                      height: 0.7,
                                      forceStrutHeight: true,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    height: 19,
                                    width: 19,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          blurRadius: 10,
                                          offset: const Offset(0.0, 4.0),
                                        ),
                                      ],
                                    ),
                                    child: const Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: Colors.red,
                                      size: 10,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
