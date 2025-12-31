import 'package:get/get.dart';
import 'package:shuleoneparents/Data/Api/apiclient.dart';
import 'package:shuleoneparents/Utils/AppConstants.dart';

class Studentdashboardrepo {
  final ApiClient apiClient;

  Studentdashboardrepo({required this.apiClient});

  Future<Response> getstudentsfeebalance(int studentid) async {
    final url = AppConstants.PARENT_STUDENT_GET_FEEBALANCE(studentid); // dynamic URL
    return await apiClient.getData(url);
  }

  Future<Response> getparentstudentmainexams(int studentid) async {
    final url = AppConstants.PARENT_MAIN_EXAMS(studentid); // dynamic URL
    return await apiClient.getData(url);
  }
  Future<Response> getparentStudentPerformance(int examId) async {
    final url = AppConstants.PARENT_EXAM_PERFORMANCE(examId); // dynamic URL
    return await apiClient.getData(url);
  }
  Future<Response> getparentassignment(int studentid) async {
    final url = AppConstants.PARENT_ASSIGNMENTS(studentid); // dynamic URL
    return await apiClient.getData(url);
  }

  Future<Response> getparentliveclasses(int studentid) async {
    final url = AppConstants.PARENT_LIVE_CLASSES(studentid); // dynamic URL
    return await apiClient.getData(url);
  }
}