import 'package:flutter/material.dart';

Widget infoperson() {
  return Container(
    margin: EdgeInsets.all(20),
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
      border: Border.all(),
      borderRadius: BorderRadius.circular(30),
      color: Colors.white,
    ),
    child: Form(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: "Full Name",
                labelText: "Full Name",
              ),
            ),
            SizedBox(height: 30,),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: "Phone Number 1",
                labelText: "Phone Number 1",
              ),
            ),
            SizedBox(height: 30,),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: "Phone Number 2",
                labelText: "Phone Number 2",
              ),
            ),
            SizedBox(height: 30,),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: "Location",
                labelText: "Location",
              ),
            ),
            SizedBox(height: 30,),
          ],
        ),
      ),
    ),
  );
}
