import 'package:flutter/material.dart';

import '../../features/authentication/views/login_view.dart';
import '../../features/authentication/views/otp_view_.dart';
import '../../features/authentication/views/sign_up_view.dart';
import '../../features/cart/views/cart_view.dart';
import '../../features/categories/views/categories_products_view.dart';
import '../../features/home/views/home_menu_view.dart';
import '../../features/merchant/views/add_product_view.dart';
import '../../features/merchant/views/merchant_products_view.dart';
import '../../features/order/views/orders_view.dart';
import '../../features/products/views/product_details_view.dart';
import '../../features/profile/views/edit_profile_view.dart';
import '../../features/profile/views/profile_view.dart';
import '../../features/supplier/views/suppliers_products_view.dart';
import 'app_routes.dart';

abstract class AppPages {
  static Map<String, Widget Function(BuildContext)> pages = {
    AppRoutes.loginView: (_) => const LoginView(),
    AppRoutes.signUpView: (_) => const SignUpView(),
    AppRoutes.otpView: (_) => const OtpView(),
    AppRoutes.homeMenuView: (_) => const HomeMenuView(),
    AppRoutes.profileView: (_) => const ProfileView(),
    AppRoutes.editProfileView: (_) => const EditProfileView(),
    AppRoutes.ordersView: (_) => const OrdersView(),
    AppRoutes.cartView: (_) => const CartView(),
    AppRoutes.categoryProductsView: (_) => const CategoryProductsView(),
    AppRoutes.supplierProductsView: (_) => const SuppliersProductsView(),
    AppRoutes.productDetailsView: (_) => const ProductDetailsView(),
    AppRoutes.merchantProductsView: (_) => const MerchantProductsView(),
    AppRoutes.addProductView: (_) => const AddProductView(),
  };
}
