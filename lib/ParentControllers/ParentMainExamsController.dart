import 'package:get/get.dart';
import 'package:shuleoneparents/Models/SignUpModal.dart';

import '../Models/ResponseModal.dart';
import '../ParentRepositories/StudentDashBoardRepo.dart';
import '../StudentRepositories/MainExamsRepo.dart';

class Parentmainexamscontroller extends GetxService {
  final Studentdashboardrepo studentdashboardrepo;

  Parentmainexamscontroller({required this.studentdashboardrepo});

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<Responsemodal> getparentstudentmainexams(int studentid) async {
    _isLoading = true;
    Response response = await studentdashboardrepo.getparentstudentmainexams(studentid);
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
