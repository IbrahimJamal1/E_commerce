import 'package:flutter/material.dart';

// ignore: strict_top_level_inference
Widget headprofilepage(user) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        width: double.infinity,
        height: 130,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0D47A1), Color(0xFF1976D2), Color(0xFF64B5F6)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),

      Row(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.all(20),
              width: 100,
              height: 100,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: ClipOval(
                child: Image.network(user.pathimage, fit: BoxFit.cover),
              ),
            ),
          ),

          Column(
            children: [
              Text(
                user.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight(600),
                  color: Colors.white,
                ),
              ),
              Text(
                user.email,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight(300),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
      SizedBox(height: 30),
    ],
  );
}
