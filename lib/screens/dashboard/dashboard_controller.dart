import 'package:flutter/material.dart';
import 'package:flutter_tezda_commerce_app/data/models/product_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../core/constants.dart';
import '../../routes/app_routes.dart';

class DashboardController extends GetxController {
  // * set initial index 0 so the dashboard starts from home screen.
  DashboardController() : pageController = PageController(initialPage: 0);

  // * varaibles
  //* Use this variable to navigate the pages of PageView.
  final PageController pageController;

  //* Set the initial index 0(homeIndex), so the initial landing page should be home page according to bottom nav.
  final _page = 0.obs;
  //* Set the actual variable private so we could not do business logic inside UI, and use getter to get the value.
  get page => _page.value;

  // * observable varaible for storing app bar title
  final _appbarTitle = "Home".obs;
  get appbarTitle => _appbarTitle.value;
  set appbarTitle(value) => _appbarTitle.value = value;

  //* Call this method inside PageView, whenever page changes.
  void onPageChanged(int pageIndex) {
    // * check page index and update the app bar title accordingly.
    _page.value = pageIndex;
    switch (page) {
      case 0:
        appbarTitle = "Home";
      case 1:
        appbarTitle = "Cart";
      case 2:
        appbarTitle = "Profile";
      default:
        appbarTitle = "";
    }
  }

  logOut() {
    final box = GetStorage();
    box.write(loginRememberMeStatus, false);
    Get.offAllNamed(Routes.loginScreen);
  }

  RxList<Products> favoriteList = <Products>[].obs;

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
