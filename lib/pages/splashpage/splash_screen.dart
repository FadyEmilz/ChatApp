import 'package:chatapp/controllers/splash_controller.dart';
import 'package:chatapp/core/routes.dart';
import 'package:chatapp/providers/users_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SplashController controller ;
  var user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    controller = SplashController();
    
    Future.delayed(Duration(seconds: 3), (){
      if(user == null){
        Navigator.pushReplacementNamed(context, RoutesNames.loginPageName);

      }
      else {
        Provider.of<UsersProvider>(context,listen: false).getData();
        Navigator.pushReplacementNamed(context, RoutesNames.homePageName);
      }

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Image.asset("assets/images/icon.png"),
        ),
      ),
    );
  }
}
