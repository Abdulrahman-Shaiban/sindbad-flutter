import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/squircle.helper.dart';
import '../../data/models/category.dart';
import '../../logic/categories_view_controller.dart';

class CategoriesListView extends ConsumerWidget {
  const CategoriesListView({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final List<Category> categories;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return categories.isEmpty
        ? Center(
            child: Text(
              AppLocalizations.of(context)!.emptyDataMessage(
                AppLocalizations.of(context)!.categories,
              ),
            ),
          )
        : ListView.builder(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  navigateToCategoryProductsView(
                      context: context, category: categories[index]);
                },
                child: Column(
                  children: [
                    Container(
                      height: 75,
                      width: 75,
                      margin:
                          const EdgeInsets.only(top: 10, bottom: 3, left: 10),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: squircle(radius: 0.045),
                        shadows: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0.0, 4.0),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SvgPicture.asset(
                          'assets/icons/svg/${categories[index].imageName}.svg',
                        ),
                      ),
                    ),
                    Text(
                      categories[index].name!,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 12,
                          ),
                    ),
                  ],
                ),
              );
            },
          );
  }
}
