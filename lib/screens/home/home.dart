import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_tezda_commerce_app/core/api_url.dart';
import 'package:flutter_tezda_commerce_app/routes/app_routes.dart';
import 'package:flutter_tezda_commerce_app/screens/home/home_controller.dart';
import 'package:flutter_tezda_commerce_app/screens/home/widgets/slider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Obx(
        () => controller.isLoading
            ? Skeletonizer(
                enabled: controller.isLoading,
                child: ListView.builder(
                  itemCount: 16,
                  itemBuilder: (context, index) {
                    return const Card(
                        child: ListTile(
                      title: Text("name"),
                      subtitle: Text("jobTitle"),
                      leading: Skeleton.replace(
                        child: CircleAvatar(
                          radius: 320,
                          backgroundImage:
                              AssetImage("assets/images/slide_1.jpg"),
                        ),
                      ),
                    ));
                  },
                ),
              )
            : ListView(
                children: [
                  const SizedBox(height: 15),
                  CustomSliderWidget(items: controller.sliderImages),
                  const SizedBox(height: 15),
                  Obx(
                    () => ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller
                                .productsList.value.data?.products?.length ??
                            0,
                        itemBuilder: (context, i) {
                          return InkWell(
                            onTap: () => Get.toNamed(Routes.detailsScreen,
                                arguments: controller
                                    .productsList.value.data?.products?[i]),
                            child: MenuWidget(
                                size: size,
                                homeController: controller,
                                index: i),
                          );
                        }),
                  ),
                ],
              ),
      ),
    );
  }
}

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    super.key,
    required this.size,
    required this.homeController,
    required this.index,
  });
  final int index;
  final Size size;
  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.r),
      child: Container(
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
            border: Border.all(width: 1.r),
            borderRadius: BorderRadius.circular(12.0.r)),
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: size.width,
                  height: 160.h,
                  child: Image(
                    image: NetworkImage(ApiUrl.baseUrl +
                        homeController.productsList.value.data!.products![index]
                            .productPhoto
                            .toString()),
                    fit: BoxFit.cover,
                  ),
                ),
                const Positioned(
                  bottom: 15,
                  right: 15,
                  child: Icon(
                    Icons.favorite_rounded,
                    color: Colors.grey,
                    size: 32,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              homeController.productsList.value.data?.products?[index].name
                      .toString() ??
                  "",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              "\$ ${homeController.productsList.value.data?.products?[index].price.toString()}",
              style: TextStyle(
                fontSize: 14.sp,
              ),
            ),
            // const SizedBox(
            //   height: 8,
            // ),
            Text(
              homeController
                      .productsList.value.data?.products?[index].description ??
                  "",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14.sp,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            // Row(
            //   children: [
            //     Container(
            //       decoration: BoxDecoration(
            //           color: textFieldColor,
            //           borderRadius: BorderRadius.circular(3)),
            //       child: const Padding(
            //         padding: EdgeInsets.all(5.0),
            //         child: Icon(
            //           Icons.star,
            //           color: Colors.yellow,
            //           size: 16,
            //         ),
            //       ),
            //     ),
            //     const SizedBox(
            //       width: 8,
            //     ),
            //     Container(
            //       decoration: BoxDecoration(
            //           color: textFieldColor,
            //           borderRadius: BorderRadius.circular(3)),
            //       child: Padding(
            //         padding: const EdgeInsets.all(5.0),
            //         child: Text(
            //           homeController
            //                   .productsList.value.data?.products?[index].price
            //                   .toString() ??
            //               "",
            //           style: const TextStyle(
            //             fontSize: 14,
            //           ),
            //         ),
            //       ),
            //     ),
            //     const SizedBox(
            //       width: 8,
            //     ),
            //     Container(
            //       decoration: BoxDecoration(
            //           color: textFieldColor,
            //           borderRadius: BorderRadius.circular(3)),
            //       child: Padding(
            //         padding: const EdgeInsets.all(5.0),
            //         child: Text(
            //           homeController
            //                   .productsList.value.data?.products?[index].type
            //                   .toString() ??
            //               "",
            //           style: const TextStyle(
            //             fontSize: 14,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
