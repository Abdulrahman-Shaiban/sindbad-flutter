import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sindebad/core/styles/size_utils.dart';
import 'package:sindebad/features/categories/views/widgets/categories_grid_view.dart';
import 'package:sindebad/features/categories/views/widgets/categories_loading_widget.dart';

import '../logic/categories/category_state.dart';
import '../logic/categories_view_controller.dart';

class AllCategoriesListView extends ConsumerStatefulWidget {
  const AllCategoriesListView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _CategoriesViewState();
}

class _CategoriesViewState extends ConsumerState<AllCategoriesListView> {
  @override
  void initState() {
    WidgetsBinding.instance.endOfFrame.then(
      (_) async {
        CategoriesViewController(ref: ref).fetchCategories();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final CategoryState state = ref.watch(categoriesStateNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.categories,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          CategoriesViewController(ref: ref).fetchCategories();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.ws),
          child: Builder(
            builder: (BuildContext context) {
              switch (state.runtimeType) {
                case CategoriesLoaded:
                  return CategoriesGridView(
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
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
