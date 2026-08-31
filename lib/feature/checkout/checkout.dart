import 'package:e_commerce/feature/checkout/widget/infoperson.dart';
import 'package:e_commerce/feature/checkout/widget/paymentsheet.dart';
import 'package:e_commerce/feature/checkout/widget/rowcheckstap.dart';
import 'package:flutter/material.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  int staps = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      appBar: AppBar(
        title: const Text(
          "Checkout",
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Row(
              children: [
                rowcheckstap(1, staps),

                Expanded(
                  child: Container(
                    height: 2,
                    color: staps >= 2 ? Colors.blue : Colors.grey,
                  ),
                ),

                rowcheckstap(2, staps),
              ],
            ),
            SizedBox(height: 60),
            //staps 1
            if (staps == 1) infoperson(),
            //staps 2
            if (staps == 2) Paymentsheet(),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 50, left: 20, right: 20, top: 10),
        width: double.infinity,
        height: 55,
        child: ElevatedButton(
          onPressed: () {
            if (staps == 1) {
              setState(() {
                staps = 2;
              });
            } else if (staps == 2) {
              Navigator.pushNamed(context, 'orderstate');
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Text(
            staps == 1 ? "Continue To Shipping" : "Order State",

            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
