import 'package:get/get.dart';
import 'package:flutter_tezda_commerce_app/screens/cart/cart_controller.dart';

class CartBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(() => CartController());
  }
}
