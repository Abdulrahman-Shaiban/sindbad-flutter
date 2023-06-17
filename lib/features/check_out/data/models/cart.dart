import '../../../../core/models/base_model.dart';
import '../../../products/data/models/product.dart';

class Cart extends BaseModel {
  String id;
  List<Product> products;

  Cart({
    this.id = '',
    required this.products,
  });

  factory Cart.init() {
    return Cart(
      products: [],
    );
  }

  @override
  Map<String, dynamic> toMap() => {
        // 'products': products.to,
      };

  @override
  List<Cart> fromList(List items) {
    return items.map<Cart>((item) => fromMap(item)).toList();
  }

  @override
  fromMap(Map<String, dynamic> map) {
    return Cart(
      id: map.containsKey('id') ? map['id'] ?? '' : '',
      products: map.containsKey('products') && map['products'] != null
          ? Product.init().fromList(map['products'])
          : [],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is Cart &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          products == other.products;

  @override
  int get hashCode => super.hashCode ^ id.hashCode ^ products.hashCode;

  @override
  String toString() {
    return 'Cart{id: $id, products: $products}';
  }
}
