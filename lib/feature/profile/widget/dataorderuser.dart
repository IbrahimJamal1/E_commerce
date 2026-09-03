import 'package:flutter/material.dart';

Widget dataorder() {
  return Container(
    color: Colors.white,
    padding: EdgeInsets.all(30),
    child: Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Text(
                "Order",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight(300)),
              ),
              SizedBox(height: 10),
              Text(
                '4',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight(800)),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                "Rewards ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight(300)),
              ),
              SizedBox(height: 10),
              Text(
                '23.4k',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight(800)),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
