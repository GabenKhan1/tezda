import 'package:get/instance_manager.dart';
import 'package:flutter_tezda_commerce_app/screens/credientials/signup_screen/signup_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController());
  }
}
