import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../logic/suppliers/supplier_state.dart';
import '../logic/suppliers_view_controller.dart';
import 'widgets/suppliers_list_view.dart';
import 'widgets/suppliers_loading_widget.dart';

class SuppliersView extends ConsumerStatefulWidget {
  const SuppliersView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _ProductsViewState();
}

class _ProductsViewState extends ConsumerState<SuppliersView> {
  @override
  Widget build(BuildContext context) {
    final SupplierState state = ref.watch(supplierStateNotifierProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Builder(builder: (BuildContext context) {
            switch (state.runtimeType) {
              case SuppliersLoaded:
                return SuppliersListView(
                  suppliers: (state as SuppliersLoaded).suppliers,
                );
              case SuppliersError:
                return Center(
                  child: Text((state as SuppliersError).error),
                );
              case SuppliersLoading:
                return const SuppliersLoadingWidget();
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
