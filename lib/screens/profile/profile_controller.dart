import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_tezda_commerce_app/global_controller/global_controller.dart';

class ProfileController extends GetxController {
  // final UserProvider _userProvider = UserProvider();
  final formKey = GlobalKey<FormState>();

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(value) => _isLoading.value = value;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileNumberController = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  final _profileImage = "".obs;
  String get profileImage => _profileImage.value;
  set profileImage(value) => _profileImage.value = value;

  Future uploadProfileImage() async {
    final XFile? imageFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 85);
    if (imageFile != null) {
      profileImage = imageFile.path;
    }
    // if (imageFile != null) {
    //   setImageUrl = await _userProvider.uploadImage(
    //       file: File(profileImage), uid: Get.find<AuthController>().user.uid);
    // }
  }

  clearForm() {
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    mobileNumberController.clear();
  }

  updateProfileInfo() async {
    if (formKey.currentState!.validate()) {
      Get.find<GlobalGeneralController>().successSnackbar(
          title: "Updated", description: "Profile Updated SuccessFully");
    }

    // final firstname = firstNameController.text;
    // final lastname = lastNameController.text;
    // final email = emailController.text;
    // final mobileNumber = mobileNumberController.text;

    // // * check either any field has assigned a value or not.
    // if (profileImage != "" &&
    //     firstname != "" &&
    //     lastname != "" &&
    //     email != "" &&
    //     mobileNumber != "") {
    //   isLoading = true;

    //     bool result = await _userProvider.updateUserInfo(
    //       userId: Get.find<AuthController>().user.uid,
    //       information: {
    //         "profile_image": profileImageUrl,
    //         "firstname": firstname,
    //         "lastname": lastname,
    //         "email": email,
    //         "mobilenumber": mobileNumber,
    //       },
    //     );

    //     if (result) {
    //       Get.find<GlobalGeneralController>().successSnackbar(
    //         title: "Success",
    //         description: "Profile updated!",
    //       );
    //       //  clearForm();
    //     }
    //     isLoading = false;
    //   } else {
    //     Get.find<GlobalGeneralController>().errorSnackbar(
    //       title: "Error",
    //       description: "All above fields are empty!",
    //     );
    //   }
    //}
  }

  String? nameValidator(value) {
    if (value == null || value.trim().isEmpty) {
      return ' Name is required';
    }
    if (value.trim().length < 4) {
      return 'Username must be at least 4 characters in length';
    }
    // Return null if the entered name is valid
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

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field is empty';
    } else if (!GetUtils.isEmail(value)) {
      return "Invalid Email";
    }
    return null;
  }
}
