import 'package:get/get.dart';
import 'package:shuleoneparents/Models/LoginModel.dart';
import 'package:shuleoneparents/Models/SignUpModal.dart';
import '../../Models/ResponseModal.dart';
import '../AuthRepositories/AuthRepo.dart';
import 'ParentControler.dart';

class   Logincontroller extends GetxController implements GetxService {
  final Authrepo authrepo;
  Logincontroller({required this.authrepo});

  bool _isLoading =false;
  bool get isLoading =>_isLoading;

  Future<Responsemodal>signin (LoginModel loginmodel) async {
    _isLoading =true;
    Response response=  await authrepo.signin(loginmodel);
    late Responsemodal responsemodal;
    if (response.statusCode==200){
      authrepo.saveUserToken(response.body['accessToken']);
      responsemodal=Responsemodal(true,response.body['accessToken']);

      final parentController = Get.find<ParentController>();

      List roles = response.body['roles'] ?? [];
      parentController.setParentData(response.body);
      if (roles.contains("ROLE_PARENT")) {
        responsemodal = Responsemodal(true, "ROLE_PARENT");
        parentController.setChildren(response.body['children']);
      } else {
        responsemodal = Responsemodal(true, "ROLE_USER");
      }
    }else{
      responsemodal=Responsemodal(false,response.statusText!);
    }
    _isLoading=false;
    update();
    return responsemodal;

  }
}