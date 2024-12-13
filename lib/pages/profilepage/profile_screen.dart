import 'package:chatapp/core/routes.dart';
import 'package:chatapp/pages/profilepage/widgets/userprofile_widget.dart';
import 'package:chatapp/providers/users_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic>? userData = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UsersProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profile"),
      ),
      body: Center(
        child: UserprofileWidget(
          username: userProvider.userName,
          email: userProvider.userEmail,
          country: userProvider.userCountry,
          onEditProfile: () {
            Navigator.pushNamed(context, RoutesNames.editPageName);
          },
        ),
      ),
    );
  }
}
