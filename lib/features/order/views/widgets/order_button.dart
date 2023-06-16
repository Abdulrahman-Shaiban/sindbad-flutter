import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderButton extends ConsumerStatefulWidget {
  const OrderButton({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _ProductsViewState();
}

class _ProductsViewState extends ConsumerState<OrderButton> {

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){

      },
      child: SizedBox(
        height: 40,
        child: Center(
          child: Text(
                  AppLocalizations.of(context)!.order,
                ),
        ),
      ),
    );
  }

}
