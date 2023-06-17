import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/styles/app_colors.dart';

class SearchBarWidget extends ConsumerStatefulWidget {
  const SearchBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => AnimSearchBarState();
}

class AnimSearchBarState extends ConsumerState<SearchBarWidget>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorRadius: const Radius.circular(10.0),
      cursorWidth: 2.0,
      keyboardType: TextInputType.text,
      cursorColor: AppColors.black,
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(height: 1.0, fontSize: 16),
      decoration: InputDecoration(
        fillColor: Colors.white,
        hintText: 'ابحث عن قسم',
        hintStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(height: 1.0, color: Colors.grey.shade400, fontSize: 14),
        border: InputBorder.none,
        suffixIcon: IconButton(
          onPressed: () {},
          // icon: ref.watch(filterProductsStateNotifierProvider)
          //         is FilterProductsLoading
          //     ? Padding(
          //         padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
          //         child: CircularProgressIndicator(
          //           strokeWidth: 2,
          //           color: AppColors.secondarySwatch[500],
          //         ),
          //       )
          //     : Icon(
          //         Icons.search,
          //         color: AppColors.primarySwatch[800],
          //       ),
          icon: SvgPicture.asset('assets/icons/svg/Search.svg'),
        ),
      ),
    );
  }
}
