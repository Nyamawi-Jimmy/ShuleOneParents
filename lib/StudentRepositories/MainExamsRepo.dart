import 'package:get/get.dart';
import 'package:shuleoneparents/Data/Api/apiclient.dart';
import 'package:shuleoneparents/Utils/AppConstants.dart';

class Mainexamsrepo {
  final ApiClient apiClient;

  Mainexamsrepo({required this.apiClient,r});

  Future<Response>mainexamsdetails() async {
    return await apiClient.getData(AppConstants.STUDENT_GET_EXAMS);
  }
  Future<Response>getstudentfeebalance() async {
    return await apiClient.getData(AppConstants.STUDENT_GET_FEEBALANCE);
  }
  Future<Response> getStudentPerformance(int examId) async {
    final url = AppConstants.STUDENT_EXAM_PERFORMANCE(examId); // dynamic URL
    return await apiClient.getData(url);
  }


}