import 'package:e_commerce/feature/Onboarding/onbord.dart';
import 'package:e_commerce/feature/auth/login/login.dart';
import 'package:e_commerce/feature/auth/register/register.dart';
import 'package:e_commerce/feature/home/home.dart';
import 'package:e_commerce/feature/mycart/mycart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'onbord': (context) => Onbording(),
        'login': (context) => Login(),
        "register": (context) => Register(),
        'home': (context) => Home(),
        'mycart':(context) => Mycart()
      },
      home: Onbording(),
    );
  }
}
