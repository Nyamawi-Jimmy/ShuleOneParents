

import 'package:get/get_connect/connect.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

import '../../Utils/AppConstants.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;

  final String appBaseurl;
  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseurl}) {
    baseUrl = appBaseurl;
    timeout = const Duration(seconds: 5);

    token = AppConstants.TOKEN;
    _mainHeaders = {
      "Content-type": "application/json; charset=UTF-8",
      "Authorization": "Bearer $token",
    };
  }

  Future<Response> getData(String uri) async {
    try {
      return await get(uri, headers: _mainHeaders);
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(String uri, dynamic body) async {
    print(body.toString());
    try {
      final response = await post(uri, body, headers: _mainHeaders);
      print(response.toString());
      return response;
    } catch (e) {
      print(e.toString());
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
