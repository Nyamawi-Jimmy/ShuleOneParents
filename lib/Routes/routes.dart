import 'package:flutter/cupertino.dart';
import '../Authentication/ResetPasswordPage.dart';
import '../Authentication/Signin.dart';
import '../Authentication/Signup.dart';
import '../MainDashBoardPage/MainDashBoardPage.dart';
import '../ParentsPages/ParentDashBoardPage.dart';
import '../StudentProfiles/studentprofiles.dart';


class RouteHelper{
  static  const String signup="/signup";
  static  const String signin="/signin";
  static  const String resetpasswordpage="/resetpasswordpage";
  static  const String maindashboardpage="/maindashboardpage";
  static  const String studentprofiles="/studentprofiles";
  static  const String parentdashboardpage="/parentdashboardpage";


  static Map<String,WidgetBuilder> getRoutes(){
    return{
      signin:(context)=> const Signin(),
      signup:(context)=> const SignUp(),
      resetpasswordpage:(context)=>const Resetpasswordpage(),
      maindashboardpage:(context)=>const Maindashboardpage(),
      studentprofiles:(context)=>const Studentprofiles(),
      parentdashboardpage:(context)=>const Parentdashboardpage(),





    };
  }
}