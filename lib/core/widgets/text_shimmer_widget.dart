import 'package:flutter/material.dart';
import 'package:sindebad/core/styles/size_utils.dart';

import '../styles/app_colors.dart';
import '../utils/constants/constants.dart' as constants;

class TextShimmerWidget extends StatelessWidget {
  const TextShimmerWidget({
    Key? key,
    this.height,
    this.width,
    this.margin,
    this.color,
    this.radius,
  }) : super(key: key);

  final double? height;
  final double? width;
  final EdgeInsets? margin;
  final Color? color;
  final BorderRadius? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 10.msbt0,
      width: width ?? double.infinity,
      margin: margin ?? EdgeInsets.only(left: 30.wsbt0),
      decoration: BoxDecoration(
        color: color ?? AppColors.grey,
        borderRadius: radius ?? BorderRadius.circular(constants.radius),
      ),
    );
  }
}
