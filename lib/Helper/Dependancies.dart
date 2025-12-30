import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shuleoneparents/Authentication/AuthControllers/AuthController.dart';
import 'package:shuleoneparents/Authentication/AuthRepositories/AuthRepo.dart';
import 'package:shuleoneparents/Data/Api/apiclient.dart';
import 'package:shuleoneparents/Utils/AppConstants.dart';

import '../Authentication/AuthControllers/RegGetClassesController.dart';
import '../Authentication/AuthControllers/getNetAdmController.dart';
import '../Authentication/AuthRepositories/nextAdmRepo.dart';

Future <void> init() async{

  final sharedPreferences =await SharedPreferences.getInstance();
  Get.lazyPut(()=>sharedPreferences);
  Get.lazyPut(()=>ApiClient(appBaseurl: AppConstants.BASE_URL));
  Get.lazyPut(()=>Authrepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(()=>Nextadmrepo(apiClient: Get.find()));


  Get.lazyPut(()=>AuthController(authrepo: Get.find()));
  Get.lazyPut(()=>Getnetadmcontroller(nextadmrepo: Get.find()));
  Get.lazyPut(()=>Reggetclassescontroller(nextclassrepo: Get.find()));



}