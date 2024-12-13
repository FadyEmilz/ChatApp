import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UsersProvider extends ChangeNotifier{
  bool isLoading = false;
  String userName = "";
  String userEmail = "";
  String userCountry = "";
  String userId = "";

  var db = FirebaseFirestore.instance;

  getData(){
    var authUser = FirebaseAuth.instance.currentUser;
    db.collection("users").doc(authUser!.uid).get().then((snapshot){
      userName =  snapshot.data()?["Name"] ?? "";
      userEmail =  snapshot.data()?["email"] ?? "";
      userCountry =  snapshot.data()?["country"] ?? "";
      userId =  snapshot.data()?["id"] ?? "";

      notifyListeners();

    });
  }
  changeLoading(){
    if(isLoading == false){
      isLoading = true;
      notifyListeners();

    }
    else{
      isLoading = false;
      notifyListeners();
    }
  }

}