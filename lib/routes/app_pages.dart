import 'package:get/get.dart';
import 'package:flutter_tezda_commerce_app/routes/app_routes.dart';
import 'package:flutter_tezda_commerce_app/screens/cart/cart.dart';
import 'package:flutter_tezda_commerce_app/screens/dashboard/dashboard.dart';
import 'package:flutter_tezda_commerce_app/screens/dashboard/dashboard_binding.dart';
import 'package:flutter_tezda_commerce_app/screens/details/details_binding.dart';
import 'package:flutter_tezda_commerce_app/screens/details/details_screen.dart';
import 'package:flutter_tezda_commerce_app/screens/favorite/favorite.dart';
import 'package:flutter_tezda_commerce_app/screens/favorite/favorite_binding.dart';

import '../screens/cart/cart_binding.dart';
import '../screens/credientials/forget_password_screen/forget_password_binding.dart';
import '../screens/credientials/forget_password_screen/forget_password_screen.dart';
import '../screens/credientials/login_screen/login_binding.dart';
import '../screens/credientials/login_screen/login_screen.dart';
import '../screens/credientials/signup_screen/signup_binding.dart';
import '../screens/credientials/signup_screen/signup_screen.dart';
import '../screens/splash/splash_screen.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.initialSplash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.dashboard,
      page: () => Dashboard(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.cartScreen,
      page: () => const CartScreen(),
      binding: CartBinding(),
    ),
    GetPage(
      name: Routes.detailsScreen,
      page: () => const DetailsScreen(),
      binding: DetailsBinding(),
    ),
    GetPage(
      name: Routes.favoritesScreen,
      page: () => const Favorite(),
      binding: FavoriteBinding(),
    ),
    GetPage(
      name: Routes.forgetScreen,
      page: () => const ForgetPasswordScreen(),
      binding: ForgetPasswordBinding(),
    ),
    GetPage(
      name: Routes.signupScreen,
      page: () => const SignUpScreen(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
  ];
}
