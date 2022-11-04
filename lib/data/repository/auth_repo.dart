import 'package:food_delivery_app/data/api/api_client.dart';
import 'package:food_delivery_app/models/signup_body_model.dart';
import 'package:food_delivery_app/utilities/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPrefernces;
  AuthRepo({
    required this.apiClient,
    required this.sharedPrefernces,
  });
  Future<Response> registration(SignUpBody signUpBody) async {
    return await apiClient.postData(
        AppConstants.REGISTRATION_URI, signUpBody.toJson());
  }

  Future<Response> login(String email, String password) async {
    return await apiClient.postData(
        AppConstants.REGISTRATION_URI, {"email": email, "password": password});
  }

  bool userLoggedIn() {
    return sharedPrefernces.containsKey(AppConstants.TOKEN);
  }

  Future<String> getUserToken() async {
    return sharedPrefernces.getString(AppConstants.TOKEN) ?? "None";
  }

  Future<bool> saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPrefernces.setString(AppConstants.TOKEN, token);
  }

  Future<void> saveUserNumberAndPassword(String number, String password) async {
    try {
      await sharedPrefernces.setString(AppConstants.PHONE, number);
      await sharedPrefernces.setString(AppConstants.PASSSWORD, password);
    } catch (e) {
      throw e;
    }
  }

  bool clearSharedData() {
    sharedPrefernces.remove(AppConstants.TOKEN);
    sharedPrefernces.remove(AppConstants.PHONE);
    sharedPrefernces.remove(AppConstants.PASSSWORD);
    apiClient.token = '';
    apiClient.updateHeader('');
    return true;
  }
}
