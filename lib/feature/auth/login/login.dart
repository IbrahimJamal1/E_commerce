import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(29),

        child: Column(
          children: [
            Center(
              child: Image.asset("images/iconlogin.png", width: 50, height: 50),
            ),

            SizedBox(height: 24),
            
            Text(
              "Welcome Back",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight(800)),
            ),
          ],
        ),
      ),
    );
  }
}
