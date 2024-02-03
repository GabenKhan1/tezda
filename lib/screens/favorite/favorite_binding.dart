import 'package:get/get.dart';
import 'package:flutter_tezda_commerce_app/screens/favorite/favorite_controller.dart';

class FavoriteBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoriteController>(() => FavoriteController());
  }
}
