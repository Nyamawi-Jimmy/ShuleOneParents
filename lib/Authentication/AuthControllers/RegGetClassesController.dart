import 'package:get/get.dart';

import '../../Models/ResponseModal.dart';
import '../AuthRepositories/nextAdmRepo.dart';

class Reggetclassescontroller extends GetxService {
  final Nextadmrepo nextclassrepo;
  Reggetclassescontroller({required this.nextclassrepo});

  bool _isLoading =false;
  bool get isLoading =>_isLoading;

  Future<Responsemodal>reggetclasses () async {
    _isLoading =true;
    Response response=  await nextclassrepo.reggetclasses();
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