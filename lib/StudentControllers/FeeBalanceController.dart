import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shuleoneparents/Models/ResponseModal.dart';

import '../Authentication/AuthControllers/LoginController.dart';
import '../Authentication/AuthControllers/ParentControler.dart';
import '../Models/StudentFeeBAlanceMOdel.dart';
import '../ParentControllers/ParentStudentFeeBalanceController.dart';
import 'StudentFeeBAlanceController.dart';

class FeeBalanceController extends GetxController {
  StudentFeeBalance? balance;
  bool isLoading = false;

  Future<void> loadBalance() async {
    isLoading = true;
    update();

    final parentController = Get.find<ParentController>();
    Responsemodal responsemodal;


    if (parentController.isParent) {
      // ✅ PARENT FLOW
      final controller = Get.find<Parentstudentfeebalancecontroller>();
      final childId = parentController.selectedChildId;
      responsemodal = await controller.getstudentsfeebalance(childId!);
    } else {
      // ✅ USER FLOW
      final controller = Get.find<Studentfeebalancecontroller>();
      responsemodal = await controller.getstudentfeebalance();
    }

    if (responsemodal.isSuccess) {
      final List data = jsonDecode(responsemodal.message);
      if (data.isNotEmpty) {
        balance = StudentFeeBalance.fromJson(data.first);
      }
    }

    isLoading = false;
    update();
  }
}
