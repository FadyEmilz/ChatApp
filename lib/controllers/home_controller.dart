import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeController{
var userAuth = FirebaseAuth.instance.currentUser;
var db = FirebaseFirestore.instance;

List<Map<String, dynamic>> chatroomsList = [];

getChatrooms(){
  db.collection("chatrooms").get().then((snapshot){
    for(var i in snapshot.docs){
      chatroomsList.add(i.data()) ;
    }

  });
}

}