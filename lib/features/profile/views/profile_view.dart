import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sindebad/features/profile/views/widgets/profile_card.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/size_utils.dart';
import '../../merchant/views/merchant_products_view.dart';
import '../logic/profile_view_controller.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          const Expanded(
            flex: 7,
            child: TopClipperWidget(),
          ),
          Expanded(
            flex: 17,
            child: GridView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.07.msbt0,
              ),
              children: [
                ProfileCard(
                  icon: 'Icon metro-location',
                  name: AppLocalizations.of(context)!.address,
                ),
                ProfileCard(
                  icon: 'orders 2',
                  name: AppLocalizations.of(context)!.oldOrders,
                ),
                ProfileCard(
                  icon: 'Light-Heart',
                  name: AppLocalizations.of(context)!.favorites,
                ),
                ProfileCard(
                  icon: 'noun_Policy_3324548',
                  name: AppLocalizations.of(context)!.privacyPolicy,
                ),
                ProfileCard(
                  icon: 'customer-service',
                  name: AppLocalizations.of(context)!.customersService,
                ),
                ProfileCard(
                  icon: 'invite',
                  name: AppLocalizations.of(context)!.inviteFriend,
                ),
                ProfileCard(
                  icon: 'rate',
                  name: AppLocalizations.of(context)!.contactUs,
                ),
                ProfileCard(
                  icon: 'exite',
                  name: AppLocalizations.of(context)!.signOut,
                ),
              ],
            ),
          ),
        ],
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
          top: SizeUtils.statusBarHeight,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            width: SizeUtils.screenWidth,
            height: 23.hsbt0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 13,
                  child: Text(
                    "${AppLocalizations.of(context)!.hello}  أحمد",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
                Expanded(
                  flex: 22,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Text(
                          'ahmed@gmail.com',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Text(
                          '777777777',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 2,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  textStyle:
                                      Theme.of(context).textTheme.displaySmall,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  side: const BorderSide(
                                      width: 1.0, color: AppColors.white),
                                ),
                                onPressed: () {
                                  navigateToEditProfileView(context: context);
                                },
                                child: Center(
                                  child: Text(
                                    AppLocalizations.of(context)!.editProfile,
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
                                ),
                              ),
                            ),
                            const Spacer(
                              flex: 2,
                            ),
                            Expanded(
                              flex: 3,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyMedium,
                                  backgroundColor:
                                      AppColors.secondarySwatch[500],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  side: const BorderSide(
                                      width: 1.0, color: AppColors.white),
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const MerchantProductsView()));
                                },
                                child: Center(
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .merchantAccount,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          fontSize: 14,
                                          color: AppColors.white,
                                        ),
                                    strutStyle: const StrutStyle(
                                      height: 1,
                                      forceStrutHeight: true,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
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
    final double curveHeight = 26.6.hsbt0;
    final double curveWidth = 96.wsbt0;

    final paint = Paint()
      // parametrize
      ..color = fillColor
      ..style = PaintingStyle.fill;

    final path = Path()
      // parametrize
      ..lineTo(curveWidth, 0)
      //main right curve:
      ..cubicTo(
        curveWidth + 1.wsbt0,
        0,
        curveWidth - 30.wsbt0,
        curveHeight - 5.hsbt0,
        curveWidth - 86.wsbt0,
        curveHeight - 0.6.hsbt0,
      )
      ..lineTo(0, curveHeight)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
