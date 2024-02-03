import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_tezda_commerce_app/screens/credientials/signup_screen/signup_controller.dart';

import '../../../core/colors.dart';
import '../../../core/style.dart';
import '../../../widgets/textfield.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "Sign Up",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: controller.formGlobalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Let's get started",
                    textAlign: TextAlign.center,
                    style: headingStyle,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Please sign up to explore more",
                    textAlign: TextAlign.center,
                    style: titleStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 40),
                  CustomTextFieldWidget(
                    borderRadius: 45,
                    labelText: "Enter your name",
                    textEditingController: controller.nameFieldController,
                    validator: controller.validateName,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 40),
                  CustomTextFieldWidget(
                    borderRadius: 45,
                    labelText: "Enter your email",
                    textEditingController: controller.emailFieldController,
                    validator: controller.validateEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 40),
                  CustomTextFieldWidget(
                    borderRadius: 45,
                    labelText: "Enter your number",
                    textEditingController: controller.phoneFieldController,
                    validator: controller.validatePhoneNumber,
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 40),
                  Obx(
                    () => CustomTextFieldWidget(
                      borderRadius: 45,
                      labelText: "Enter your password",
                      textEditingController: controller.passwordFieldController,
                      validator: controller.validatePassword,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: controller.obscurePassword,
                      suffixIcon: IconButton(
                        onPressed: controller.onShowPasswordTap,
                        icon: Icon(
                          controller.obscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: controller.obscurePassword
                              ? Colors.grey
                              : primary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  // * these widgets will only be painted if the condition will be true.
                  Obx(
                    () => Center(
                      child: controller.enableIndicator
                          ? const Padding(
                              padding: EdgeInsets.only(bottom: 40),
                              child: CircularProgressIndicator(),
                            )
                          : null,
                    ),
                  ),
                  Obx(
                    () => SizedBox(
                      height: 60.h,
                      child: FilledButton(
                        style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(primary)),
                        onPressed: controller.enableIndicator
                            ? null
                            : controller.validateForm,
                        child: const Text("Sign Up"),
                        // borderRadius: 16,
                        // color: controller.enableIndicator
                        //     ? primary.withOpacity(0.3)
                        //     : null,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Alreay Have an Account?"),
                      TextButton(
                        onPressed: controller.onSignInTap,
                        child: const Text("Sign In"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
