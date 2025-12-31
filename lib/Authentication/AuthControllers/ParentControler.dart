import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../Models/ChildrenModel.dart';

class ParentController extends GetxController {
  // ───── Basic user info ─────
  int? id;
  String username = "";
  String firstName = "";
  String secondName = "";
  String image = "";
  String currentForm = "";

  // ───── School ─────
  SchoolModel? school;

  // ───── Roles & preferences ─────
  List<String> roles = [];
 // String subscription = "";

  // ───── Parent-only data ─────
  List<ChildModel> children = [];

  void setParentData(Map<String, dynamic> body) {
    id = body['id'];
    username = body['username'] ?? "";
    firstName = body['firstName'] ?? "";
    secondName = body['secondName'] ?? "";
    image = body['image'] ?? "";
    currentForm = body['currentForm'] ?? "";

    // roles
    roles = List<String>.from(body['roles'] ?? []);

   // subscription = body['subscription'] ?? "";

    // school
    if (body['school'] != null) {
      school = SchoolModel.fromJson(body['school']);
    }

    update();
  }

  /// Save children ONLY for ROLE_PARENT
  void setChildren(List<dynamic> data) {
    children = data.map((e) => ChildModel.fromJson(e)).toList();
    update();
  }

  String get fullName => "$firstName $secondName";

  bool get isParent => roles.contains("ROLE_PARENT");
  bool get isUser => roles.contains("ROLE_USER");
  ChildModel? selectedChild;

  /// Save selected child
  void selectChild(ChildModel child) {
    selectedChild = child;
    update();
  }
  int? get selectedChildId => selectedChild?.id;

}
