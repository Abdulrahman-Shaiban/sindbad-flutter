import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sindebad/core/styles/size_utils.dart';
import 'package:sindebad/features/home/views/search_view.dart';
import 'package:sindebad/features/home/views/widgets/service_card.dart';
import 'package:sindebad/features/supplier/views/suppliers_view.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/utils/squircle.helper.dart';
import '../../cart/views/widgets/cart_icon_widget.dart';
import '../../categories/logic/categories_view_controller.dart';
import '../../categories/views/categories_view.dart';
import '../../merchant/logic/offers_slider_widget_controller.dart';
import '../../merchant/views/widgets/offers_slider_widget.dart';
import '../../products/views/widgets/products_horizontal_list_view.dart';
import '../../shippment/views/free_shipping_view.dart';
import '../../shippment/views/payment_methods_view.dart';
import '../../shippment/views/retrieval_view.dart';
import '../../supplier/logic/suppliers_view_controller.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomeView> {
  @override
  void initState() {
    WidgetsBinding.instance.endOfFrame.then(
      (_) async {
        SuppliersViewController(ref: ref).fetchSuppliers();
        CategoriesViewController(ref: ref).fetchCategories();
        OffersSliderWidgetController(ref: ref).fetchOffers();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backgroundColor,
      body: RefreshIndicator(
        onRefresh: () async {
          SuppliersViewController(ref: ref).fetchSuppliers();
          CategoriesViewController(ref: ref).fetchCategories();
        },
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: <Widget>[
            SliverAppBar(
              pinned: false,
              snap: false,
              floating: false,
              expandedHeight: 38.hsbt0,
              leadingWidth: 40.msbt0,
              title: Text(AppLocalizations.of(context)!.appName,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.white)),
              actions: [
                // const NotificationsIconWidget(),
                const CartIconWidget(),
                SizedBox(
                  width: 3.wsbt0,
                )
              ],
              leading: Center(
                child: GestureDetector(
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/icons/svg/Menu.svg',
                    ),
                  ),
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ),
              flexibleSpace: const FlexibleSpaceBar(
                titlePadding: EdgeInsets.zero,
                background: TopClipperWidget(),
                stretchModes: [StretchMode.blurBackground],
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                  start: 4.wsbt0,
                ),
                child: SizedBox(
                  height: 20.5.hsbt0,
                  child: const CategoriesView(),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 4.wsbt0),
                child: SizedBox(
                  height: 12.hsbt0,
                  child: const SuppliersView(),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                    start: 4.wsbt0, end: 1.wsbt0, top: 4.wsbt0),
                child: SizedBox(
                  height: 95,
                  child: Row(
                    children: [
                      ServiceCard(
                        icon: 'charg',
                        name: 'شحن مجاني',
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const FreeShippingView(),
                          ));
                        },
                      ),
                      ServiceCard(
                        icon: 'charg',
                        name: 'طرق الدفع',
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const PaymentMethodsView(),
                          ));
                        },
                      ),
                      ServiceCard(
                        icon: 're',
                        name: 'امكانية الاسترداد',
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const RetrievalView(),
                          ));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    EdgeInsetsDirectional.only(start: 4.wsbt0, top: 5.wsbt0),
                child: SizedBox(
                  height: 230,
                  child: ProductsHorizontalListView(),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                    start: 4.wsbt0, top: 5.wsbt0, bottom: 5.wsbt0),
                child: SizedBox(
                  height: 230,
                  child: ProductsHorizontalListView(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopClipperWidget extends StatelessWidget {
  const TopClipperWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.primarySwatch[300],
        ),
        const QuarterCircle(),
        Positioned(
          top: SizeUtils.appBarAndStatusBarHeight,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            width: SizeUtils.screenWidth,
            height: 33.hsbt0,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SearchView(),
                    ));
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    height: 43,
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: squircle(radius: 0.01),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/svg/Search.svg',
                          color: AppColors.white,
                        ),
                        const SizedBox(width: 15),
                        Text(
                          'ابحث في المتجر',
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontSize: 14,
                                    color: AppColors.white,
                                  ),
                          strutStyle: const StrutStyle(
                            height: 1,
                            forceStrutHeight: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                const Expanded(
                  flex: 17,
                  child: Stack(
                    children: [OffersSliderWidget()],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class QuarterCircle extends StatelessWidget {
  final Color color;

  const QuarterCircle({
    super.key,
    this.color = AppColors.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(
      child: ClipRect(
        child: CustomPaint(
          painter: QuarterCirclePainter(),
        ),
      ),
    );
  }
}

class QuarterCirclePainter extends CustomPainter {
  const QuarterCirclePainter();

  final Color fillColor = AppColors.primaryColor;
  final double littleGap = 5;

  @override
  void paint(Canvas canvas, Size size) {
    final double curveHeight = 37.hsbt0;
    final double curveWidth = 100.wsbt0;

    final paint = Paint()
      // parametrize
      ..color = fillColor
      ..style = PaintingStyle.fill;

    final path = Path()
      // parametrize
      ..lineTo(curveWidth + 5, 0)
      //main right curve:
      ..cubicTo(
        curveWidth,
        15.hsbt0,
        curveWidth - 33.wsbt0,
        curveHeight - 1.hsbt0,
        curveWidth - 100.wsbt0,
        curveHeight,
      )
      ..lineTo(0, curveHeight)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
