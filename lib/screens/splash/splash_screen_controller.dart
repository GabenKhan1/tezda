import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../core/constants.dart';
import '../../routes/app_routes.dart';

class SplashController extends GetxController {
  // * instances
  final box = GetStorage();

  @override
  void onInit() {
    // * wait for 2 seconds and then move to next screen.

    Timer(const Duration(seconds: 2), () {
      if (box.read(loginRememberMeStatus)) {
        Get.offNamed(Routes.dashboard);
      } else {
        Get.offNamed(Routes.loginScreen);
      }

      Get.delete<SplashController>();
    });

    super.onInit();
  }
}
