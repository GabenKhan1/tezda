import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_tezda_commerce_app/screens/profile/profile_controller.dart';
import 'package:flutter_tezda_commerce_app/widgets/textfield.dart';

import '../../core/colors.dart';

class Profile extends GetView<ProfileController> {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Obx(
                  () => Center(
                    child: GestureDetector(
                      onTap: () {
                        controller.uploadProfileImage();
                      },
                      child: controller.profileImage == ""
                          ? const CircleAvatar(
                              radius: 68,
                              backgroundImage: AssetImage(
                                "assets/images/slide_1.jpg",
                              ),
                            )
                          : CircleAvatar(
                              radius: 68,
                              foregroundImage: FileImage(
                                File(controller.profileImage),
                              ),
                            ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    "Personal Information",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFieldWidget(
                  borderRadius: 45,
                  hintText: "First name",
                  textEditingController: controller.firstNameController,
                  keyboardType: TextInputType.text,
                  validator: controller.nameValidator,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFieldWidget(
                  borderRadius: 45,
                  hintText: "Last name",
                  textEditingController: controller.lastNameController,
                  keyboardType: TextInputType.text,
                  validator: controller.nameValidator,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFieldWidget(
                  borderRadius: 45,
                  hintText: "Email",
                  textEditingController: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: controller.validateEmail,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFieldWidget(
                  borderRadius: 45,
                  keyboardType: TextInputType.number,
                  hintText: "Mobile Number",
                  textEditingController: controller.mobileNumberController,
                  validator: controller.validatePhoneNumber,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 60,
                  width: MediaQuery.sizeOf(context).width,
                  child: FilledButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(primary)),
                    onPressed: () {
                      controller.updateProfileInfo();
                    },
                    child: const Text("Update"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
