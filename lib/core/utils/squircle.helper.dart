import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SmoothRectangleBorder squircle({
  double radius = 0.02,
  double cornerSmoothing = 1,
  BorderSide? border,
}) {
  return SmoothRectangleBorder(
    side: border ?? BorderSide.none,
    borderRadius: SmoothBorderRadius(
      cornerRadius: radius.sh,
      cornerSmoothing: cornerSmoothing,
    ),
  );
}

SmoothRectangleBorder squircleBottomSide(
    {double radius = 0.02, double cornerSmoothing = 1}) {
  return SmoothRectangleBorder(
    borderRadius: SmoothBorderRadius.only(
      bottomLeft: SmoothRadius(
        cornerRadius: radius.sh,
        cornerSmoothing: cornerSmoothing,
      ),
      bottomRight: SmoothRadius(
        cornerRadius: radius.sh,
        cornerSmoothing: cornerSmoothing,
      ),
    ),
  );
}

SmoothRectangleBorder squircleLeftSide({
  double radius = 0.02,
  double cornerSmoothing = 1,
}) {
  return SmoothRectangleBorder(
    borderRadius: SmoothBorderRadius.only(
      bottomLeft: SmoothRadius(
        cornerRadius: radius.sh,
        cornerSmoothing: cornerSmoothing,
      ),
      topLeft: SmoothRadius(
        cornerRadius: radius.sh,
        cornerSmoothing: cornerSmoothing,
      ),
    ),
  );
}
