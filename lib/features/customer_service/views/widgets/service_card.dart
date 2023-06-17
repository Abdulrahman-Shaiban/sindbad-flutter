import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/squircle.helper.dart';

class ServiceCard extends ConsumerWidget {
  const ServiceCard({
    Key? key,
    required this.name,
    required this.icon,
  }) : super(key: key);

  final String name;
  final String icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.only(top: 7, bottom: 7, left: 10),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/svg/$icon.svg',
              height: 30,
              width: 30,
            ),
            const SizedBox(height: 5),
            Text(
              name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 12,
                  ),
              strutStyle: const StrutStyle(
                height: 1,
                forceStrutHeight: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
