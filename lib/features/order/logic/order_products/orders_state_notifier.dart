import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../products/data/models/product_image.dart';
import '../../data/models/order.dart';
import '../../data/models/order_product.dart';
import '../../data/models/order_status.dart';
import 'order_state.dart';

class OrdersStateNotifier extends StateNotifier<OrderState> {
  OrdersStateNotifier() : super(OrderInitial());

  Future<void> getOrdersList() async {
    try {
      state = OrdersLoading();
      // final getOrdersResponse = await _orderRepository.getOrdersList();
      final getOrdersResponse = await getFakeOrders();

      state = OrdersLoaded(orders: getOrdersResponse ?? []);
    } catch (e) {
      state = OrdersError(error: 'Error');
    }
  }
}

getFakeOrders() {
  return [
    Order(
      id: '1',
      orderNumber: '2738',
      status: OrderStatus(id: 1),
      orderDate: DateTime.now(),
      total: 200.67,
      orderProducts: [
        OrderProduct(
          id: '1',
          name: 'مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون ',
          price: '200.67',
          ratingAverage: 4.6,
          totalRatingsNumber: 430,
          description:
              'مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون',
          availableQuantity: 97,
          productImages: [
            ProductImage(
                imagePath:
                    'image-vector/cosmetic-product-ad-transparent-circle-600w-1777871555.jpg'),
            ProductImage(
                imagePath:
                    'image-vector/3d-illustration-various-blank-cosmetic-600w-1730749870.jpg'),
            ProductImage(
                imagePath:
                    'image-vector/3d-illustration-green-tea-seed-600w-1782648659.jpg'),
          ],
          subCategoryName: "الدايت",
          supplierName: "اليمن الشامل التجارية",
        ),
        OrderProduct(
          id: '1',
          name: 'مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون ',
          price: '200.67',
          ratingAverage: 4.6,
          totalRatingsNumber: 430,
          description:
              'مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون',
          availableQuantity: 97,
          productImages: [
            ProductImage(
                imagePath:
                    'image-vector/cosmetic-product-ad-transparent-circle-600w-1777871555.jpg'),
            ProductImage(
                imagePath:
                    'image-vector/3d-illustration-various-blank-cosmetic-600w-1730749870.jpg'),
            ProductImage(
                imagePath:
                    'image-vector/3d-illustration-green-tea-seed-600w-1782648659.jpg'),
          ],
          subCategoryName: "الدايت",
          supplierName: "اليمن الشامل التجارية",
        ),
      ],
    ),
    Order(
      id: '1',
      orderNumber: '2738',
      status: OrderStatus(id: 1),
      orderDate: DateTime.now(),
      total: 200.67,
      orderProducts: [
        OrderProduct(
          id: '1',
          name: 'مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون ',
          price: '200.67',
          ratingAverage: 4.6,
          totalRatingsNumber: 430,
          description:
              'مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون',
          availableQuantity: 97,
          productImages: [
            ProductImage(
                imagePath:
                    'image-vector/cosmetic-product-ad-transparent-circle-600w-1777871555.jpg'),
            ProductImage(
                imagePath:
                    'image-vector/3d-illustration-various-blank-cosmetic-600w-1730749870.jpg'),
            ProductImage(
                imagePath:
                    'image-vector/3d-illustration-green-tea-seed-600w-1782648659.jpg'),
          ],
          subCategoryName: "الدايت",
          supplierName: "اليمن الشامل التجارية",
        ),
        OrderProduct(
          id: '1',
          name: 'مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون ',
          price: '200.67',
          ratingAverage: 4.6,
          totalRatingsNumber: 430,
          description:
              'مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون',
          availableQuantity: 97,
          productImages: [
            ProductImage(
                imagePath:
                    'image-vector/cosmetic-product-ad-transparent-circle-600w-1777871555.jpg'),
            ProductImage(
                imagePath:
                    'image-vector/3d-illustration-various-blank-cosmetic-600w-1730749870.jpg'),
            ProductImage(
                imagePath:
                    'image-vector/3d-illustration-green-tea-seed-600w-1782648659.jpg'),
          ],
          subCategoryName: "الدايت",
          supplierName: "اليمن الشامل التجارية",
        ),
      ],
    ),
    Order(
      id: '1',
      orderNumber: '2738',
      status: OrderStatus(id: 1),
      orderDate: DateTime.now(),
      total: 200.67,
      orderProducts: [
        OrderProduct(
          id: '1',
          name: 'مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون ',
          price: '200.67',
          ratingAverage: 4.6,
          totalRatingsNumber: 430,
          description:
              'مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون',
          availableQuantity: 97,
          productImages: [
            ProductImage(
                imagePath:
                    'image-vector/cosmetic-product-ad-transparent-circle-600w-1777871555.jpg'),
            ProductImage(
                imagePath:
                    'image-vector/3d-illustration-various-blank-cosmetic-600w-1730749870.jpg'),
            ProductImage(
                imagePath:
                    'image-vector/3d-illustration-green-tea-seed-600w-1782648659.jpg'),
          ],
          subCategoryName: "الدايت",
          supplierName: "اليمن الشامل التجارية",
        ),
        OrderProduct(
          id: '1',
          name: 'مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون ',
          price: '200.67',
          ratingAverage: 4.6,
          totalRatingsNumber: 430,
          description:
              'مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون مولد متسوبشي 4564 * 66 في كاتم صوت مدمج مع طبلون',
          availableQuantity: 97,
          productImages: [
            ProductImage(
                imagePath:
                    'image-vector/cosmetic-product-ad-transparent-circle-600w-1777871555.jpg'),
            ProductImage(
                imagePath:
                    'image-vector/3d-illustration-various-blank-cosmetic-600w-1730749870.jpg'),
            ProductImage(
                imagePath:
                    'image-vector/3d-illustration-green-tea-seed-600w-1782648659.jpg'),
          ],
          subCategoryName: "الدايت",
          supplierName: "اليمن الشامل التجارية",
        ),
      ],
    ),
  ];
}
