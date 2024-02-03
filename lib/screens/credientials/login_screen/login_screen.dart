import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_tezda_commerce_app/screens/credientials/login_screen/login_controller.dart';

import '../../../core/colors.dart';
import '../../../core/style.dart';
import '../../../widgets/textfield.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Sign In",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: controller.formGlobalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Welcome!",
                    textAlign: TextAlign.center,
                    style: headingStyle,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Please sign in to your account",
                    textAlign: TextAlign.center,
                    style: titleStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 40),
                  CustomTextFieldWidget(
                    borderRadius: 45,
                    labelText: "Enter your email",
                    textEditingController: controller.emailFieldController,
                    validator: controller.validateEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  Obx(
                    () => CustomTextFieldWidget(
                      borderRadius: 45,
                      labelText: "Enter your password",
                      textEditingController: controller.passwordFieldController,
                      obscureText: controller.obscurePassword,
                      validator: controller.validatePassword,
                      keyboardType: TextInputType.visiblePassword,
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
                  const SizedBox(height: 8),
                  const RememberMeAndForgetPasswordRow(),
                  const SizedBox(height: 32),
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
                        child: const Text("Sign In"),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  const SizedBox(height: 100),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Do you have an Account?"),
                      TextButton(
                        onPressed: controller.onSignUpTap,
                        child: const Text(
                          "Sign Up",
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RememberMeAndForgetPasswordRow extends GetView<LoginController> {
  const RememberMeAndForgetPasswordRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Obx(
              () => Checkbox(
                value: controller.isRememberChecked,
                onChanged: controller.onCheckboxChange,
              ),
            ),
            const Text(
              "Remember me",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: controller.onForgetPasswordTap,
          child: const Text("Forget Password?"),
        ),
      ],
    );
  }
}
