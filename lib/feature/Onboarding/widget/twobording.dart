import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget twoboarding() {
  return Container(
    alignment: Alignment.center,
    margin: EdgeInsets.only(left: 32, right: 32, top: 40, bottom: 40),
    color: const Color(0x00eff6ff),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("⚡", style: TextStyle(fontSize: 96, fontWeight: FontWeight(400))),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            textAlign: TextAlign.center,
            "Lightning Fast Delivery",
            style: TextStyle(fontWeight: FontWeight(800), fontSize: 26),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            "Get your orders delivered same-day or next-day with real-time tracking.",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight(400), fontSize: 15),
          ),
        ),
        SizedBox(height: 200),
      ],
    ),
  );
}
