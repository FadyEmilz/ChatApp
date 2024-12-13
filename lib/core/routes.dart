import 'package:chatapp/pages/chatroompage/chatRoom_screen.dart';
import 'package:chatapp/pages/editprofilepage/editProfile_screen.dart';
import 'package:chatapp/pages/homepage/home_screen.dart';
import 'package:chatapp/pages/loginpage/login_page.dart';
import 'package:chatapp/pages/profilepage/profile_screen.dart';
import 'package:chatapp/pages/signuppage/signup_page.dart';
import 'package:chatapp/pages/splashpage/splash_screen.dart';
import 'package:flutter/cupertino.dart';

class RoutesManagers {
  static Map <String, WidgetBuilder> myRoutes = {
    RoutesNames.homePageName : (context) => HomeScreen(),
    RoutesNames.splashPageName : (context) => SplashScreen(),
    RoutesNames.loginPageName : (context) => LoginPage(),
    RoutesNames.signUPPageName : (context) => SignupPage(),
    RoutesNames.profilePageName : (context) => ProfileScreen(),
    RoutesNames.editPageName : (context) => EditProfileScreen(),

  };
}
class RoutesNames{
  static String homePageName =  "Home";
  static String splashPageName =  "Splash";
  static String loginPageName =  "Login";
  static String signUPPageName =  "SignUp";
  static String profilePageName =  "Profile";
  static String editPageName =  "Edit";
  static String chatRoomPageName =  "ChatRoom";
}
