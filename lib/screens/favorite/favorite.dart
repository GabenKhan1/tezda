import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tezda_commerce_app/global_controller/global_controller.dart';
import 'package:flutter_tezda_commerce_app/screens/dashboard/dashboard_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_tezda_commerce_app/core/colors.dart';
import 'package:flutter_tezda_commerce_app/core/style.dart';
import 'package:flutter_tezda_commerce_app/screens/favorite/favorite_controller.dart';

import '../../core/api_url.dart';

class Favorite extends GetView<FavoriteController> {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: white),
        title: Text(
          'Favorites',
          style: appbarTitleStyle.copyWith(color: white),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Obx(
            () => ListView(
              children: List.generate(
                Get.find<DashboardController>().favoriteList.length,
                (index) {
                  final favoriteList =
                      Get.find<DashboardController>().favoriteList[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Row(
                      children: [
                        SizedBox(
                          width: (Get.width - 30) * 0.6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      favoriteList.name ?? "",
                                      style: const TextStyle(
                                          fontSize: 16,
                                          height: 1.5,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    IconButton(
                                      icon: Container(
                                        width: 60.w,
                                        height: 60.h,
                                        decoration: const BoxDecoration(
                                            color: white,
                                            shape: BoxShape.circle),
                                        child: Icon(
                                          Icons.favorite_rounded,
                                          color: Colors.red,
                                          size: 32.w,
                                        ),
                                      ),
                                      onPressed: () {
                                        Get.find<DashboardController>()
                                            .favoriteList
                                            .removeAt(index);
                                        Get.find<GlobalGeneralController>()
                                            .successSnackbar(
                                                title: "Removed",
                                                description:
                                                    "Removed from Favorite");
                                      },
                                    )
                                  ]),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                favoriteList.description ?? "",
                                maxLines: 3,
                                style: const TextStyle(height: 1.3),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "\$ ${favoriteList.price} ",
                                    style: const TextStyle(
                                        height: 1.3,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  // const SizedBox(
                                  //   width: 10,
                                  // ),

                                  FilledButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            const MaterialStatePropertyAll(
                                                primary),
                                        minimumSize: MaterialStatePropertyAll(
                                            MediaQuery.sizeOf(context) * 0.03),
                                      ),
                                      onPressed: () {},
                                      child: const Text("add to cart")),
                                  // FilledButton(
                                  //   style: ButtonStyle(
                                  //     backgroundColor:
                                  //         const MaterialStatePropertyAll(
                                  //             primary),
                                  //     minimumSize:
                                  //         MaterialStatePropertyAll(
                                  //             MediaQuery.sizeOf(
                                  //                     context) *
                                  //                 0.03),
                                  //   ),
                                  //   onPressed: () =>
                                  //       controller.removeFromCart(
                                  //           prod.sId.toString(),
                                  //           prod.restaurantId
                                  //               .toString()),
                                  //   child: const Text("-"),
                                  // ),
                                  // const SizedBox(
                                  //   width: 10,
                                  // ),
                                  // Text(
                                  //   "1",
                                  //   style:
                                  //       const TextStyle(height: 1.3),
                                  // ),
                                  // const SizedBox(
                                  //   width: 10,
                                  // ),
                                  // FilledButton(
                                  //     style: ButtonStyle(
                                  //       backgroundColor:
                                  //           const MaterialStatePropertyAll(
                                  //               primary),
                                  //       minimumSize:
                                  //           MaterialStatePropertyAll(
                                  //               MediaQuery.sizeOf(
                                  //                       context) *
                                  //                   0.03),
                                  //     ),
                                  //     onPressed: () =>
                                  //         controller.addToCart(
                                  //             prod.sId.toString(),
                                  //             prod.restaurantId
                                  //                 .toString()),
                                  //     child: const Text("+")),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 110,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 10, bottom: 10),
                              child: Image(
                                image: NetworkImage(ApiUrl.baseUrl +
                                    favoriteList.productPhoto.toString()),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
