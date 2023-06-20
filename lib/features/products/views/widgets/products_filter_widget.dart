import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sindebad/core/styles/app_colors.dart';
import 'package:sindebad/core/styles/size_utils.dart';

import '../../../../core/utils/constants/constants.dart';
import '../../../../core/utils/squircle.helper.dart';

class ProductsFilterWidget extends ConsumerStatefulWidget {
  const ProductsFilterWidget({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _ProductsViewState();
}

class _ProductsViewState extends ConsumerState<ProductsFilterWidget> {
  @override
  void initState() {
    WidgetsBinding.instance.endOfFrame.then(
      (_) async {
        // ref.read(productsViewController).fetchProducts();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(
        start: 10,
      ),
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
            ),
            builder: (context) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'السعر',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 20,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: TextField(
                            cursorRadius: const Radius.circular(10.0),
                            cursorWidth: 2.0,
                            keyboardType: TextInputType.number,
                            cursorColor: AppColors.black,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(height: 1.0, fontSize: 18),
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              hintText: 'من',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      height: 1.0,
                                      color: Colors.grey.shade400,
                                      fontSize: 18),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 22,
                          color: Colors.grey.shade500,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        SizedBox(
                          width: 100,
                          child: TextField(
                            cursorRadius: const Radius.circular(10.0),
                            cursorWidth: 2.0,
                            keyboardType: TextInputType.number,
                            cursorColor: AppColors.black,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(height: 1.0, fontSize: 18),
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              hintText: 'الى',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      height: 1.0,
                                      color: Colors.grey.shade400,
                                      fontSize: 18),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
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
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'القسم',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
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
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
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
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'القسم',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
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
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
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
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'القسم',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
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
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
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
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 35,
                            width: 80,
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    AppColors.primaryColor),
                                overlayColor: MaterialStateProperty.all(
                                  AppColors.primaryColor.withGreen(30),
                                ),
                              ),
                              child: Text(
                                'تأكيد',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                strutStyle: const StrutStyle(
                                  height: 1,
                                  forceStrutHeight: true,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          SizedBox(
                            height: 35,
                            width: 80,
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(
                                  Colors.redAccent,
                                ),
                              ),
                              child: Text(
                                'الغاء',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontSize: 16,
                                        color: Colors.grey.shade600,
                                        fontWeight: FontWeight.w500),
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
                  ],
                ),
              );
            },
          );
        },
        child: Container(
          height: 23.msbt0,
          width: 22.msbt0,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Icon(
            Iconsax.filter,
            size: 13.msbt0,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
