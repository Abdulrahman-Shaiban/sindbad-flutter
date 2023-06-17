import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sindebad/core/styles/size_utils.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/utils/squircle.helper.dart';

class ContactUsView extends ConsumerStatefulWidget {
  const ContactUsView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<ContactUsView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.contactUs,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  decoration: ShapeDecoration(
                    shape: squircle(radius: 0.015),
                    shadows: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 10,
                        offset: const Offset(0.0, 4.0),
                      ),
                    ],
                    gradient: const LinearGradient(
                      colors: [Color(0xFF60FC7C), Color(0xFF4AB161)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'تواصل معنا',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 18,
                              color: AppColors.white,
                              fontWeight: FontWeight.w700,
                            ),
                        strutStyle: const StrutStyle(
                          height: 2,
                          forceStrutHeight: true,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.white,
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/svg/whatsapp.svg',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
              child: Container(
                width: double.infinity,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: squircle(radius: 0.015),
                  shadows: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0.0, 4.0),
                    ),
                  ],
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'عنواننا:',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 18,
                              color: AppColors.primaryColor,
                            ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        '...........................................',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 16,
                              color: Colors.grey.shade500,
                            ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        'ارقام التواصل:',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 18,
                              color: AppColors.primaryColor,
                            ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        '777777777',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 16,
                              color: Colors.grey.shade500,
                            ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 20.msbt0,
                  width: 20.msbt0,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: InkWell(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(50),
                    ),
                    onTap: () {},
                    child: Icon(
                      Iconsax.heart,
                      color: AppColors.white,
                      size: 12.msbt0,
                    ),
                  ),
                ),
                Container(
                  height: 20.msbt0,
                  width: 20.msbt0,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: InkWell(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(50),
                    ),
                    onTap: () {},
                    child: Icon(
                      Iconsax.heart,
                      color: AppColors.white,
                      size: 12.msbt0,
                    ),
                  ),
                ),
                Container(
                  height: 20.msbt0,
                  width: 20.msbt0,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: InkWell(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(50),
                    ),
                    onTap: () {},
                    child: Icon(
                      Iconsax.heart,
                      color: AppColors.white,
                      size: 12.msbt0,
                    ),
                  ),
                ),
                Container(
                  height: 20.msbt0,
                  width: 20.msbt0,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: InkWell(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(50),
                    ),
                    onTap: () {},
                    child: Icon(
                      Iconsax.heart,
                      color: AppColors.white,
                      size: 12.msbt0,
                    ),
                  ),
                ),
                Container(
                  height: 20.msbt0,
                  width: 20.msbt0,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: InkWell(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(50),
                    ),
                    onTap: () {},
                    child: Icon(
                      Iconsax.heart,
                      color: AppColors.white,
                      size: 12.msbt0,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
