import 'package:get/get.dart';
import 'package:shuleoneparents/Models/SignUpModal.dart';

import '../Models/ResponseModal.dart';
import '../ParentRepositories/StudentDashBoardRepo.dart';
import '../StudentRepositories/MainExamsRepo.dart';
import '../StudentRepositories/ResourcesRepositories.dart';
import '../StudentRepositories/StudentCodingRepositories.dart';

class Resourcesgenrescontrollers extends GetxService {
  final ResourcesStudentsrepositories resourcesStudentsrepositories;

  Resourcesgenrescontrollers({required this.resourcesStudentsrepositories});

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<Responsemodal> getstudentcoding() async {
    _isLoading = true;
    Response response = await resourcesStudentsrepositories.getresourcesgenres();
    late Responsemodal responsemodal;
    if (response.statusCode == 200) {
      responsemodal = Responsemodal(true, response.body);
    } else {

      responsemodal = Responsemodal(false, response.statusText!);
    }
    _isLoading = false;
    return responsemodal;
  }
}
