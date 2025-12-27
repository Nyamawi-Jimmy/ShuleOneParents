import 'package:get/get_connect/http/src/response/response.dart';

import '../../Models/LoginModel.dart';
import '../../Utils/AppConstants.dart';
import '../Api/apiclient.dart';

class AuthRepo {
  final ApiClient apiClient;

  AuthRepo({required this.apiClient});

  Future<Response> submitlogin(LoginModel loginModel) async {
    return await apiClient.postData(AppConstants.LOGIN, loginModel.toJson());
  }

}
