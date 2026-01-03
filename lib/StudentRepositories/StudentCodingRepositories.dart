import 'package:get/get.dart';
import 'package:shuleoneparents/Data/Api/apiclient.dart';
import 'package:shuleoneparents/Utils/AppConstants.dart';

class Studentcodingrepositories {
  final ApiClient apiClient;

  Studentcodingrepositories({required this.apiClient,});

  Future<Response> getstudentcoding(int languageid) async {
    final url = AppConstants.STUDENT_CODING(languageid); // dynamic URL
    return await apiClient.getData(url);
  }

}