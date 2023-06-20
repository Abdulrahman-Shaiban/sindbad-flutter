import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sindebad/core/styles/size_utils.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/utils/squircle.helper.dart';
import '../../cart/views/widgets/cart_icon_widget.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appName,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.white)),
        actions: [
          // const NotificationsIconWidget(),
          const CartIconWidget(),
          SizedBox(
            width: 3.wsbt0,
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: squircle(radius: 0.015),
                shadows: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0.0, 4.0),
                  ),
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 9.2),
                      child: SvgPicture.asset('assets/icons/svg/Search.svg',
                          height: 25),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      width: 1,
                      height: 28,
                      color: Colors.grey.shade500,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: TextField(
                        cursorRadius: const Radius.circular(10.0),
                        cursorWidth: 2.0,
                        keyboardType: TextInputType.text,
                        cursorColor: AppColors.black,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(height: 1.0, fontSize: 18),
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintText: 'مولدات',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    height: 1.0,
                                    color: Colors.grey.shade400,
                                    fontSize: 18),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.zero),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: squircle(radius: 0.015),
                shadows: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0.0, 4.0),
                  ),
                ],
              ),
              child: ExpansionTile(
                trailing: RotationTransition(
                  turns: const AlwaysStoppedAnimation(270 / 360),
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.grey.shade500,
                  ),
                ),
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'القسم',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 16,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w500),
                      strutStyle: const StrutStyle(
                        height: 1,
                        forceStrutHeight: true,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      width: 1,
                      height: 28,
                      color: Colors.grey.shade500,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      'الكل',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 16,
                          color: Colors.grey.shade400,
                          fontWeight: FontWeight.w400),
                      strutStyle: const StrutStyle(
                        height: 1,
                        forceStrutHeight: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: squircle(radius: 0.015),
                shadows: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0.0, 4.0),
                  ),
                ],
              ),
              child: ExpansionTile(
                trailing: RotationTransition(
                  turns: const AlwaysStoppedAnimation(270 / 360),
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.grey.shade500,
                  ),
                ),
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'القسم',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 16,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500),
                        strutStyle: const StrutStyle(
                          height: 1,
                          forceStrutHeight: true,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                        width: 1,
                        height: 28,
                        color: Colors.grey.shade500,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        'الكل',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 16,
                            color: Colors.grey.shade400,
                            fontWeight: FontWeight.w400),
                        strutStyle: const StrutStyle(
                          height: 1,
                          forceStrutHeight: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: squircle(radius: 0.015),
                shadows: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0.0, 4.0),
                  ),
                ],
              ),
              child: ExpansionTile(
                trailing: RotationTransition(
                  turns: const AlwaysStoppedAnimation(270 / 360),
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.grey.shade500,
                  ),
                ),
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'القسم',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 16,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500),
                        strutStyle: const StrutStyle(
                          height: 1,
                          forceStrutHeight: true,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                        width: 1,
                        height: 28,
                        color: Colors.grey.shade500,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        'الكل',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 16,
                            color: Colors.grey.shade400,
                            fontWeight: FontWeight.w400),
                        strutStyle: const StrutStyle(
                          height: 1,
                          forceStrutHeight: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 48,
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.primaryColor),
                ),
                child: Text(
                  'بحث',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                  strutStyle: const StrutStyle(
                    height: 1,
                    forceStrutHeight: true,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
