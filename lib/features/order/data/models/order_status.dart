import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../core/models/base_model.dart';

class OrderStatus extends BaseModel {
  int? id;
  String? name;
  Color? color;

  OrderStatus({
    this.id,
    this.name,
  }) {
    updateOrderStatusColor();
  }

  factory OrderStatus.id({required int id}) {
    return OrderStatus(
      id: id,
    );
  }

  factory OrderStatus.init() {
    return OrderStatus(
      id: 0,
      name: '',
    );
  }

  @override
  Map<String, dynamic> toMap() => {
        'status_id': id,
      };

  Map<String, dynamic> listToMap({required List<int> orderStatusesIds}) {

    return <String, dynamic>{
      "status_id": orderStatusesIds.join(','),
    };
  }

  @override
  List<OrderStatus> fromList(List items) {
    return items.map<OrderStatus>((item) => fromMap(item)).toList();
  }

  @override
  fromMap(Map<String, dynamic> map) {
    return OrderStatus(
      id: map.containsKey('id') ? map['id']: null,
      name: map.containsKey('name') ? map['name']: null,
    );
  }

  bool get isNewOrder => id == 1;

  bool get isPreparing => id == 2;

  bool get isInTheWay => id == 3;

  bool get isDelivered => id == 4;

  bool get isReceived => id == 5;

  bool get isCanceledByTheBuyer => id == 6;

  bool get isCanceledByTheProvider => id == 7;

  bool get isCanceledByTheAdmin => id == 8;

  bool get isCanceledByTheDriver => id == 9;

  updateOrderStatusColor() {
    switch (id) {
      case 1:
        // New Order
        color = Colors.black54.withOpacity(0.1);
        break;
      case 2:
        // Preparing
        color = Colors.blueGrey.withOpacity(0.1);
        break;
      case 3:
        // In The Way
        color = Colors.orange.withOpacity(0.1);
        break;
      case 4:
        // Delivered
        color = Colors.green.withOpacity(0.1);
        break;
      case 5:
        // Received
        color = Colors.green.withOpacity(0.1);
        break;
      case 6:
        // Canceled By The Buyer
        color = Colors.red.withOpacity(0.1);
        break;
      case 7:
        // Canceled By The Provider
        color = Colors.red.withOpacity(0.1);
        break;
      case 8:
        // Canceled By The Admin
        color = Colors.red.withOpacity(0.1);
        break;
      case 9:
        // isCanceled By The Driver
        color = Colors.red.withOpacity(0.1);
        break;
      default:
        color = Colors.white;
        break;
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is OrderStatus &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode => super.hashCode ^ id.hashCode ^ name.hashCode;

  @override
  String toString() {
    return 'OrderStatus{id: $id, name: $name, color: $color}';
  }
}
