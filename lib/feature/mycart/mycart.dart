import 'package:e_commerce/feature/mycart/widget/mycartCard.dart';
import 'package:flutter/material.dart';

class Mycart extends StatelessWidget {
  const Mycart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      appBar: AppBar(
        title: Text(
          "My Cart",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight(800)),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 30),
            child: Text(
              "5 itemCount",
              style: TextStyle(color: Colors.blueAccent),
            ),
          ),
        ],
      ),
      body: Mycartcard(),

      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 50, left: 20, right: 20, top: 10),
        width: double.infinity,
        height: 55,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: const Text(
            "Proceed To Checkout",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
