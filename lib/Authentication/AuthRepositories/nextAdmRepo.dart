import 'package:get/get.dart';
import 'package:shuleoneparents/Data/Api/apiclient.dart';
import 'package:shuleoneparents/Utils/AppConstants.dart';

class Nextadmrepo {
  final ApiClient apiClient;

  Nextadmrepo({required this.apiClient,r});

  Future<Response>getnextadm() async {
    return await apiClient.getData(AppConstants.GET_NEXT_ADM);
  }
  Future<Response>reggetclasses() async {
    return await apiClient.getData(AppConstants.REG_GET_CLASSES);
  }
}