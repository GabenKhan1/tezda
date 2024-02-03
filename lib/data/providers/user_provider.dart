import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import '../../core/api_url.dart';
import '../../routes/app_routes.dart';
import '../models/signin_model.dart';
import '../models/product_model.dart';

class UserProvider {
  final dio = Dio();
  final box = GetStorage();

  Future<dynamic> signInCall(
      {required String email, required String password}) async {
    try {
      final response = await dio.post(ApiUrl.userloginUrl,
          options: Options(headers: <String, dynamic>{
            "Content-Type": "application/json; Charset=UTF-8 ",
            "Authorization": "Bearer  ${box.read("token")}",
          }),
          data: {
            "email": email,
            "password": password,
          });
      if (response.statusCode == 200) {
        return SignInModel.fromJson(response.data);
      } else {
        return response.data["message"];
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return e.response?.data["message"];
      } else {
        log(e.response.toString());
        rethrow;
      }
    }
  }

  signUpCall(
      {required String email,
      required String password,
      required String phoneNumber,
      required String fullName}) async {
    try {
      final response = await dio.post(ApiUrl.userSignUpUrl,
          options: Options(headers: <String, dynamic>{
            "Content-Type": "application/json; Charset=UTF-8 ",
            "Authorization": "Bearer ${box.read("token")}"
          }),
          data: {
            "email": email,
            "password": password,
            "phoneNumber": phoneNumber,
            "fullName": fullName
          });
      if (response.statusCode == 200) {
        box.write("token", response.data['token']);
        Get.offNamed(Routes.loginScreen);
      } else {
        return response.data["msg"];
      }
    } on DioException catch (e) {
      log(e.error.toString());
      rethrow;
    }
  }

  forgetPassword({required String email}) async {
    try {
      final response = await dio.patch(ApiUrl.forgetPassword,
          options: Options(headers: <String, dynamic>{
            "Content-Type": "application/json; Charset=UTF-8 ",
            "Authorization": "Bearer  ${box.read("token")}",
          }),
          data: {
            "email": email,
          });
      if (response.statusCode == 200) {}
    } on DioException catch (e) {
      log(e.response.toString());
      rethrow;
    }
  }

  updateProfile(
      {required String email,
      required String password,
      required String phoneNumber,
      required String fullName,
      File? imagefile}) async {
    try {
      final response = await dio.post(ApiUrl.userSignUpUrl,
          options: Options(headers: <String, dynamic>{
            "Content-Type": "application/json; Charset=UTF-8 ",
            "Authorization": "Bearer ${box.read("key")}"
          }),
          data: {
            "email": email,
            "password": password,
            "phoneNumber": phoneNumber,
            "fullName": fullName,
            "profilePhoto": await MultipartFile.fromFile(imagefile!.path,
                filename: 'image.png'),
          });
      if (response.statusCode == 200) {
      } else {
        return response.data["msg"];
      }
    } on DioException catch (e) {
      log(e.error.toString());
      rethrow;
    }
  }

  getProducts(String id) async {
    try {
      final response = await dio.get(
        ApiUrl.getProductsbyId,
        queryParameters: {"id": id},
        options: Options(headers: <String, dynamic>{
          "Content-Type": "application/json; Charset=UTF-8 ",
          "Authorization": "Bearer  ${box.read("token")}",
        }),
      );
      if (response.statusCode == 200) {
        return ProductModel.fromJson(response.data);
      } else {
        return response.data["msg"];
      }
    } on DioException catch (e) {
      log(e.error.toString());
      rethrow;
    }
  }
}
