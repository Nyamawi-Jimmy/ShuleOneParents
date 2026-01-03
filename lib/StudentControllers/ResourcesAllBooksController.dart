import 'package:get/get.dart';
import 'package:shuleoneparents/Models/SignUpModal.dart';

import '../Models/ResponseModal.dart';
import '../ParentRepositories/StudentDashBoardRepo.dart';
import '../StudentRepositories/MainExamsRepo.dart';
import '../StudentRepositories/ResourcesRepositories.dart';
import '../StudentRepositories/StudentCodingRepositories.dart';

class Resourcesallbookscontroller extends GetxService {
  final ResourcesStudentsrepositories resourcesStudentsrepositories;

  Resourcesallbookscontroller({required this.resourcesStudentsrepositories});

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<Responsemodal> getresourcesallbooks() async {
    _isLoading = true;
    Response response = await resourcesStudentsrepositories.getresourcesallbooks();
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
