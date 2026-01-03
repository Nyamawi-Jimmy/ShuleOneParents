import 'package:get/get.dart';
import 'package:shuleoneparents/Models/SignUpModal.dart';

import '../Models/ResponseModal.dart';
import '../ParentRepositories/StudentDashBoardRepo.dart';
import '../StudentRepositories/MainExamsRepo.dart';
import '../StudentRepositories/StudentCodingRepositories.dart';

class Studentscodingcontroller extends GetxService {
  final Studentcodingrepositories studentcodingrepositories;

  Studentscodingcontroller({required this.studentcodingrepositories});

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<Responsemodal> getstudentcoding(int studentid) async {
    _isLoading = true;
    Response response = await studentcodingrepositories.getstudentcoding(studentid);
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
