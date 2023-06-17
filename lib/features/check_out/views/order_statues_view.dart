import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/utils/squircle.helper.dart';

class OrderStatuesView extends ConsumerStatefulWidget {
  const OrderStatuesView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _ProductsViewState();
}

class _ProductsViewState extends ConsumerState<OrderStatuesView> {
  @override
  void initState() {
    WidgetsBinding.instance.endOfFrame.then(
      (_) async {},
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'تتبع الطلب',
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 170,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: squircle(radius: 0.0),
              shadows: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0.0, 4.0),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/svg/select - blue.svg',
                      color: AppColors.primaryColor,
                      height: 23,
                      width: 23,
                    ),
                    const SizedBox(width: 5),
                    SvgPicture.asset(
                      'assets/icons/svg/arrow (2).svg',
                      color: AppColors.primaryColor,
                      height: 13,
                      width: 13,
                    ),
                    const SizedBox(width: 5),
                    SvgPicture.asset(
                      'assets/icons/svg/select - blue.svg',
                      color: AppColors.grey,
                      height: 23,
                      width: 23,
                    ),
                    const SizedBox(width: 5),
                    SvgPicture.asset(
                      'assets/icons/svg/arrow (2).svg',
                      color: AppColors.grey,
                      height: 13,
                      width: 13,
                    ),
                    const SizedBox(width: 5),
                    SvgPicture.asset(
                      'assets/icons/svg/select - blue.svg',
                      color: AppColors.grey,
                      height: 23,
                      width: 23,
                    ),
                    const SizedBox(width: 5),
                    SvgPicture.asset(
                      'assets/icons/svg/arrow (2).svg',
                      color: AppColors.grey,
                      height: 13,
                      width: 13,
                    ),
                    const SizedBox(width: 5),
                    SvgPicture.asset(
                      'assets/icons/svg/select - blue.svg',
                      color: AppColors.grey,
                      height: 23,
                      width: 23,
                    ),
                    const SizedBox(width: 5),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        'استلام الطلب',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 11,
                              color: AppColors.primaryColor,
                            ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'تجهيز الطلب',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 11,
                              color: Colors.grey[600],
                            ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'في الطريق',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 11,
                              color: Colors.grey[600],
                            ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'تم الإستلام',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 11,
                              color: Colors.grey[600],
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            margin: const EdgeInsets.symmetric(horizontal: 40),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SvgPicture.asset(
                  'assets/icons/svg/check-circle.svg',
                  color: AppColors.primaryColor,
                  height: 70,
                  width: 70,
                ),
                const SizedBox(height: 20),
                Text(
                  'شكراً لك',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 17,
                        color: Colors.grey[600],
                      ),
                ),
                const SizedBox(height: 20),
                Text(
                  'سيتم ارسال تفاصيل الحجز للإيميل',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                textStyle: Theme.of(context).textTheme.displaySmall,
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                side: BorderSide.none,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OrderStatuesView()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/svg/orders 2.svg',
                    color: AppColors.white,
                    height: 22,
                    width: 22,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'طلباتي',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                    strutStyle: const StrutStyle(
                      height: 1,
                      forceStrutHeight: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
