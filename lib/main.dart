import 'package:e_commerce/feature/Onboarding/onbord.dart';
import 'package:e_commerce/feature/auth/login/cubit/login_cubit.dart';
import 'package:e_commerce/feature/auth/login/login.dart';
import 'package:e_commerce/feature/auth/register/cubit/register_cubit.dart';
import 'package:e_commerce/feature/auth/register/register.dart';
import 'package:e_commerce/feature/checkout/checkout.dart';
import 'package:e_commerce/feature/home/home.dart';
import 'package:e_commerce/feature/mycart/mycart.dart';
import 'package:e_commerce/feature/orderstate/orderstate.dart';
import 'package:e_commerce/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
        BlocProvider<RegisterCubit>(create: (context) => RegisterCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      routes: {
        'onbord': (context) => Onbording(),
        'login': (context) => Login(),
        'register': (context) => Register(),
        'home': (context) => Home(),
        'mycart': (context) => Mycart(),
        'checkout': (context) => Checkout(),
        'orderstate': (context) => OrderState(),
      },

      home: user != null ? Home() : Onbording(),
    );
  }
}
