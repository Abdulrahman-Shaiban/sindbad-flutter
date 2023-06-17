import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../products/data/models/product.dart';
import '../../logic/cart_view_controller.dart';

class AddToCartButton extends ConsumerStatefulWidget {
  const AddToCartButton({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  ConsumerState createState() => _ProductsViewState();
}

class _ProductsViewState extends ConsumerState<AddToCartButton> {
  @override
  void initState() {
    WidgetsBinding.instance.endOfFrame.then(
      (_) async {},
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        CartViewController(ref: ref).addToCart(product: widget.product);
      },
      child: SizedBox(
        height: 40,
        child: Center(
          child: Text(AppLocalizations.of(context)!.addToCart),
        ),
      ),
    );
  }
}
