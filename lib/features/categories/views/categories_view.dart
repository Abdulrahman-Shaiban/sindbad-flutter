import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/styles/app_colors.dart';
import '../logic/categories/category_state.dart';
import '../logic/categories_view_controller.dart';
import 'widgets/categories_list_view.dart';
import 'widgets/categories_loading_widget.dart';

class CategoriesView extends ConsumerStatefulWidget {
  const CategoriesView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _ProductsViewState();
}

class _ProductsViewState extends ConsumerState<CategoriesView> {
  @override
  Widget build(BuildContext context) {
    final CategoryState state = ref.watch(categoriesStateNotifierProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.categories,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 20,
                      color: AppColors.primaryColor,
                    ),
              ),
              Row(
                children: [
                  Text(
                    'مشاهدة الكل',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 13,
                          color: Colors.red,
                        ),
                    strutStyle: const StrutStyle(
                      height: 1.2,
                      forceStrutHeight: true,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_right,
                    color: Colors.red,
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: Builder(builder: (BuildContext context) {
            switch (state.runtimeType) {
              case CategoriesLoaded:
                return CategoriesListView(
                  categories: (state as CategoriesLoaded).categories,
                );
              case CategoriesError:
                return Center(
                  child: Text((state as CategoriesError).error),
                );
              case CategoriesLoading:
                return const CategoriesLoadingWidget();
              default:
                return const Center(
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                    ),
                  ),
                );
            }
          }),
        ),
      ],
    );
  }
}
