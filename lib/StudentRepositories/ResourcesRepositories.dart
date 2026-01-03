import 'package:get/get.dart';
import 'package:shuleoneparents/Data/Api/apiclient.dart';
import 'package:shuleoneparents/Utils/AppConstants.dart';

class ResourcesStudentsrepositories {
  final ApiClient apiClient;

  ResourcesStudentsrepositories({required this.apiClient,});

  Future<Response>getresourcesgenres() async {
    return await apiClient.getData(AppConstants.RESOURCE_GENRES);
  }
  Future<Response>getresourcesallbooks() async {
    return await apiClient.getData(AppConstants.RESOURCE_ALL_BOOKS);
  }

}