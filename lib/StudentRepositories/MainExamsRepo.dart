import 'package:get/get.dart';
import 'package:shuleoneparents/Data/Api/apiclient.dart';
import 'package:shuleoneparents/Utils/AppConstants.dart';

class Mainexamsrepo {
  final ApiClient apiClient;

  Mainexamsrepo({required this.apiClient,r});

  Future<Response>mainexamsdetails() async {
    return await apiClient.getData(AppConstants.STUDENT_GET_EXAMS);
  }
}