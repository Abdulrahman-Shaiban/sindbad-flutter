import '../../data/models/address.dart';

abstract class AddressState {}

class AddressInitial extends AddressState {
  AddressInitial();
}

class AddressLoading extends AddressState {
  AddressLoading();
}

class AddressLoaded extends AddressState {
  final List<Address> orders;

  AddressLoaded({required this.orders});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AddressLoaded && other.orders == orders;
  }

  @override
  int get hashCode => orders.hashCode;
}

class AddressError extends AddressState {
  final String error;

  AddressError({required this.error});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AddressError && other.error == error;
  }

  @override
  int get hashCode => error.hashCode;
}
