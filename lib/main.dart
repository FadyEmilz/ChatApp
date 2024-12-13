import 'package:chatapp/providers/users_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/myapp.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyAeh_1RY4qsxToGkfZD1RXPEti-WSNiaDc",
          appId: "1:362403698821:android:dd2e44abbafc9550e931ec",
          messagingSenderId: "362403698821",
          projectId: "chatapp-625a2"));
  runApp(ChangeNotifierProvider(create: (BuildContext context) {
    return UsersProvider();
  },
  child: const MyApp()));
}
