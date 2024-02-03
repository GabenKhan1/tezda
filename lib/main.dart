import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_tezda_commerce_app/core/colors.dart';
import 'package:flutter_tezda_commerce_app/core/constants.dart';
import 'package:flutter_tezda_commerce_app/routes/app_pages.dart';
import 'package:flutter_tezda_commerce_app/routes/app_routes.dart';
import 'package:flutter_tezda_commerce_app/screens/splash/splash_screen_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  final box = GetStorage();
  box.writeIfNull(loginRememberMeStatus, false);
  runApp(const TezdaEcommerceApp());
}

class TezdaEcommerceApp extends StatelessWidget {
  const TezdaEcommerceApp({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return ScreenUtilInit(
      designSize: Size(size.width, size.height),
      builder: (ctx, _) => GetMaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: primary),
          appBarTheme: const AppBarTheme(color: primary),
        ),
        title: 'Tezda Ecommerce App',
        debugShowCheckedModeBanner: false,
        getPages: AppPages.pages,
        initialRoute: Routes.initialSplash,
        initialBinding: SplashBinding(),
        defaultTransition: Transition.cupertino,
      ),
    );
  }
}
