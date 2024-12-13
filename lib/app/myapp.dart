import 'package:chatapp/core/routes.dart';
import 'package:chatapp/pages/homepage/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: RoutesManagers.myRoutes,
      initialRoute: RoutesNames.splashPageName,
    );
  }
}
