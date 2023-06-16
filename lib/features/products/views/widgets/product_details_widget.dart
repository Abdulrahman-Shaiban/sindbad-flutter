import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sindebad/core/styles/size_utils.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../../core/utils/common_functions.dart';
import '../../../../core/utils/constants/app_assets.dart';
import '../../../../core/utils/constants/constants.dart';
import '../../../cart/views/widgets/add_to_cart_button.dart';
import '../../../favorites/views/widgets/product_change_favorite_status_widget.dart';
import '../../data/models/product.dart';
import '../../logic/product_details_view_controller.dart';

class ProductDetailsWidget extends ConsumerStatefulWidget {
  const ProductDetailsWidget({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;

  @override
  ConsumerState createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends ConsumerState<ProductDetailsWidget> {
  @override
  void initState() {
    WidgetsBinding.instance.endOfFrame.then(
      (_) async {},
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: ListView(
        children: [
          SizedBox(
            height: 40.hsbt0,
            child: Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 40.hsbt0,
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      ref
                          .read(carouselSliderCurrentIndexProvider.notifier)
                          .state = index;
                    },
                  ),
                  items: widget.product.productImages.map((productImage) {
                    return CachedNetworkImage(
                      imageUrl: widget.product.productImages.isNotEmpty
                          ? imagesBaseUrl + productImage.imagePath!
                          : '',
                      fit: BoxFit.fill,
                      placeholder: (context, _) =>
                          Image.asset(AppAssets.noImage),
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: imageProvider,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Image.asset(
                        AppAssets.noImage,
                      ),
                    );
                  }).toList(),
                ),
                if (widget.product.productImages.isNotEmpty)
                  Positioned(
                    bottom: 1.5,
                    child: SizedBox(
                      width: 100.wsbt0,
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 1),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(radius),
                            color: AppColors.primaryColor,
                          ),
                          child: DotsIndicator(
                            dotsCount: widget.product.productImages.length,
                            position:
                                ref.watch(carouselSliderCurrentIndexProvider),
                            decorator: DotsDecorator(
                              activeColor: AppColors.secondarySwatch[500],
                              color: AppColors.white,
                              spacing: const EdgeInsets.symmetric(
                                  horizontal: 3, vertical: 2),
                              size: const Size(6.5, 6.5),
                              activeSize: const Size(8.5, 8.5),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                Positioned(
                  top: 10.5,
                  left: 10.5,
                  child: ProductChangeFavoriteStatusWidget(
                    product: widget.product,
                    size: 12.msbt0,
                    emptyIconColor: AppColors.primarySwatch[500],
                    decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.6),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.grey.withOpacity(0.3),
                          blurRadius: 10.0,
                          offset: const Offset(0, 4),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const Divider(
            color: AppColors.primaryColor,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.wsbt0),
            child: Wrap(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 14,
                      child: Text(
                        widget.product.name ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: AppColors.lightBlack),
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5.wsbt0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 7,
                  child: RatingBarIndicator(
                    rating: widget.product.ratingAverage.toDouble(),
                    itemBuilder: (context, index) => const Icon(
                      Icons.star_rounded,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 24.0,
                    direction: Axis.horizontal,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    widget.product.ratingAverage.toString(),
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.lightBlack),
                  ),
                ),
                Expanded(
                  flex: 12,
                  child: Text(
                    "(${AppLocalizations.of(context)!.rating} + ${widget.product.totalRatingsNumber.toString()})",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: AppColors.primaryColor,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.wsbt0),
            child: Wrap(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        "${AppLocalizations.of(context)!.category} :",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: AppColors.lightBlack),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      flex: 11,
                      child: Text(
                        widget.product.subCategoryName ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: AppColors.primaryColor),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.wsbt0),
            child: Wrap(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        "${AppLocalizations.of(context)!.status} :",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: AppColors.lightBlack),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      flex: 11,
                      child: Text(
                        widget.product.productStatus ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: AppColors.primaryColor),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            color: AppColors.primaryColor,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.wsbt0),
            child: Wrap(children: [
              Text(
                "${AppLocalizations.of(context)!.description} :",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: AppColors.lightBlack),
                overflow: TextOverflow.visible,
              ),
              Text(
                widget.product.description ?? '',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: AppColors.lightBlack),
                overflow: TextOverflow.visible,
              ),
            ]),
          ),
          const Divider(
            color: AppColors.primaryColor,
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.wsbt0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    "${AppLocalizations.of(context)!.share} :",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: AppColors.lightBlack),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  flex: 13,
                  child: Row(
                    children: [
                      Container(
                        height: 14.msbt0,
                        width: 14.msbt0,
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        child: InkWell(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(50),
                          ),
                          onTap: () {},
                          child: Icon(
                            Iconsax.heart,
                            color: AppColors.white,
                            size: 9.msbt0,
                          ),
                        ),
                      ),
                      Container(
                        height: 14.msbt0,
                        width: 14.msbt0,
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        child: InkWell(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(50),
                          ),
                          onTap: () {},
                          child: Icon(
                            Iconsax.heart,
                            color: AppColors.white,
                            size: 9.msbt0,
                          ),
                        ),
                      ),
                      Container(
                        height: 14.msbt0,
                        width: 14.msbt0,
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        child: InkWell(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(50),
                          ),
                          onTap: () {},
                          child: Icon(
                            Iconsax.heart,
                            color: AppColors.white,
                            size: 9.msbt0,
                          ),
                        ),
                      ),
                      Container(
                        height: 14.msbt0,
                        width: 14.msbt0,
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        child: InkWell(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(50),
                          ),
                          onTap: () {},
                          child: Icon(
                            Iconsax.heart,
                            color: AppColors.white,
                            size: 9.msbt0,
                          ),
                        ),
                      ),
                      Container(
                        height: 14.msbt0,
                        width: 14.msbt0,
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        child: InkWell(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(50),
                          ),
                          onTap: () {},
                          child: Icon(
                            Iconsax.heart,
                            color: AppColors.white,
                            size: 9.msbt0,
                          ),
                        ),
                      ),
                      Container(
                        height: 14.msbt0,
                        width: 14.msbt0,
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        child: InkWell(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(50),
                          ),
                          onTap: () {},
                          child: Icon(
                            Iconsax.heart,
                            color: AppColors.white,
                            size: 9.msbt0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 13,
          ),
        ],
      ),
      bottomNavigationBar: Material(
        elevation: 50,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(containerRadius),
          topLeft: Radius.circular(containerRadius),
        ),
        child: Container(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 15),
          decoration: const BoxDecoration(
            color: AppColors.white,
          ),
          child: Wrap(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: Column(
                      children: [
                        Container(
                          height: 3.5.hsbt0,
                          decoration: BoxDecoration(
                            color: AppColors.grey,
                            borderRadius: BorderRadius.circular(radius),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                flex: 1,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    // ref
                                    //     .watch(proDetailsChangeNotifierProvider
                                    //         .notifier)
                                    //     .reduceQuantity();
                                  },
                                  icon: Icon(
                                    Iconsax.minus,
                                    size: 15.msbt0,
                                    color: AppColors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  widget.product.selectedQuantity.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.primarySwatch[700]!),
                                  strutStyle: const StrutStyle(
                                    height: 1,
                                    forceStrutHeight: true,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    // ref
                                    //     .watch(proDetailsChangeNotifierProvider
                                    //         .notifier)
                                    //     .addQuantity(context: context);
                                  },
                                  icon: Icon(
                                    Iconsax.add,
                                    size: 15.msbt0,
                                    color: AppColors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Text(
                                (widget.product.specialPrice != null)
                                    ? formatPrices(
                                        number: widget.product.specialPrice! *
                                            widget.product.selectedQuantity,
                                      )
                                    : (widget.product.price != null &&
                                            widget.product.price!.isNotEmpty)
                                        ? formatPrices(
                                            number: double.parse(
                                                    widget.product.price!) *
                                                widget.product.selectedQuantity)
                                        : '--',
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        color: AppColors.grey,
                                        decoration: TextDecoration.lineThrough),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Text(
                                (widget.product.specialPrice != null)
                                    ? formatPrices(
                                        number: widget.product.specialPrice! *
                                            widget.product.selectedQuantity,
                                      )
                                    : (widget.product.price != null &&
                                            widget.product.price!.isNotEmpty)
                                        ? formatPrices(
                                            number: double.parse(
                                                    widget.product.price!) *
                                                widget.product.selectedQuantity)
                                        : '--',
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        color: AppColors.secondarySwatch[500]),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 8,
                    child: SizedBox(
                      height: 6.hsbt0,
                      child: AddToCartButton(
                        product: widget.product,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
