import 'package:chatapp/controllers/signup_controller.dart';
import 'package:chatapp/core/routes.dart';
import 'package:chatapp/pages/signuppage/widgets/already_have.dart';
import 'package:chatapp/pages/signuppage/widgets/big_text.dart';
import 'package:chatapp/pages/signuppage/widgets/custom_button.dart';
import 'package:chatapp/providers/users_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  GlobalKey<FormState> myKey = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController country = TextEditingController();
  late SignupController controller;
  @override
  void initState() {
    controller = SignupController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Form(
      key: myKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Center(
                    child: Image.asset(
                      "assets/images/icon.png",
                      width: 150,
                      height: 150,
                    ),
                  )),
            ),
            Column(
              children: [
                BigText(text: "Sign Up"),
                SizedBox(height: 15,),
                TextFormField(
                  controller: email,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "please fill the field";
                    } else if (val.length < 5) {
                      return "minim char is 5";
                    }
                  },
                  decoration: InputDecoration(
                      label: Text("Email"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: true,
                  controller: password,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "please fill the field";
                    } else if (val.length < 5) {
                      return "minim char is 5";
                    }
                  },
                  decoration: InputDecoration(
                      label: Text("Password"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: name,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "please fill the field";
                    } else if (val.length < 5) {
                      return "minim char is 5";
                    }
                  },
                  decoration: InputDecoration(
                      label: Text("Name"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: country,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "please fill the field";
                    } else if (val.length < 5) {
                      return "minim char is 5";
                    }
                  },
                  decoration: InputDecoration(
                      label: Text("Country"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                )],
            ),
            Column(
              children: [
                CustomButton(
                  text: "Signup",
                  onClick: () async {
                    if (myKey.currentState!.validate()) {

                      controller.createAccount(
                          email: email.text,
                          password: password.text,
                          context: context, name: name.text, county: country.text);

                    }
                  },
                ),
                AlreadyHave(
                    already: "Already HAev Account ?",
                    cliclableText: "Login",
                    onClick: () {
                      Navigator.pushReplacementNamed(
                          context, RoutesNames.loginPageName);
                    })
              ],
            )
          ],
        ),
      ),
    )));
  }
}
