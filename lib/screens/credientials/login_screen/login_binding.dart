import 'package:get/instance_manager.dart';
import 'package:flutter_tezda_commerce_app/screens/credientials/login_screen/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
