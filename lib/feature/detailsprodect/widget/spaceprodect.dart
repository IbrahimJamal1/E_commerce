import 'package:flutter/material.dart';

Widget spaceprodect(
  final String? material,
  final String? weight,
  final String? waterproo,
  final String? origin,
  final String? sku,
) {
  return Container(
    margin: EdgeInsets.only(right: 30, left: 30),
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Material",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight(300)),
            ),
            Spacer(),
            Expanded(
              child: Text(
                material.toString(),
                softWrap: true,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight(400)),
              ),
            ),
          ],
        ),

        SizedBox(height: 15),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Weight",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight(300)),
            ),
            Spacer(),
            Expanded(
              child: Text(
                weight.toString(),
                softWrap: true,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight(400)),
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Waterproof",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight(300)),
            ),
            Spacer(),
            Expanded(
              child: Text(
                waterproo.toString(),
                softWrap: true,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight(400)),
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Origin",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight(300)),
            ),
            Spacer(),
            Expanded(
              child: Text(
                origin.toString(),
                softWrap: true,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight(400)),
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "SKU",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight(300)),
            ),
            Spacer(),
            Expanded(
              child: Text(
                sku.toString(),
                softWrap: true,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight(400)),
              ),
            ),
          ],
        ),
        SizedBox(height: 30),
      ],
    ),
  );
}
