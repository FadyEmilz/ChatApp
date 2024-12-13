import 'package:chatapp/providers/users_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class EditController{
  var db = FirebaseFirestore.instance;
  editUserName({required String newName, required BuildContext context }){
    Map<String, dynamic> dataToUpdate = {
      "Name" : newName
    };
    db.collection("users").doc(Provider.of<UsersProvider>(context,listen: false).userId).update(dataToUpdate);

  }

}

