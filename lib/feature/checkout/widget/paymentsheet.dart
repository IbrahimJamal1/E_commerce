import 'dart:io';
import 'package:e_commerce/core/service/imagepaker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Paymentsheet extends StatefulWidget {
  const Paymentsheet({super.key});

  @override
  State<Paymentsheet> createState() => _PaymentsheetState();
}

class _PaymentsheetState extends State<Paymentsheet> {
  XFile? paymentImage;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () async {
            final XFile? image = await paymentimage();

            if (image != null) {
              setState(() {
                paymentImage = image;
              });
            }
          },
          child: Container(
            margin: const EdgeInsets.all(0),
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(30),
            ),
            child: paymentImage == null
                ? const Center(
                    child: Text(
                      "Upload image sheet payment",
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.file(
                      File(paymentImage!.path),
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
        ),
        SizedBox(height: 30),

        SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.all(15),
            width: 400,
            height: 300,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Price Summary",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight(800)),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text("Subtotal"),
                    Spacer(),
                    Text(
                      "\$547.99",
                      style: TextStyle(fontWeight: FontWeight(600)),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text("Discount (15%)"),
                    Spacer(),
                    Text(
                      "\$-82.20",
                      style: TextStyle(
                        fontWeight: FontWeight(600),
                        color: const Color(0xFF08F410),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text("Shipping"),
                    Spacer(),
                    Text("free", style: TextStyle(fontWeight: FontWeight(600))),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text("Tax"),
                    Spacer(),
                    Text(
                      "\$43.84",
                      style: TextStyle(fontWeight: FontWeight(600)),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight(800),
                      ),
                    ),
                    Spacer(),
                    Text(
                      "\$43.84",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight(800),
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
