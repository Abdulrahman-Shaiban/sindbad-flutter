import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sindebad/features/home/views/home_menu_view.dart';

// import 'package:flutter_validation/flutter_validation.dart';

import 'core/routes/app_pages.dart';
import 'core/styles/app_themes.dart';
import 'core/styles/size_utils.dart';

class SindebadApp extends ConsumerStatefulWidget {
  const SindebadApp({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _SindebadAppState();
}

class _SindebadAppState extends ConsumerState<SindebadApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          locale: const Locale('ar'),
          supportedLocales: AppLocalizations.supportedLocales,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            ...AppLocalizations.localizationsDelegates,
            // AttributeLocalizations.delegate,
            // ValidationLocalizations.delegate,
          ],
          theme: AppThemes.lightTheme,
          home: Builder(builder: (BuildContext context) {
            SizeUtils.init(context);
            return const HomeMenuView();
          }),
          routes: AppPages.pages,
          // debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
