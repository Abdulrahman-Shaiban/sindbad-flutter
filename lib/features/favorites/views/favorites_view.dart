import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sindebad/core/styles/size_utils.dart';

import '../../products/views/widgets/products_grid_view.dart';
import '../../products/views/widgets/products_loading_widget.dart';
import '../logic/delete_product_from_favorite_widget_controller.dart';
import '../logic/favorites_view_controller.dart';
import '../logic/get_favorites/favorites_state.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _FavoritesViewState();
}

class _FavoritesViewState extends ConsumerState<FavoritesView> {
  @override
  void initState() {
    WidgetsBinding.instance.endOfFrame.then(
      (_) async {
        FavoritesViewController(ref: ref).fetchFavorites();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final FavoritesState state = ref.watch(favoritesStateStateNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.favorites,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          FavoritesViewController(ref: ref).fetchFavorites();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.ws),
          child: Builder(
            builder: (BuildContext context) {
              switch (state.runtimeType) {
                case FavoritesLoaded:
                  return ProductsGridView(
                    products: (state as FavoritesLoaded).favorites,
                    isInFavoriteScreen: true,
                  );
                case FavoritesError:
                  return Center(child: Text((state as FavoritesError).error));
                case FavoritesLoading:
                  return const ProductsLoadingWidget(
                    forHomeView: false,
                  );
                default:
                  return const ProductsLoadingWidget(
                    forHomeView: false,
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
