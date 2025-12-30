import 'package:get/get.dart';
import 'package:shuleoneparents/Modals/SignUpModal.dart';
import '../../Models/ResponseModal.dart';
import '../AuthRepositories/AuthRepo.dart';
import '../AuthRepositories/nextAdmRepo.dart';

class Getnetadmcontroller extends GetxService {
  final Nextadmrepo nextadmrepo;
  Getnetadmcontroller({required this.nextadmrepo});

  bool _isLoading =false;
  bool get isLoading =>_isLoading;

  Future<Responsemodal>getnextadm () async {
    _isLoading =true;
    Response response=  await nextadmrepo.getnextadm();
    late Responsemodal responsemodal;
    if (response.statusCode==200){
      responsemodal=Responsemodal(true,response.body);

    }else{
      responsemodal=Responsemodal(false,response.statusText!);
    }
    _isLoading=false;
    return responsemodal;

  }
}