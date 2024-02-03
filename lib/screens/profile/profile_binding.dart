import 'package:get/get.dart';
import 'package:flutter_tezda_commerce_app/screens/profile/profile_controller.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
