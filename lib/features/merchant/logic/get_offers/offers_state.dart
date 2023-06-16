
import '../../data/offer.dart';

abstract class OffersState {
  const OffersState();
}

class OffersInitial extends OffersState {
  const OffersInitial();
}

class OffersLoading extends OffersState {
  const OffersLoading();
}

class OffersLoaded extends OffersState {
  final List<Offer> offers;

  const OffersLoaded({required this.offers});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OffersLoaded &&
          runtimeType == other.runtimeType &&
          offers == other.offers;

  @override
  int get hashCode => offers.hashCode;
}

class OffersError extends OffersState {
  final String error;

  const OffersError({required this.error});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OffersError && other.error == error;
  }

  @override
  int get hashCode => error.hashCode;
}
