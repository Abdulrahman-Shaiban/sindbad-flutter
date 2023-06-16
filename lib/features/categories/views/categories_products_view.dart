import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sindebad/core/styles/size_utils.dart';

import '../../cart/views/widgets/cart_icon_widget.dart';
import '../../products/views/widgets/products_grid_view.dart';
import '../../products/views/widgets/products_loading_widget.dart';
import '../data/models/category.dart';
import '../logic/category_products/category_products_state.dart';
import '../logic/category_products_view_controller.dart';

class CategoryProductsView extends ConsumerStatefulWidget {
  const CategoryProductsView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _ProductsViewState();
}

class _ProductsViewState extends ConsumerState<CategoryProductsView> {
  @override
  void initState() {
    WidgetsBinding.instance.endOfFrame.then(
      (_) async {
        CategoryProductsViewController(ref: ref).fetchCategoryProducts();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final CategoryProductsState state =
        ref.watch(categoryProductsStateNotifierProvider);

    final category = ModalRoute.of(context)!.settings.arguments as Category;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          category.name != null ? category.name!.trim() : "",
        ),
        actions: [
          const CartIconWidget(),
          SizedBox(
            width: 5.msbt0,
          )
        ],
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.ws, vertical: 1.5.hsbt0),
          child: Builder(builder: (BuildContext context) {
            switch (state.runtimeType) {
              case CategoryProductsLoaded:
                return ProductsGridView(
                  products: (state as CategoryProductsLoaded).products,
                );
              case CategoryProductsError:
                return Center(
                    child: Text((state as CategoryProductsError).error));
              case CategoryProductsLoading:
                return const ProductsLoadingWidget(
                  forHomeView: false,
                );
              default:
                return const ProductsLoadingWidget(
                  forHomeView: false,
                );
            }
          })),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
