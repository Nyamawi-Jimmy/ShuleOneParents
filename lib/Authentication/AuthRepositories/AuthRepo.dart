import 'package:get/get.dart';
import 'package:shuleoneparents/Data/Api/apiclient.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shuleoneparents/Models/LoginModel.dart';
import 'package:shuleoneparents/Models/SignUpModal.dart';
import 'package:shuleoneparents/Utils/AppConstants.dart';

class Authrepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  Authrepo({required this.apiClient,required this.sharedPreferences});

  Future<Response>registration(RegisterModel registermodel) async {
   return await apiClient.postData(AppConstants.REGISTER, registermodel.toJson());
  }

  Future<Response>signin(LoginModel loginmodel) async {
    return await apiClient.postData(AppConstants.LOGIN, loginmodel.toJson());
  }

  saveUserToken(String token) async {
    apiClient.token=token;
    apiClient.UpadaeHeader(token);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }
}