import '../../../../core/models/base_model.dart';

class Address extends BaseModel {
  String? id;
  String? addressName;

  Address({
    this.id,
    this.addressName,
  });

  factory Address.init() {
    return Address(
      id: '',
      addressName: '',
    );
  }

  @override
  Map<String, dynamic> toMap() => {
        'order_id': id,
      };

  @override
  List<Address> fromList(List items) {
    return items.map<Address>((item) => fromMap(item)).toList();
  }

  @override
  fromMap(Map<String, dynamic> map) {
    return Address(
      id: map.containsKey('id') ? map['id'] : null,
      addressName: map.containsKey('order_no') ? map['order_no'] : null,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is Address &&
          runtimeType == other.runtimeType &&
          addressName == other.addressName;

  @override
  int get hashCode => super.hashCode ^ addressName.hashCode;

  @override
  String toString() {
    return 'Order{orderNumber: $addressName,}';
  }
}
