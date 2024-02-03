import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../core/constants.dart';
import '../../../data/models/signin_model.dart';
import '../../../data/providers/user_provider.dart';
import '../../../global_controller/global_controller.dart';
import '../../../routes/app_routes.dart';

class LoginController extends GetxController {
  // * variables
  final formGlobalKey = GlobalKey<FormState>();
  final emailFieldController = TextEditingController(text: "gaben@gmail.com");
  final passwordFieldController = TextEditingController(text: "1234567890");

  // * observable variables
  final _isRememberChecked = false.obs;
  bool get isRememberChecked => _isRememberChecked.value;
  set isRememberChecked(value) => _isRememberChecked.value = value;

  final _enableIndicator = false.obs;
  bool get enableIndicator => _enableIndicator.value;
  set enableIndicator(value) => _enableIndicator.value = value;

  final _obscurePassword = true.obs;
  bool get obscurePassword => _obscurePassword.value;

  // * methods
  @override
  onInit() {
    // * make it false again so that when user logout. And try to sign in again but without checking the remember me box so the dafault false value can be passed.
    GetStorage().write(
      loginRememberMeStatus,
      false,
    );
    super.onInit();
  }

  onShowPasswordTap() {
    _obscurePassword.value = !_obscurePassword.value;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field is empty';
    } else if (!GetUtils.isEmail(value)) {
      return "Invalid Email";
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

  onCheckboxChange(bool? value) {
    isRememberChecked = !isRememberChecked;
    GetStorage().write(
      loginRememberMeStatus,
      isRememberChecked,
    );
  }

  onForgetPasswordTap() {
    Get.toNamed(Routes.forgetScreen);
  }

  final UserProvider _userProvider = UserProvider();

  gotoHome() {
    Get.offNamed(Routes.dashboard);
  }

  // * if all field are correct then pass the values to auth controller's _ method.
  validateForm() async {
    if (formGlobalKey.currentState!.validate()) {
      enableIndicator = true;
      final result = await _userProvider.signInCall(
        email: emailFieldController.text,
        password: passwordFieldController.text,
      );

      if (result is String) {
        Get.find<GlobalGeneralController>().errorSnackbar(
          title: "Error",
          description: result.toString(),
        );
      } else {
        // user data model.
        SignInModel signInModel = result;
        Get.find<GlobalGeneralController>().user = signInModel;
        GetStorage().write("token", signInModel.data!.token);
        Get.offNamed(Routes.dashboard);
      }

      enableIndicator = false;
    }
  }

  // void validateForm() async {
  //   if (formGlobalKey.currentState!.validate()) {
  //     enableIndicator = true;
  //     final _result = await _userProvider.signinCall(
  //       email: emailFieldController.text,
  //       password: passwordFieldController.text,
  //     );

  //     if (_result is String) {
  //       Get.snackbar(
  //         "Error",
  //         _result,
  //         snackPosition: SnackPosition.BOTTOM,
  //       );
  //     } else {
  //       // user data model.
  //       SignInModel signInModel = _result;
  //       Get.find<GlobalGeneralController>().user = signInModel;
  //       Get.toNamed(Routes.dashboard);
  //     }
  //     print(_result);
  //     enableIndicator = false;
  //   }
  // }

  onGoogleButtonTap() {}

  onFacebookButtonTap() {}

  onSignUpTap() {
    Get.offNamed(Routes.signupScreen);
  }
}
