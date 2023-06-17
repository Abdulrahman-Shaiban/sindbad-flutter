import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/utils/squircle.helper.dart';

class CommonQuestionView extends ConsumerStatefulWidget {
  const CommonQuestionView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<CommonQuestionView> {
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
          AppLocalizations.of(context)!.commonQuestions,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25, right: 15, left: 15),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(bottom: 10),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: squircle(radius: 0.015),
                  shadows: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.15),
                      blurRadius: 10,
                      offset: const Offset(0.0, 4.0),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10, top: 15),
                      child: Text(
                        'كيف استطيع إضافة طلبية ؟',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 18,
                              color: AppColors.primaryColor,
                            ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 20),
                      child: Text(
                        'عن طريق التسجيل والذهاب إلى ..........................................................................................................................................................................................',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 16,
                              color: Colors.grey.shade600,
                            ),
                        strutStyle: const StrutStyle(
                          height: 1.3,
                          forceStrutHeight: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25, right: 15, left: 15),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(bottom: 10),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: squircle(radius: 0.015),
                  shadows: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.15),
                      blurRadius: 10,
                      offset: const Offset(0.0, 4.0),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10, top: 15),
                      child: Text(
                        'كيف استطيع إضافة طلبية ؟',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 18,
                              color: AppColors.primaryColor,
                            ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 20),
                      child: Text(
                        'عن طريق التسجيل والذهاب إلى ..........................................................................................................................................................................................',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 16,
                              color: Colors.grey.shade600,
                            ),
                        strutStyle: const StrutStyle(
                          height: 1.3,
                          forceStrutHeight: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25, right: 15, left: 15),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(bottom: 10),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: squircle(radius: 0.015),
                  shadows: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.15),
                      blurRadius: 10,
                      offset: const Offset(0.0, 4.0),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10, top: 15),
                      child: Text(
                        'كيف استطيع إضافة طلبية ؟',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 18,
                              color: AppColors.primaryColor,
                            ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 20),
                      child: Text(
                        'عن طريق التسجيل والذهاب إلى ..........................................................................................................................................................................................',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 16,
                              color: Colors.grey.shade600,
                            ),
                        strutStyle: const StrutStyle(
                          height: 1.3,
                          forceStrutHeight: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
