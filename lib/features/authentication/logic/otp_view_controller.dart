import 'package:flutter/material.dart';

import '../../../core/routes/app_routes.dart';

class OtpViewController {}

navigateToHomeMenuView({
  required BuildContext context,
}) {
  Navigator.pushNamed(
    context,
    AppRoutes.homeMenuView,
  );
}
