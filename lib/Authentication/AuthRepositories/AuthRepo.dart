import 'package:get/get.dart';
import 'package:shuleoneparents/Data/Api/apiclient.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shuleoneparents/Modals/SignUpModal.dart';
import 'package:shuleoneparents/Utils/AppConstants.dart';

class Authrepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  Authrepo({required this.apiClient,required this.sharedPreferences});
  Future<Response>registration(RegisterModel registermodel) async {
   return await apiClient.postData(AppConstants.REGISTER, registermodel.toJson());
  }

  saveUserToken(String token) async {
    apiClient.token=token;
    apiClient.UpadaeHeader(token);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }
}