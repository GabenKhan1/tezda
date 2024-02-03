import 'package:get/get.dart';
import 'package:flutter_tezda_commerce_app/data/providers/user_provider.dart';

import '../../data/models/product_model.dart';

class HomeController extends GetxController {
  final UserProvider _userProvider = UserProvider();
  final sliderImages = [
    "assets/images/slide_1.jpg",
    "assets/images/slide_3.jpg",
    "assets/images/slide_1.jpg",
    "assets/images/slide_3.jpg"
  ];

  RxString onErrorMessage = "".obs;

  final _isLoading = true.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(value) => _isLoading.value = value;
  Rx<ProductModel> productsList = ProductModel().obs;

  @override
  void onInit() {
    getProduts();
    super.onInit();
  }

  void getProduts() async {
    _isLoading.value = true;
    productsList.value =
        await _userProvider.getProducts("657fe179750cb23790c60832");
    _isLoading.value = false;
  }

  onError(String message) {
    _isLoading.value = false;
    onErrorMessage.value = message;
  }
}
