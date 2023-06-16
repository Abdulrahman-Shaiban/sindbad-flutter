import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../merchant/data/offer.dart';
import '../../../products/data/models/product_image.dart';
import '../../../merchant/logic/get_offers/offers_state.dart';

class OffersStateNotifier extends StateNotifier<OffersState> {
  OffersStateNotifier() : super(const OffersInitial());

  Future<void> fetchOffers() async {
    try {
      state = const OffersLoading();
      // final favoritesResponse = await _favoritesRepository.fetchOffers();
      final favoritesResponse = await getFakeOffers();
      state = OffersLoaded(offers: favoritesResponse);
    } catch (e) {
      state = const OffersError(error: 'Error');
    }
  }
}

getFakeOffers() {
  return [
    Offer(
      id: '1',
      categoryName: 'المولدات',
      details: 'مولد جون دي فرنسي 600 كي 600 في كاتم صوت',
      images: [
        ProductImage(
            imagePath:
                'https://w7.pngwing.com/pngs/278/500/png-transparent-electric-generator-diesel-generator-pca-power-generators-electric-power-generator-electricity-diesel-engine-generator.png'),
      ],
    ),
    Offer(
      id: '1',
      categoryName: 'المولدات',
      details: 'مولد جون دي فرنسي 600 كي 600 في كاتم صوت',
      images: [
        ProductImage(
            imagePath:
                'https://w7.pngwing.com/pngs/278/500/png-transparent-electric-generator-diesel-generator-pca-power-generators-electric-power-generator-electricity-diesel-engine-generator.png'),
      ],
    ),
    Offer(
      id: '1',
      categoryName: 'المولدات',
      details: 'مولد جون دي فرنسي 600 كي 600 في كاتم صوت',
      images: [
        ProductImage(
            imagePath:
                'https://w7.pngwing.com/pngs/278/500/png-transparent-electric-generator-diesel-generator-pca-power-generators-electric-power-generator-electricity-diesel-engine-generator.png'),
      ],
    ),
  ];
}
