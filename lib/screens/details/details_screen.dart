import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tezda_commerce_app/global_controller/global_controller.dart';
import 'package:flutter_tezda_commerce_app/screens/dashboard/dashboard_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_tezda_commerce_app/core/api_url.dart';
import 'package:flutter_tezda_commerce_app/screens/details/details_controller.dart';

import '../../core/colors.dart';

class DetailsScreen extends GetView<DetailsController> {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: size.width,
                      height: 300.h,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(ApiUrl.baseUrl +
                                  controller.productDetails.productPhoto
                                      .toString()),
                              fit: BoxFit.cover)),
                    ),
                    SafeArea(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Container(
                              width: 50.w,
                              height: 50.h,
                              decoration: const BoxDecoration(
                                  color: white, shape: BoxShape.circle),
                              child: Center(
                                child: Icon(
                                  Icons.arrow_back,
                                  size: 18.w,
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            controller.productDetails.name ?? "",
                            style: TextStyle(
                                fontSize: 21.sp, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Text(
                            "\$ ${controller.productDetails.price}",
                            style: TextStyle(
                                fontSize: 21.sp, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 30.w,
                          ),
                          IconButton(
                            onPressed: () {
                              if (!Get.find<DashboardController>()
                                  .favoriteList
                                  .contains(controller.productDetails)) {
                                Get.find<DashboardController>()
                                    .favoriteList
                                    .add(controller.productDetails);
                                Get.find<GlobalGeneralController>()
                                    .successSnackbar(
                                        title: "Added",
                                        description: "Added to Favorite");
                              }
                            },
                            icon: Obx(
                              () => Get.find<DashboardController>()
                                      .favoriteList
                                      .contains(controller.productDetails)
                                  ? Icon(
                                      Icons.favorite_rounded,
                                      color: Colors.red,
                                      size: 24.w,
                                    )
                                  : Icon(
                                      Icons.favorite_rounded,
                                      color: Colors.grey,
                                      size: 24.w,
                                    ),

                              // color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: textFieldColor,
                                borderRadius: BorderRadius.circular(3)),
                            child: const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Icon(
                                Icons.hourglass_bottom,
                                color: primary,
                                size: 16,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: textFieldColor,
                                borderRadius: BorderRadius.circular(3)),
                            child: const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Text(
                                    "4.7",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: yellowStar,
                                    size: 17,
                                  ),
                                  Text(
                                    "(16)",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: size.width - 30,
                        child: Text(
                          controller.productDetails.description ?? "",
                          style: TextStyle(fontSize: 14.sp, height: 1.3),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.h),
        child: SizedBox(
          height: 60.h,
          child: FilledButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(primary)),
            onPressed: () =>
                Get.find<GlobalGeneralController>().successSnackbar(
              title: "Added",
              description: "Added to Cart",
            ),
            child: const Text(
              'Add to Cart',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
