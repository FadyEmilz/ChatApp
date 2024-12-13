import 'package:chatapp/core/routes.dart';
import 'package:flutter/cupertino.dart';

class SplashController {
  void navigateToHome(BuildContext context){
    Navigator.pushReplacementNamed(context, RoutesNames.homePageName);
  }
  void navigateToLogin(BuildContext context){
    Navigator.pushReplacementNamed(context, RoutesNames.loginPageName);
  }
}