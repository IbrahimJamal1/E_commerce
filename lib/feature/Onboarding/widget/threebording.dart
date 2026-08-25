import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget threeboarding() {
  return Container(
    alignment: Alignment.center,
    margin: EdgeInsets.only(left: 32, right: 32, top: 40, bottom: 40),
    color: const Color(0x00eff6ff),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "🔒",
          style: TextStyle(fontSize: 96, fontWeight: FontWeight(400)),
        ),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            textAlign: TextAlign.center,
            "Secure & Easy Payments",
            style: TextStyle(fontWeight: FontWeight(800), fontSize: 26),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            "Shop with confidence using end-to-end encrypted payments and buyer protection.",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight(400), fontSize: 15),
          ),
        ),
        SizedBox(height: 200),
      ],
    ),
  );
}
