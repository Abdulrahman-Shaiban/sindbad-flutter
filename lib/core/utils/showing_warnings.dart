import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../core/styles/app_colors.dart';

void showFlutterToast({
  required String message,
  IconData? icon,
  Toast? toastLength,
  ToastGravity? gravity,
  Color? color,
  double? fontSize,
}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: toastLength ?? Toast.LENGTH_LONG,
    gravity: gravity ?? ToastGravity.BOTTOM,
    backgroundColor: color ?? AppColors.primarySwatch[100],
    textColor: AppColors.black,
    fontSize: fontSize ?? 13.0.sp,
  );
}