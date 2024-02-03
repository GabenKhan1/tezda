import 'package:get/get.dart';
import 'package:flutter_tezda_commerce_app/screens/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
