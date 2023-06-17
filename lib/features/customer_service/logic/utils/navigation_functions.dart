import 'package:flutter/material.dart';

import '../../../../core/routes/app_routes.dart';

navigateToProfileViewFunction({required BuildContext context}) {
  Navigator.pushNamed(
    context,
    AppRoutes.profileView,
  );
}

