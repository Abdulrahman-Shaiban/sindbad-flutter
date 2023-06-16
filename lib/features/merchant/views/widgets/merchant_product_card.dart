import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sindebad/features/favorites/views/widgets/product_change_favorite_status_widget.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../../core/utils/constants/app_assets.dart';
import '../../../../core/utils/constants/constants.dart';
import '../../../../core/utils/squircle.helper.dart';
import '../../../products/data/models/product.dart';

class MerchantProductCard extends StatelessWidget {
  const MerchantProductCard({
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
    return Container(
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
                  Text(
                    '\$${products[index].price.toString()}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 13, color: Colors.red),
                    strutStyle: const StrutStyle(
                      height: 1.3,
                      forceStrutHeight: true,
                    ),
                  ),
                  const SizedBox(height: 7),
                  SizedBox(
                    height: 25,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        backgroundColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        side: const BorderSide(width: 1.0, color: Colors.blue),
                      ),
                      onPressed: () {},
                      child: Center(
                        child: Text(
                          'تعديل',
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 12,
                                    color: Colors.blue,
                                  ),
                          strutStyle: const StrutStyle(
                            height: 1,
                            forceStrutHeight: true,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
