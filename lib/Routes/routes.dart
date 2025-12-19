import 'package:flutter/cupertino.dart';
import '../Authentication/ResetPasswordPage.dart';
import '../Authentication/Signin.dart';
import '../Authentication/Signup.dart';
import '../MainDashBoardPage/MainDashBoardPage.dart';
import '../ParentsPages/CommunicationPages.dart';
import '../ParentsPages/ParentDashBoardPage.dart';
import '../ParentsPages/ParentsHomePage.dart';
import '../ParentsPages/ResourcesPage.dart';
import '../StudentProfiles/studentprofiles.dart';


class RouteHelper{
  static  const String signup="/signup";
  static  const String signin="/signin";
  static  const String resetpasswordpage="/resetpasswordpage";
  static  const String maindashboardpage="/maindashboardpage";
  static  const String studentprofiles="/studentprofiles";
  static  const String parentdashboardpage="/parentdashboardpage";
  static  const String communicationpages="/communicationpages";
  static  const String parenthomepage="/parenthomepage";
  static  const String resourcespage="/resourcespage";


  static Map<String,WidgetBuilder> getRoutes(){
    return{
      signin:(context)=> const Signin(),
      signup:(context)=> const SignUp(),
      resetpasswordpage:(context)=>const Resetpasswordpage(),
      maindashboardpage:(context)=>const Maindashboardpage(),
      studentprofiles:(context)=>const Studentprofiles(),
      parentdashboardpage:(context)=>const Parentdashboardpage(),
      communicationpages:(context)=>const Communicationpages(),
      parenthomepage:(context)=>const Parentshomepage(),
      resourcespage:(context)=>const Resourcespage(),



    };
  }
}