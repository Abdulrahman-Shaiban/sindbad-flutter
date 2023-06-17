import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sindebad/core/styles/size_utils.dart';

import '../../../core/styles/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../cart/views/widgets/cart_icon_widget.dart';


class FreeShippingView extends ConsumerStatefulWidget {
  const FreeShippingView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<FreeShippingView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.freeShipping,
        ),
        actions: [
          const CartIconWidget(),
          SizedBox(
            width: 3.wsbt0,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 7.hsbt0,),
          Container(
            height: 14.hsbt0,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey.shade300,
              ),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(26.0),
              child: SvgPicture.asset(
                'assets/icons/svg/charg.svg',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
            child: Text(
              'الشحن مجاني في صنعاء و الى جميع المحافظات للمولدات و منتجات الصناعات الثقيلة او اي طلب تزيد قيمته عن 200000 ريال يمني',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
              ),
            ),
          ),
        ],
      )
    );
  }
}
