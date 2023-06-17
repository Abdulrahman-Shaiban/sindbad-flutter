import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sindebad/core/styles/app_colors.dart';
import 'package:sindebad/core/styles/size_utils.dart';

import '../../favorites/views/favorites_view.dart';
import '../../order/views/orders_view.dart';
import '../../profile/views/profile_view.dart';
import '../logic/home_menu_view_controller.dart';
import 'home_view.dart';

class HomeMenuView extends ConsumerStatefulWidget {
  const HomeMenuView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _HomeMenuViewState();
}

class _HomeMenuViewState extends ConsumerState<HomeMenuView> {
  @override
  void initState() {
    WidgetsBinding.instance.endOfFrame.then(
      (_) async {},
    );
    super.initState();
  }

  List<Widget> pages = [
    const HomeView(),
    const OrdersView(),
    const FavoritesView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: Container(
        width: MediaQuery.of(context).size.width / 1.4,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 23.hsbt0,
              width: double.infinity,
              alignment: Alignment.bottomRight,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFF4D93C8), Color(0xDD274A64)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'أهلاً احمد',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 22, left: 12, right: 12),
                    child: Text(
                      'ahmed@gmail.com',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 12,
                            color: Colors.grey.shade50,
                            fontWeight: FontWeight.w300,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding:
                  EdgeInsetsDirectional.only(bottom: 3.hsbt0, start: 2.hsbt0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/svg/Pin.svg',
                    height: 26,
                    color: Colors.grey.shade700,
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  Text(
                    'العناوين',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 20,
                          color: Colors.grey.shade700,
                        ),
                    strutStyle: const StrutStyle(
                      height: 2,
                      forceStrutHeight: true,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsetsDirectional.only(bottom: 3.hsbt0, start: 2.hsbt0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/svg/orders 2.svg',
                    height: 26,
                    color: Colors.grey.shade700,
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  Text(
                    'طلباتي السابقة',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 20,
                          color: Colors.grey.shade700,
                        ),
                    strutStyle: const StrutStyle(
                      height: 2,
                      forceStrutHeight: true,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsetsDirectional.only(bottom: 3.hsbt0, start: 2.hsbt0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/svg/customer-service.svg',
                    height: 26,
                    color: Colors.grey.shade700,
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  Text(
                    'خدمة العملاء',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 20,
                          color: Colors.grey.shade700,
                        ),
                    strutStyle: const StrutStyle(
                      height: 2,
                      forceStrutHeight: true,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsetsDirectional.only(bottom: 3.hsbt0, start: 2.hsbt0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/svg/invite.svg',
                    height: 26,
                    color: Colors.grey.shade700,
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  Text(
                    'دعوة صديق',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 20,
                          color: Colors.grey.shade700,
                        ),
                    strutStyle: const StrutStyle(
                      height: 2,
                      forceStrutHeight: true,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsetsDirectional.only(bottom: 3.hsbt0, start: 2.hsbt0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/svg/rate.svg',
                    height: 26,
                    color: Colors.grey.shade700,
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  Text(
                    'تقييم التطبيق',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 20,
                          color: Colors.grey.shade700,
                        ),
                    strutStyle: const StrutStyle(
                      height: 2,
                      forceStrutHeight: true,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsetsDirectional.only(bottom: 3.hsbt0, start: 2.hsbt0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/svg/exite.svg',
                    height: 26,
                    color: Colors.grey.shade700,
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  Text(
                    'خروج',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 20,
                          color: Colors.grey.shade700,
                        ),
                    strutStyle: const StrutStyle(
                      height: 2,
                      forceStrutHeight: true,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: pages.elementAt(ref.watch(homeMenuIndexProvider)),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        type: BottomNavigationBarType.fixed,
        currentIndex: ref.watch(homeMenuIndexProvider),
        onTap: (index) {
          ref.read(homeMenuIndexProvider.notifier).state = index;
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Iconsax.home_hashtag),
            label: AppLocalizations.of(context)!.home,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/svg/orders 2.svg',
              color: AppColors.grey,
              height: 25,
              width: 25,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/svg/orders 2.svg',
              color: AppColors.primaryColor,
              height: 25,
              width: 25,
            ),
            label: AppLocalizations.of(context)!.orders,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Iconsax.heart),
            label: AppLocalizations.of(context)!.favorites,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Iconsax.user),
            label: AppLocalizations.of(context)!.profile,
          ),
        ],
      ),
    );
  }
}
