import 'package:get/get.dart';
import 'package:flutter_tezda_commerce_app/data/models/product_model.dart';

class DetailsController extends GetxController {
  final product = Get.arguments;

  Products productDetails = Products();

  @override
  void onInit() {
    productDetails = product;
    super.onInit();
  }
}
