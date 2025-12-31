import 'package:get/get.dart';
import 'package:shuleoneparents/Models/SignUpModal.dart';

import '../Models/ResponseModal.dart';
import '../StudentRepositories/MainExamsRepo.dart';

class Studentliveclassescontroller extends GetxService {
  final Mainexamsrepo mainexamsrepo;

  Studentliveclassescontroller({required this.mainexamsrepo});

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<Responsemodal> studentliveclasses() async {
    _isLoading = true;
    Response response = await mainexamsrepo.studentliveclasses();
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
