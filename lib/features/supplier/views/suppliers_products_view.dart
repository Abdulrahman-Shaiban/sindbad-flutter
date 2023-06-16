import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sindebad/core/styles/size_utils.dart';

import '../../cart/views/widgets/cart_icon_widget.dart';
import '../../products/views/widgets/products_grid_view.dart';
import '../../products/views/widgets/products_loading_widget.dart';
import '../data/models/supplier.dart';
import '../logic/suppliers_products/supplier_products_state.dart';
import '../logic/suppliers_products_view_controller.dart';

class SuppliersProductsView extends ConsumerStatefulWidget {
  const SuppliersProductsView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _ProductsViewState();
}

class _ProductsViewState extends ConsumerState<SuppliersProductsView> {
  @override
  void initState() {
    WidgetsBinding.instance.endOfFrame.then(
      (_) async {
        SupplierProductsViewController(ref: ref).fetchSupplierProducts();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final SupplierProductsState state =
        ref.watch(supplierProductsStateNotifierProvider);

    final Supplier supplier =
        ModalRoute.of(context)!.settings.arguments as Supplier;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          supplier.name != null ? supplier.name!.trim() : "",
        ),
        actions: [
          const CartIconWidget(),
          SizedBox(
            width: 5.msbt0,
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          SupplierProductsViewController(ref: ref).fetchSupplierProducts();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.ws, vertical: 1.5.hsbt0),
          child: Builder(builder: (BuildContext context) {
            switch (state.runtimeType) {
              case SupplierProductsLoaded:
                return ProductsGridView(
                  products: (state as SupplierProductsLoaded).products,
                );
              case SupplierProductsError:
                return Center(
                    child: Text((state as SupplierProductsError).error));
              case SupplierProductsLoading:
                return const ProductsLoadingWidget(
                  forHomeView: false,
                );
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
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
