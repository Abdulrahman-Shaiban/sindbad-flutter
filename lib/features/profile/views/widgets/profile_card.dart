import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/styles/app_colors.dart';

class ProfileCard extends ConsumerWidget {
  ProfileCard(
      {Key? key, required this.name, required this.icon, this.onPressed})
      : super(key: key);

  final String name;
  final String icon;
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onPressed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/svg/$icon.svg',
              color: AppColors.primaryColor,
              height: 35,
              width: 35,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              name,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.lightBlack, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
