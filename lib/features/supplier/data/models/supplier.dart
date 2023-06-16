import 'package:sindebad/core/models/base_model.dart';

import '../../../products/data/models/product.dart';

class Supplier extends BaseModel {
  final String? id;
  final String? name;
  final int? phone;
  final List<Product> products;
  final int? status;
  String? imageName;
  static String filterTypeName= "supplier";

  Supplier({
    this.id,
    this.name,
    this.phone,
    this.products = const [],
    this.status,
    this.imageName,
  });

  factory Supplier.init() {
    return Supplier(
      id: '',
      name: '',
      phone: -1,
      status: -1,
      products: const [],
    );
  }

  @override
  Map<String, dynamic> toMap() => {
        'supplier_id': id,
      };

  @override
  List<Supplier> fromList(List items) {
    return items.map<Supplier>((item) => fromMap(item)).toList();
  }

  @override
  fromMap(Map<String, dynamic> map) {
    return Supplier(
      id: map.containsKey('id') ? map['id']: null,
      name: map.containsKey('name') ? map['name']: null,
      phone: map.containsKey('phone') ? map['phone'] : '',
      status: map.containsKey('status') ? map['status']: null,
      imageName: map.containsKey('image_name') ? map['image_name']: null,
      products: map.containsKey('products') && map['products'] != null
          ? Product.init().fromList(map['products'])
          : [],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is Supplier &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          status == other.status;

  @override
  int get hashCode =>
      super.hashCode ^ id.hashCode ^ name.hashCode ^ status.hashCode;

  @override
  String toString() {
    return 'Supplier{id: $id, name: $name, phone: $phone, status: $status, imageName: $imageName, products: ${products.toString()}}';
  }
}
