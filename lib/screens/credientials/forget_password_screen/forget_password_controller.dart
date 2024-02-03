import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/providers/user_provider.dart';
import '../../../global_controller/global_controller.dart';

class ForgetPasswordController extends GetxController {
  // * variables
  final formGlobalKey = GlobalKey<FormState>();
  final emailFieldController = TextEditingController();

  // * methods
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field is empty';
    } else if (!GetUtils.isEmail(value)) {
      return "Invalid Email";
    }
    return null;
  }

  // * if all field are correct then pass the values to auth controller's createUser method.
  validateForm() async {
    if (formGlobalKey.currentState!.validate()) {
      await UserProvider().forgetPassword(email: emailFieldController.text);
      Get.back();
      Get.find<GlobalGeneralController>().infoSnackbar(
          title: "Password Forget", description: "Email Send to your Account.");
    }
  }
}
