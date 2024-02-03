import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_tezda_commerce_app/core/style.dart';
import '../../../core/colors.dart';
import '../../../widgets/textfield.dart';
import 'forget_password_controller.dart';

class ForgetPasswordScreen extends GetView<ForgetPasswordController> {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text(
          "Forget Password",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                "assets/images/slide_3.jpg",
                height: MediaQuery.sizeOf(context).height / 4,
              ),
              Text(
                "Forget Password?",
                textAlign: TextAlign.center,
                style: titleStyle,
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Enter your email address for verification",
                  textAlign: TextAlign.center,
                  style: bodyStyle,
                ),
              ),
              const SizedBox(height: 40),
              Form(
                key: controller.formGlobalKey,
                child: CustomTextFieldWidget(
                  borderRadius: 45,
                  labelText: "Enter your email",
                  textEditingController: controller.emailFieldController,
                  validator: controller.validateEmail,
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                height: 60.h,
                child: FilledButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(primary)),
                  onPressed: controller.validateForm,
                  child: const Text("Send"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
