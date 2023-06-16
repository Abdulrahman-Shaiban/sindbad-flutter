import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../../core/utils/constants/app_assets.dart';
import '../../../../core/utils/constants/constants.dart';
import '../../../../core/utils/squircle.helper.dart';
import '../../data/models/supplier.dart';
import '../../logic/suppliers_view_controller.dart';

class SuppliersListView extends ConsumerStatefulWidget {
  const SuppliersListView({
    Key? key,
    required this.suppliers,
  }) : super(key: key);

  final List<Supplier> suppliers;

  @override
  ConsumerState createState() => _SuppliersListViewState();
}

class _SuppliersListViewState extends ConsumerState<SuppliersListView> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return widget.suppliers.isEmpty
        ? Center(
            child: Text(
              AppLocalizations.of(context)!.emptyDataMessage(
                AppLocalizations.of(context)!.suppliers,
              ),
            ),
          )
        : ListView.builder(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            scrollDirection: Axis.horizontal,
            itemCount: widget.suppliers.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  navigateToSupplierProductsView(
                      context: context, supplier: widget.suppliers[index]);
                },
                child: Container(
                  width: 270,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin: const EdgeInsets.only(top: 7, bottom: 7, left: 7),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 45,
                              width: 45,
                              child: CachedNetworkImage(
                                imageUrl:
                                    widget.suppliers[index].imageName != null
                                        ? imagesBaseUrl +
                                            widget.suppliers[index].imageName!
                                        : '',
                                placeholder: (context, _) =>
                                    Image.asset(AppAssets.noImage),
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(200),
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          blurRadius: 10,
                                          spreadRadius: 0,
                                          offset: const Offset(0, 1)),
                                    ],
                                  ),
                                ),
                                errorWidget: (context, url, error) => Container(
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(AppAssets.noImage),
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(200),
                                    ),
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4, vertical: 10),
                                    alignment: Alignment.bottomCenter,
                                    decoration: BoxDecoration(
                                      color:
                                          AppColors.lightBlack.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(200),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              widget.suppliers[index].name!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 15,
                                    color: AppColors.primaryColor,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 23,
                        width: 63,
                        padding: const EdgeInsets.only(right: 7),
                        margin: const EdgeInsets.only(top: 40),
                        decoration: ShapeDecoration(
                          color: AppColors.primaryColor,
                          shape: squircle(radius: 0.014),
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
                            Text(
                              'المزيد',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 12,
                                    color: AppColors.white,
                                  ),
                              strutStyle: const StrutStyle(
                                height: 1,
                                forceStrutHeight: true,
                              ),
                            ),
                            const SizedBox(width: 7),
                            Container(
                              height: 17,
                              width: 17,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: squircle(radius: 0.01),
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
                                color: AppColors.primaryColor,
                                size: 10,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
  }
}
