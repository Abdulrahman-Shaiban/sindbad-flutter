import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sindebad/core/styles/size_utils.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../../core/utils/constants/app_assets.dart';
import '../../../../core/utils/constants/constants.dart';
import '../../../../core/utils/squircle.helper.dart';
import '../../logic/get_offers/offers_state.dart';
import '../../logic/offers_slider_widget_controller.dart';
import 'offers_loading_widget.dart';

class OffersSliderWidget extends ConsumerStatefulWidget {
  const OffersSliderWidget({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _OffersSliderWidgetState();
}

class _OffersSliderWidgetState extends ConsumerState<OffersSliderWidget> {
  @override
  Widget build(BuildContext context) {
    final OffersState state = ref.watch(offersNotifierProvider);

    return Builder(builder: (BuildContext context) {
      switch (state.runtimeType) {
        case OffersLoaded:
          final offers = (state as OffersLoaded).offers;
          return CarouselSlider.builder(
            itemCount: offers.length,
            itemBuilder: (ctx, index, realIdx) {
              return Container(
                padding: const EdgeInsets.only(right: 20),
                decoration: ShapeDecoration(
                  color: AppColors.primaryColor,
                  shape: squircle(radius: 0.013),
                  shadows: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0.0, 4.0),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            offers[index].categoryName ?? "",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 20,
                                      color: AppColors.white,
                                    ),
                            strutStyle: const StrutStyle(
                              height: 1,
                              forceStrutHeight: true,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            offers[index].details ?? "",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 13,
                                      color: AppColors.white,
                                    ),
                            strutStyle: const StrutStyle(
                              height: 1,
                              forceStrutHeight: true,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            height: 27,
                            width: 23.wsbt0,
                            padding: const EdgeInsetsDirectional.only(
                                start: 7, end: 2),
                            decoration: ShapeDecoration(
                              color: AppColors.white,
                              shape: squircle(radius: 0.0165),
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
                                  flex: 6,
                                  child: Text(
                                    AppLocalizations.of(context)!.addToCart,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          fontSize: 12,
                                          color: AppColors.black,
                                        ),
                                    strutStyle: const StrutStyle(
                                      height: 1,
                                      forceStrutHeight: true,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: ShapeDecoration(
                                      color: Colors.red[600],
                                      shape: squircle(radius: 0.012),
                                      shadows: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          blurRadius: 10,
                                          offset: const Offset(0.0, 4.0),
                                        ),
                                      ],
                                    ),
                                    child: const Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: AppColors.white,
                                      size: 10,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: CachedNetworkImage(
                        imageUrl: offers[index].images!.isNotEmpty
                            ? offers[index].images![0].imagePath ?? ''
                            : '',
                        placeholder: (context, _) =>
                            Image.asset(AppAssets.noImage),
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
                        ),
                        //TODO:edit
                        errorWidget: (context, url, error) => Container(
                          decoration: const BoxDecoration(
                            color: AppColors.primarySwatch,
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
                  ],
                ),
              );
            },
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              height: 21.hsbt0,
              viewportFraction: 0.9,
              aspectRatio: 2.55,
              initialPage: 1,
            ),
          );
        case OffersError:
          return Center(
            child: Text((state as OffersError).error),
          );
        case OffersLoading:
          return const OffersLoadingWidget();
        default:
          return const Center(
            child: SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(
                strokeWidth: 3,
              ),
            ),
          );
      }
    });
  }
}
