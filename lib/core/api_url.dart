class ApiUrl {
  ApiUrl._();

  static const baseUrl = "https://server.codebreakers-fooddelivery.online";

  static const String userSignUpUrl = "$baseUrl/api/v1/user/signup";
  static const String userloginUrl = "$baseUrl/api/v1/user/login";
  static const String forgetPassword = "$baseUrl/api/v1/user/forgetpassword";
  static const String updateProfile = "$baseUrl/api/v1/user/updateuser";
  static const String forgetpassword = "$baseUrl/api/v1/user/forgetpassword";
  static const String getProductsbyId =
      "$baseUrl/api/v1/restaurant/get-single-restaurant-data-by-id";
}
