import 'package:chatapp/core/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupController{
  Future<void> createAccount({required BuildContext context ,required String email,required String password,required String name,required String county}) async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      Fluttertoast.showToast(msg: "Account create",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM
      );
      var userId = FirebaseAuth.instance.currentUser!.uid;
      var db = FirebaseFirestore.instance;

      Map<String,dynamic> data = {
        "Name" : name,
        "country" : county,
        "email" : email,
        "id": userId.toString()
      };
      try{await db.collection("users").doc(userId.toString()).set(data);}
      catch(e){
        print(e);
      }
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