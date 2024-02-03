import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tezda_commerce_app/core/colors.dart';
import 'package:flutter_tezda_commerce_app/screens/dashboard/dashboard_controller.dart';

import '../../routes/app_routes.dart';
import '../cart/cart.dart';
import '../home/home.dart';
import '../profile/profile.dart';

class Dashboard extends GetView<DashboardController> {
  Dashboard({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> _iconsAndText = [
    {"text": "Home", "icon": Icons.home},
    {"text": "Cart", "icon": Icons.shopping_cart},
    {"text": "Profile", "icon": Icons.settings_outlined},
  ];

  _builtTabIcon(BuildContext context, int iconIndex) {
    return Obx(
      () => GestureDetector(
        onTap: () => controller.pageController.jumpToPage(iconIndex),
        child: controller.page != iconIndex
            ? Icon(
                _iconsAndText[iconIndex]["icon"],
                size: 30.h,
                color: Colors.grey,
              )
            : Icon(
                _iconsAndText[iconIndex]["icon"],
                color: primary,
                size: 35.h,
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Obx(
          () => Text(
            controller.appbarTitle,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          Obx(
            () => controller.appbarTitle == "Profile"
                ? IconButton(
                    onPressed: () => Get.defaultDialog(
                      title: "Log Out",
                      middleText: "Are you sure you want to Log out!",
                      onConfirm: () => controller.logOut(),
                      textConfirm: "Log Out",
                      onCancel: () => Get.back(),
                    ),
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                  )
                : IconButton(
                    onPressed: () {
                      Get.toNamed(Routes.favoritesScreen);
                    },
                    icon: SvgPicture.asset(
                      "assets/images/loved_icon.svg",
                      width: 20.w,
                    ),
                  ),
          ),
        ],
      ),
      body: SafeArea(
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          onPageChanged: controller.onPageChanged,
          children: const [
            HomeScreen(),
            CartScreen(),
            Profile(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              blurRadius: 20,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(24),
            topLeft: Radius.circular(24),
          ),
          child: BottomAppBar(
            // shadowColor: primary,
            //color: secondary,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 8.w),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _builtTabIcon(context, 0),
                  _builtTabIcon(context, 1),
                  _builtTabIcon(context, 2),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
