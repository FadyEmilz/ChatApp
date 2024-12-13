import 'package:chatapp/controllers/login_controller.dart';
import 'package:chatapp/core/images_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/routes.dart';
import '../../providers/users_provider.dart';
import '../signuppage/widgets/already_have.dart';
import '../signuppage/widgets/big_text.dart';
import '../signuppage/widgets/custom_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginController controller;
  GlobalKey<FormState> myKey = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    controller = LoginController();
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
                BigText(text: "Login"),
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
              ],
            ),
            Column(
              children: [
                CustomButton(
                  text:  "Login",
                  onClick: () async {
                    if (myKey.currentState!.validate())  {

                     await controller.loginToAccount(context: context, email: email.text, password: password.text);


                    }
                  },
                ),
                AlreadyHave(
                    already: "Dont Have Account ?",
                    cliclableText: "Sign UP",
                    onClick: () {
                      Navigator.pushReplacementNamed(
                          context, RoutesNames.signUPPageName);
                    })
              ],
            )
          ],
        ),
      ),
    )));
  }
}
