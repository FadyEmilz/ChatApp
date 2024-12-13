import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../core/routes.dart';

class LoginController {
  void navigateToSignUp(BuildContext context){
    Navigator.pushReplacementNamed(context, RoutesNames.signUPPageName);
  }
  Future<void> loginToAccount ({required BuildContext context ,required String email,required String password}) async {
   try{
     await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
     Fluttertoast.showToast(msg: "Welcome",
         toastLength: Toast.LENGTH_SHORT,
         gravity: ToastGravity.BOTTOM
     );
     Navigator.pushReplacementNamed(context, RoutesNames.splashPageName);
   }
   catch(ret){
     Fluttertoast.showToast(msg: "$ret",
         toastLength: Toast.LENGTH_SHORT,
         gravity: ToastGravity.BOTTOM

     );

   }
  }
}