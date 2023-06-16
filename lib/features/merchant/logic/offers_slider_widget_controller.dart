import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/routes/app_routes.dart';
import 'get_offers/offers_state.dart';
import 'get_offers/offers_state_notifier.dart';

final offersNotifierProvider =
    StateNotifierProvider<OffersStateNotifier, OffersState>(
  (ref) => OffersStateNotifier(),
);

class OffersSliderWidgetController {
  late WidgetRef ref;

  OffersSliderWidgetController({required this.ref});

  Future<void> fetchOffers() async {
    await ref
        .read(offersNotifierProvider.notifier)
        .fetchOffers();
  }
}

