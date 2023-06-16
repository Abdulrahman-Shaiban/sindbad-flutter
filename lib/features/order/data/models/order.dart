import '../../../../core/models/base_model.dart';
import 'order_product.dart';
import 'order_status.dart';

class Order extends BaseModel {
  String? id;
  String? orderNumber;
  String? imageName;
  OrderStatus? status;
  num? total;
  List<OrderProduct> orderProducts;
  DateTime? orderDate;


  Order({
    this.id,
    this.orderNumber,
    this.imageName,
    this.status,
    this.total,
    this.orderDate,
    this.orderProducts = const [],
  });

  factory Order.init() {
    return Order(
      id: '',
      orderNumber: '',
      imageName: '',
      status: OrderStatus.init(),
      orderProducts: const [],
    );
  }

  @override
  Map<String, dynamic> toMap() => {
        'order_id': id,
      };

  @override
  List<Order> fromList(List items) {
    return items.map<Order>((item) => fromMap(item)).toList();
  }

  @override
  fromMap(Map<String, dynamic> map) {
    return Order(
      id: map.containsKey('id') ? map['id'] : null,
      orderNumber: map.containsKey('order_no') ? map['order_no'] : null,
      imageName: map.containsKey('image_name') ? map['image_name'] : null,
      total: map.containsKey('total') ? map['total'] : null,
      status: map.containsKey('status') && map['status'] != null
          ? OrderStatus.init().fromMap(map['status'])
          : OrderStatus.init(),
      orderDate: map.containsKey('order_date') && map['order_date'] != null
          ? DateTime.parse(map['order_date'])
          : null,
      orderProducts: map.containsKey('products') && map['products'] != null
          ? OrderProduct.init().fromList(map['products'])
          : [],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is Order &&
          runtimeType == other.runtimeType &&
          orderNumber == other.orderNumber &&
          imageName == other.imageName &&
          status == other.status &&
          orderProducts == other.orderProducts &&
          orderDate == other.orderDate;

  @override
  int get hashCode =>
      super.hashCode ^
      orderNumber.hashCode ^
      imageName.hashCode ^
      status.hashCode ^
      orderProducts.hashCode ^
      orderDate.hashCode ;

  @override
  String toString() {
    return 'Order{orderNumber: $orderNumber, imageName: $imageName status: ${status.toString()}, products: ${orderProducts.toString()}, orderDate: $orderDate,}';
  }
}
