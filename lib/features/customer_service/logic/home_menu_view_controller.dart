import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../core/utils/constants/app_localizations.dart';
import '../../../core/utils/initializer.dart';
import '../../../core/utils/showing_warnings.dart';


String enableNotificationPermissionToCompleteProcess = locator<
    Locale>() ==
    AppConstLocalizations.arabic
    ? "يجب ان توافق على صلاحية التنبيهات لتصلك الاشعارات عن طلباتك"
    : "You must enable the notification permission to receive notifications about your orders";


final homeMenuIndexProvider = StateProvider<int>(
  (ref) => 0,
);


class HomeMenuViewController {
  late WidgetRef ref;

  HomeMenuViewController({required this.ref});

  askForNotificationPermission({required BuildContext context}) async {
    if (!await Permission.notification.status.isGranted) {
      var status = await Permission.notification.request();
      if (status.isPermanentlyDenied) {
        showFlutterToast(
          message: enableNotificationPermissionToCompleteProcess,
        );
        Future.delayed(const Duration(seconds: 5), () {});
        await openAppSettings();
      }
    }
  }
}
