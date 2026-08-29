import 'package:flutter/material.dart';

Color getCategoryColor(String category) {
  switch (category) {
    case "Shoes":
      return Colors.amberAccent;

    case "Tech":
      return Colors.blueAccent;

    case "Fashion":
      return Colors.pinkAccent;

    case "Home":
      return Colors.greenAccent;

    case "Beauty":
      return Colors.purpleAccent;

    case "Sports":
      return Colors.orangeAccent;

    case "Books":
      return Colors.brown;

    case "Toys":
      return Colors.redAccent;

    default:
      return Colors.grey;
  }
}