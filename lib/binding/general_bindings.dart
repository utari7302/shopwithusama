import 'package:get/get.dart';
import 'package:shopwithusama/features/personalization/controllers/address_controller.dart';
import 'package:shopwithusama/features/shop/controllers/product/checkout_controller.dart';
import 'package:shopwithusama/features/shop/controllers/product/variation_controller.dart';
import 'package:shopwithusama/utils/network/network_manager.dart';

class GeneralBindings extends Bindings {

  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(VariationController());
    Get.put(AddressController());
    Get.put(CheckoutController());
  }

}