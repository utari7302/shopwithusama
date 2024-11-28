import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shopwithusama/common/widgets/success_screen/success_screen.dart';
import 'package:shopwithusama/data/repositories/authentication/authentication_repository.dart';
import 'package:shopwithusama/features/personalization/controllers/address_controller.dart';
import 'package:shopwithusama/features/shop/controllers/product/cart_controller.dart';
import 'package:shopwithusama/features/shop/controllers/product/checkout_controller.dart';
import 'package:shopwithusama/features/shop/models/order_model.dart';
import 'package:shopwithusama/navigation_menu.dart';
import 'package:shopwithusama/utils/constants/enums.dart';
import 'package:shopwithusama/utils/popups/full_screen_loader.dart';
import 'package:shopwithusama/utils/popups/loaders.dart';

import '../../../../data/repositories/orders/order_repository.dart';
import '../../../../utils/constants/image_strings.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  /// Variables
  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());


  /// Fetch user's order history
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      ULoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  /// Add methods for order processing
  void processOrder(double totalAmount) async {
    try {
      UFullScreenLoader.openLoadingDialog(
          'Processing your order', UImages.docerAnimation);

      final userId = AuthenticationRepository.instance.authUser.uid;
      if (userId.isEmpty) return;

      // Add Orders
      final order = OrderModel(
          id: UniqueKey().toString(),
          userId: userId,
          status: OrderStatus.pending,
          totalAmount: totalAmount,
          orderDate: DateTime.now(),
          paymentMethod: checkoutController.selectedPaymentMethod.value.name,
          address: addressController.selectedAddress.value,
          deliveryDate: DateTime.now(),
          items: cartController.cartItems.toList()
      );

      await orderRepository.saveOrder(order, userId);

      cartController.clearCart();

      Get.off(() =>
          SuccessScreen(image: UImages.docerAnimation,
              title: 'Payment Success!',
              subTitle: 'Your item will be shipped soon!',
              onPressed: () => Get.offAll(()=> const NavigationMenu()),
          ));
    } catch (e) {
      ULoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }


}