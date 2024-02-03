import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/models/signin_model.dart';

class GlobalGeneralController extends GetxController {
  // * instances.

  final Rx<SignInModel> _user = SignInModel().obs;
  SignInModel get user => _user.value;
  set user(SignInModel user) => _user.value = user;

  errorSnackbar({
    required String title,
    required String description,
  }) {
    Get.snackbar(
      title,
      description,
      snackPosition: SnackPosition.BOTTOM,
      icon: const Icon(Icons.error, color: Colors.red),
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      duration: const Duration(seconds: 5),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
    );
  }

  infoSnackbar({
    required String title,
    required String description,
  }) {
    Get.snackbar(
      title,
      description,
      snackPosition: SnackPosition.BOTTOM,
      icon: const Icon(Icons.info, color: Colors.blue),
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      duration: const Duration(seconds: 5),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
    );
  }

  successSnackbar({
    required String title,
    required String description,
  }) {
    Get.snackbar(
      title,
      description,
      snackPosition: SnackPosition.BOTTOM,
      icon: const Icon(Icons.check, color: Colors.green),
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      duration: const Duration(seconds: 5),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
    );
  }
}
