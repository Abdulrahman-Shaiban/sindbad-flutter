import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sindebad/core/styles/size_utils.dart';

import '../../../core/styles/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../cart/views/widgets/cart_icon_widget.dart';


class RetrievalView extends ConsumerStatefulWidget {
  const RetrievalView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<RetrievalView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.retrieval,
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
                'assets/icons/svg/re.svg',
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'يمكنك استرداد قيمة مشترياتك خلال 14 يوم من اعادته لنا',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              '1-  في حال لم تكن مشترياتك مطابقة للصور و الوصف للقطع التي طلبت من موقعنا يمكنك استرداد كل ما دفعت خلال 14 يوما من تاريخ استرداد سندباد للمشتريات المعنية',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade600,
              ),
            ),
          ),
          const SizedBox(height: 18,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              '2-  في حال طابقة الصور المشتريات التي استلمتوها فاننا نعتذر عن ارجاعها بعد استلامها من قبلكم',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade600,
              ),
            ),
          ),
        ],
      )
    );
  }
}
