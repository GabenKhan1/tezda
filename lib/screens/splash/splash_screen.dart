import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter_tezda_commerce_app/core/colors.dart';
import 'package:flutter_tezda_commerce_app/screens/splash/splash_screen_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "TEZDA",
              style: TextStyle(
                  color: primary, fontSize: 64, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
