import 'package:get/get.dart';
import 'package:flutter_tezda_commerce_app/screens/details/details_controller.dart';

class DetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsController>(() => DetailsController());
  }
}
