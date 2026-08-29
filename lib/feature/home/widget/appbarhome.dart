import 'package:e_commerce/feature/home/function/function.dart';
import 'package:e_commerce/feature/home/models/modelproduct.dart';
import 'package:e_commerce/feature/search/search.dart';
import 'package:flutter/material.dart';

AppBar appBarhome(context) {
  return AppBar(
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          selecttypetime(),
          style: TextStyle(fontWeight: FontWeight(300), fontSize: 16),
        ),
        Text("my name 👋", style: TextStyle(fontWeight: FontWeight(800))),
      ],
    ),
    actions: [
      Container(
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(20),
        ),
        child: IconButton(
          onPressed: ()async {
            await showSearch<ProductModel?>(
                  context: context,
                  delegate: Searchpage());
          },
          icon: Icon(Icons.search_rounded, size: 26),
        ),
      ),
      SizedBox(width: 15),
      Container(
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_outlined, size: 26),
            ),

            // Notification dot
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
