import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/routes/app_routes.dart';

class LoginViewController {

}

navigateToSignUpView(
    {required BuildContext context,}) {
  Navigator.pushNamed(
    context,
    AppRoutes.signUpView,
  );
}
navigateToOtpVerificationView(
    {required BuildContext context,}) {
  Navigator.pushNamed(
    context,
    AppRoutes.otpView,
  );
}

