import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/utils/squircle.helper.dart';
import '../../address/views/address_view.dart';
import 'order_statues_view.dart';

final paymentProvider = StateProvider<int>(
  (ref) => 0,
);

class CheckOutView extends ConsumerStatefulWidget {
  const CheckOutView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _ProductsViewState();
}

class _ProductsViewState extends ConsumerState<CheckOutView> {
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
          'ملخص الطلب',
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'تحديد العنوان',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 17,
                        color: Colors.grey[700],
                      ),
                  strutStyle: const StrutStyle(
                    height: 1,
                    forceStrutHeight: true,
                  ),
                ),
                SizedBox(
                  height: 27,
                  width: 85,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.displaySmall,
                      backgroundColor: Colors.grey[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      side: BorderSide.none,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddressView()),
                      );
                    },
                    child: Center(
                      child: Text(
                        'اضافة عنوان',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 13,
                              color: Colors.grey[600],
                            ),
                        strutStyle: const StrutStyle(
                          height: 1,
                          forceStrutHeight: true,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Container(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
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
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'الاجمالي',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                      strutStyle: const StrutStyle(
                        height: 1,
                        forceStrutHeight: true,
                      ),
                    ),
                    Text(
                      '30,500 \$',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 17,
                            color: Colors.grey[600],
                          ),
                      strutStyle: const StrutStyle(
                        height: 1,
                        forceStrutHeight: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'سعر الشحن',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                      strutStyle: const StrutStyle(
                        height: 1,
                        forceStrutHeight: true,
                      ),
                    ),
                    Text(
                      '200 \$',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 17,
                            color: Colors.grey[600],
                          ),
                      strutStyle: const StrutStyle(
                        height: 1,
                        forceStrutHeight: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'الخصم',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                      strutStyle: const StrutStyle(
                        height: 1,
                        forceStrutHeight: true,
                      ),
                    ),
                    Text(
                      '0 \$',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 17,
                            color: Colors.grey[600],
                          ),
                      strutStyle: const StrutStyle(
                        height: 1,
                        forceStrutHeight: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: ShapeDecoration(
                    color: const Color(0XFFFBFCF5),
                    shape: squircle(radius: 0.1),
                    shadows: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0.0, 4.0),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'الاجمالي الكلي',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontSize: 16,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                        strutStyle: const StrutStyle(
                          height: 1,
                          forceStrutHeight: true,
                        ),
                      ),
                      Text(
                        '30,700 \$',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontSize: 17,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                        strutStyle: const StrutStyle(
                          height: 1,
                          forceStrutHeight: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Container(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'طريقة الدفع',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 18,
                        color: Colors.grey[600],
                      ),
                  strutStyle: const StrutStyle(
                    height: 1,
                    forceStrutHeight: true,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 9,
                      child: RadioListTile<int>(
                        groupValue: ref.watch(paymentProvider),
                        value: 0,
                        contentPadding: EdgeInsets.zero,
                        visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity,
                        ),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        fillColor: MaterialStatePropertyAll(
                            ref.watch(paymentProvider) == 0
                                ? AppColors.primaryColor
                                : AppColors.grey),
                        onChanged: (value) {
                          ref.read(paymentProvider.notifier).state = value ?? 0;
                        },
                        title: Text(
                          'تحويل بنكي',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: ref.watch(paymentProvider) == 0
                                      ? AppColors.primaryColor
                                      : AppColors.grey),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SvgPicture.asset(
                        'assets/icons/svg/bank.svg',
                        color: AppColors.primaryColor,
                        height: 25,
                        width: 25,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                      flex: 9,
                      child: RadioListTile<int>(
                        groupValue: ref.watch(paymentProvider),
                        value: 1,
                        contentPadding: EdgeInsets.zero,
                        visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity,
                        ),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        fillColor: MaterialStatePropertyAll(
                            ref.watch(paymentProvider) == 1
                                ? AppColors.primaryColor
                                : AppColors.grey),
                        onChanged: (value) {
                          ref.read(paymentProvider.notifier).state = value ?? 1;
                        },
                        title: Text(
                          'بطاقة مدى البنكية',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: ref.watch(paymentProvider) == 1
                                      ? AppColors.primaryColor
                                      : AppColors.grey),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SvgPicture.asset(
                        'assets/icons/svg/mada.svg',
                        height: 25,
                        width: 25,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                      flex: 9,
                      child: RadioListTile<int>(
                        groupValue: ref.watch(paymentProvider),
                        value: 2,
                        contentPadding: EdgeInsets.zero,
                        visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity,
                        ),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        fillColor: MaterialStatePropertyAll(
                            ref.watch(paymentProvider) == 2
                                ? AppColors.primaryColor
                                : AppColors.grey),
                        onChanged: (value) {
                          ref.read(paymentProvider.notifier).state = value ?? 2;
                        },
                        title: Text(
                          'فيزا كارد',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: ref.watch(paymentProvider) == 2
                                      ? AppColors.primaryColor
                                      : AppColors.grey),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SvgPicture.asset(
                        'assets/icons/svg/visa 2.svg',
                        height: 25,
                        width: 25,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                      flex: 9,
                      child: RadioListTile<int>(
                        groupValue: ref.watch(paymentProvider),
                        value: 3,
                        contentPadding: EdgeInsets.zero,
                        visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity,
                        ),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        fillColor: MaterialStatePropertyAll(
                            ref.watch(paymentProvider) == 3
                                ? AppColors.primaryColor
                                : AppColors.grey),
                        onChanged: (value) {
                          ref.read(paymentProvider.notifier).state = value ?? 3;
                        },
                        title: Text(
                          'ماستر كارد',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: ref.watch(paymentProvider) == 3
                                      ? AppColors.primaryColor
                                      : AppColors.grey),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SvgPicture.asset(
                        'assets/icons/svg/preview.svg',
                        height: 25,
                        width: 25,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                textStyle: Theme.of(context).textTheme.displaySmall,
                backgroundColor: const Color(0XFF55BE55),
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
              child: Center(
                child: Text(
                  'الدفع الان',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                  strutStyle: const StrutStyle(
                    height: 1,
                    forceStrutHeight: true,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
