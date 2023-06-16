import 'package:flutter/material.dart';
import 'order_status.dart';

extension OrderStatusExtension on OrderStatus {
  Color get color {
    switch (id) {
      case 1:
        // New Order
        return Colors.black54.withOpacity(0.1);
      case 2:
        // Preparing
        return Colors.yellow.withOpacity(0.1);
      case 3:
        // In The Way
        return Colors.orange.withOpacity(0.1);
      case 4:
        // Delivered
        return Colors.green.withOpacity(0.1);
      case 5:
        // Received
        return Colors.green.withOpacity(0.1);
      case 6:
        // Canceled By The Buyer
        return Colors.red.withOpacity(0.1);
      case 7:
        // Canceled By The Provider
        return Colors.red.withOpacity(0.1);
      case 8:
        // Canceled By The Admin
        return Colors.red.withOpacity(0.1);
      case 9:
        // isCanceled By The Driver
        return Colors.red.withOpacity(0.1);
      default:
        return Colors.white;
    }
  }
}
