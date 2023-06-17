import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sindebad/core/styles/size_utils.dart';
import 'package:sindebad/features/categories/data/models/category.dart';

import '../../logic/categories_view_controller.dart';
import 'search_bar_widget.dart';

class CategoriesGridView extends ConsumerWidget {
  const CategoriesGridView({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final List<Category> categories;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: const EdgeInsets.only(top: 20),
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      children: [
        const SizedBox(
          height: 55,
          child: SearchBarWidget(),
        ),
        const SizedBox(
          height: 15,
        ),
        categories.isEmpty
            ? Center(
                child: Text(
                  AppLocalizations.of(context)!
                      .emptyDataMessage(AppLocalizations.of(context)!.products),
                ),
              )
            : GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.73.msbt0,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      navigateToCategoryProductsView(
                          context: context, category: categories[index]);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 140,
                          width: 140,
                          margin: const EdgeInsets.only(
                              top: 10, bottom: 3, left: 10),
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: const CircleBorder(),
                            shadows: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 10,
                                offset: const Offset(0.0, 4.0),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(43.0),
                            child: SvgPicture.asset(
                              'assets/icons/svg/${categories[index].imageName}.svg',
                            ),
                          ),
                        ),
                        Text(
                          categories[index].name!,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontSize: 14,
                                  ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ],
    );
  }
}
