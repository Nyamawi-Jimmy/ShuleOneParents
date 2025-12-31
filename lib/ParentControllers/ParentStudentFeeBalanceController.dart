import 'package:get/get.dart';
import 'package:shuleoneparents/Models/SignUpModal.dart';

import '../Models/ResponseModal.dart';
import '../ParentRepositories/StudentDashBoardRepo.dart';
import '../StudentRepositories/MainExamsRepo.dart';

class Parentstudentfeebalancecontroller extends GetxService {
  final Studentdashboardrepo studentdashboardrepo;

  Parentstudentfeebalancecontroller({required this.studentdashboardrepo});

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<Responsemodal> getstudentsfeebalance(int Examid) async {
    _isLoading = true;
    Response response = await studentdashboardrepo.getstudentsfeebalance(Examid);
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
