import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sindebad/core/styles/app_colors.dart';

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
      drawer: Drawer(child: Container()),
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
