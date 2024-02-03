import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_tezda_commerce_app/data/providers/user_provider.dart';

import '../../../routes/app_routes.dart';

class SignUpController extends GetxController {
  final UserProvider _userProvider = UserProvider();
  // * variables
  final formGlobalKey = GlobalKey<FormState>();
  final nameFieldController = TextEditingController();
  final emailFieldController = TextEditingController();
  final passwordFieldController = TextEditingController();
  final phoneFieldController = TextEditingController();

  // * observable variables.
  final _enableIndicator = false.obs;
  get enableIndicator => _enableIndicator.value;
  set enableIndicator(value) => _enableIndicator.value = value;

  final _obscurePassword = true.obs;
  bool get obscurePassword => _obscurePassword.value;

  // * methods
  onShowPasswordTap() {
    _obscurePassword.value = !_obscurePassword.value;
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field is empty';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field is empty';
    } else if (!GetUtils.isEmail(value)) {
      return "Invalid Email";
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field is empty';
    } else if (value.length != 11 && !GetUtils.isPhoneNumber(value)) {
      return "Invalid Phone Number";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field is empty';
    } else if (value.length < 8) {
      return "Password should be 8 or more characters";
    }
    return null;
  }

  // * if all field are correct then pass the values to auth controller's createUser method.
  validateForm() async {
    if (formGlobalKey.currentState!.validate()) {
      enableIndicator = true;

      await _userProvider.signUpCall(
          email: emailFieldController.text,
          password: passwordFieldController.text,
          fullName: nameFieldController.text,
          phoneNumber: phoneFieldController.text);

      // print(signup.toString());
      // if (signup is String) {
      //   Get.find<GlobalGeneralController>().errorSnackbar(
      //       title: "Invalid Credientials", description: signup.toString());
      // } else {
      //   Get.offNamed(Routes.loginScreen);
      // }
      enableIndicator = false;
    }
  }

  onSignInTap() {
    Get.offNamed(Routes.loginScreen);
  }
}
