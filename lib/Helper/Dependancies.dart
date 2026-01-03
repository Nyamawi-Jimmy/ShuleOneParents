import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shuleoneparents/Authentication/AuthControllers/AuthController.dart';
import 'package:shuleoneparents/Authentication/AuthRepositories/AuthRepo.dart';
import 'package:shuleoneparents/Data/Api/apiclient.dart';
import 'package:shuleoneparents/Utils/AppConstants.dart';
import '../Authentication/AuthControllers/LoginController.dart';
import '../Authentication/AuthControllers/ParentControler.dart';
import '../Authentication/AuthControllers/RegGetClassesController.dart';
import '../Authentication/AuthControllers/getNetAdmController.dart';
import '../Authentication/AuthRepositories/nextAdmRepo.dart';
import '../ParentControllers/ParentAssignmentcontroller.dart';
import '../ParentControllers/ParentLiveClassesController.dart';
import '../ParentControllers/ParentMainExamsController.dart';
import '../ParentControllers/ParentStudentFeeBalanceController.dart';
import '../ParentControllers/ParentStudentPerormanceController.dart';
import '../ParentRepositories/StudentDashBoardRepo.dart';
import '../StudentControllers/GetStudentsPerformanceController.dart';
import '../StudentControllers/MainExamsController.dart';
import '../StudentControllers/ResourcesAllBooksController.dart';
import '../StudentControllers/ResourcesGenresControllers.dart';
import '../StudentControllers/StudentAssignmentsController.dart';
import '../StudentControllers/StudentFeeBAlanceController.dart';
import '../StudentControllers/StudentLIveClassesController.dart';
import '../StudentControllers/StudentsCodingController.dart';
import '../StudentRepositories/MainExamsRepo.dart';
import '../StudentRepositories/ResourcesRepositories.dart';
import '../StudentRepositories/StudentCodingRepositories.dart';

Future <void> init() async{

  final sharedPreferences =await SharedPreferences.getInstance();
  Get.lazyPut(()=>sharedPreferences);
  Get.lazyPut(()=>ApiClient(appBaseurl: AppConstants.BASE_URL));
  Get.lazyPut(()=>Authrepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(()=>Nextadmrepo(apiClient: Get.find()));
  Get.lazyPut(()=>Authrepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(()=>Mainexamsrepo(apiClient: Get.find()));
  Get.lazyPut(()=>Studentdashboardrepo(apiClient: Get.find()));
  Get.lazyPut(()=>Studentcodingrepositories(apiClient: Get.find()));
  Get.lazyPut(()=>ResourcesStudentsrepositories(apiClient: Get.find()));


  Get.lazyPut(()=>Logincontroller(authrepo: Get.find()));
  Get.lazyPut(()=>AuthController(authrepo: Get.find()));
  Get.lazyPut(()=>Getnetadmcontroller(nextadmrepo: Get.find()));
  Get.lazyPut(()=>Reggetclassescontroller(nextclassrepo: Get.find()));
  Get.lazyPut(()=>ParentController());
  Get.lazyPut(()=>Mainexamscontroller(mainexamsrepo: Get.find()));
  Get.lazyPut(()=>Studentfeebalancecontroller(mainexamsrepo: Get.find()));
  Get.lazyPut(()=>Getstudentsperformancecontroller(mainexamsrepo: Get.find()));
  Get.lazyPut(()=>Parentstudentfeebalancecontroller(studentdashboardrepo: Get.find()));
  Get.lazyPut(()=>Parentstudentperormancecontroller(studentdashboardrepo: Get.find()));
  Get.lazyPut(()=>Parentmainexamscontroller(studentdashboardrepo: Get.find()));
  Get.lazyPut(()=>Parentassignmentcontroller(studentdashboardrepo: Get.find()));
  Get.lazyPut(()=>Studentassignmentscontroller(mainexamsrepo: Get.find()));
  Get.lazyPut(()=>Studentliveclassescontroller(mainexamsrepo: Get.find()));
  Get.lazyPut(()=>Parentliveclassescontroller(studentdashboardrepo: Get.find()));
  Get.lazyPut(()=>Studentscodingcontroller(studentcodingrepositories: Get.find()));
  Get.lazyPut(()=>Resourcesgenrescontrollers(resourcesStudentsrepositories: Get.find()));
  Get.lazyPut(()=>Resourcesallbookscontroller(resourcesStudentsrepositories: Get.find()));




}