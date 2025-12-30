import 'package:get/get.dart';
import 'package:shuleoneparents/Modals/SignUpModal.dart';
import '../../Models/ResponseModal.dart';
import '../AuthRepositories/AuthRepo.dart';

class AuthController extends GetxController implements GetxService {
final Authrepo authrepo;
AuthController({required this.authrepo});

bool _isLoading =false;
bool get isLoading =>_isLoading;

Future<Responsemodal>registration (RegisterModel registermodel) async {
  _isLoading =true;
  Response response=  await authrepo.registration(registermodel);
  print("Raw response body: ${response.body}");
  print("Status code: ${response.statusCode}");
  late Responsemodal responsemodal;
  if (response.statusCode==200){
    print("Raw response body: ${response.body}");
    print("Status code: ${response.statusCode}");
    //authrepo.saveUserToken(response.body['token']);
    //responsemodal=Responsemodal(true,response.body['token']);
    responsemodal=Responsemodal(true, response.statusText);

  }else{
    responsemodal=Responsemodal(false,response.statusText!);
  }
  _isLoading=false;
  update();
  return responsemodal;

}
}