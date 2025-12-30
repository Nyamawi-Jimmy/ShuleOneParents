import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../Models/ChildrenModel.dart';

class ParentController extends GetxController {
  String firstName = "";
  String secondName = "";
  String image = "";

  List<ChildModel> children = [];

  void setParentData(Map<String, dynamic> body) {
    firstName = body['firstName'] ?? "";
    secondName = body['secondName'] ?? "";
    image = body['image'] ?? "";
    update();
  }

  void setChildren(List<dynamic> data) {
    children = data.map((e) => ChildModel.fromJson(e)).toList();
    update();
  }

  String get fullName => "$firstName $secondName";
}
