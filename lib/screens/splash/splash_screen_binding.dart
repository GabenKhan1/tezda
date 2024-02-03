import 'package:get/get.dart';
import 'package:flutter_tezda_commerce_app/screens/splash/splash_screen_controller.dart';

import '../../global_controller/global_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());

    // * initialize the auth controller.
    //  Get.put(AuthController());
    // * this controller contains all the global methods that will be use throughout the app.
    Get.put<GlobalGeneralController>(GlobalGeneralController());
  }
}
