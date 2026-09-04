import 'package:flutter/material.dart';

// ignore: strict_top_level_inference
Widget desprodect(final des) {
  return Container(
    margin: EdgeInsets.only(right: 30, left: 30, bottom: 30),

    child: Text(
      des,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight(300)),
    ),
  );
}
