import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sindebad/core/styles/app_colors.dart';
import 'package:sindebad/core/styles/size_utils.dart';

import '../../../../core/utils/constants/constants.dart';

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
          // showModalBottomSheet(
          //   context: context,
          //   shape: const RoundedRectangleBorder(
          //     borderRadius: BorderRadius.only(
          //       topRight: Radius.circular(30),
          //       topLeft: Radius.circular(30),
          //     ),
          //   ),
          //   builder: (context) {
          //     return SingleChildScrollView(
          //       child: Container(
          //         height: 250,
          //         padding: EdgeInsets.only(
          //             bottom: MediaQuery.of(context).viewInsets.bottom),
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Text(
          //               'السعر',
          //               style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          //                   fontSize: 20,
          //                   color: AppColors.primaryColor,
          //                   fontWeight: FontWeight.w500),
          //             ),
          //             Row(
          //               children: [
          //                 TextField(
          //                   cursorRadius: const Radius.circular(10.0),
          //                   cursorWidth: 2.0,
          //                   keyboardType: TextInputType.text,
          //                   cursorColor: AppColors.black,
          //                   style: Theme.of(context)
          //                       .textTheme
          //                       .bodyMedium!
          //                       .copyWith(height: 1.0, fontSize: 16),
          //                   decoration: InputDecoration(
          //                     fillColor: Colors.white,
          //                     hintText: 'ابحث عن قسم',
          //                     hintStyle: Theme.of(context)
          //                         .textTheme
          //                         .bodyMedium!
          //                         .copyWith(
          //                             height: 1.0,
          //                             color: Colors.grey.shade400,
          //                             fontSize: 14),
          //                     border: InputBorder.none,
          //                   ),
          //                 ),
          //               ],
          //             )
          //           ],
          //         ),
          //       ),
          //     );
          //   },
          // );
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
