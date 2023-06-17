import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sindebad/core/styles/size_utils.dart';
import 'package:sindebad/features/home/views/widgets/service_card.dart';
import 'package:sindebad/features/supplier/views/suppliers_view.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/utils/constants/app_assets.dart';
import '../../../core/utils/constants/constants.dart';
import '../../../core/utils/squircle.helper.dart';
import '../../cart/views/widgets/cart_icon_widget.dart';
import '../../categories/logic/categories_view_controller.dart';
import '../../categories/views/categories_view.dart';
import '../../merchant/logic/offers_slider_widget_controller.dart';
import '../../merchant/views/widgets/offers_slider_widget.dart';
import '../../products/views/widgets/products_horizontal_list_view.dart';
import '../../supplier/logic/suppliers_view_controller.dart';

class AboutUsView extends ConsumerStatefulWidget {
  const AboutUsView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<AboutUsView> {
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.aboutUs,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          child: Container(
            width: double.infinity,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: squircle(radius: 0.015),
              shadows: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.15),
                  blurRadius: 10,
                  offset: const Offset(0.0, 4.0),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Text(
                  'شركة لبيع واستيراد المعدات الثقيلة .............................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(
                    fontSize: 16,
                    color: Colors.grey.shade600,
                  ),
                  strutStyle: const StrutStyle(
                    height: 1.3,
                    forceStrutHeight: true,
                  ),
                ),
            ),
            ),
        ),
      ),
    );
  }
}
