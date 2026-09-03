import 'package:flutter/material.dart';

Widget dataacount(
  String title,
  String subtitle,
  Icon icon,
  VoidCallback onTap,
) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(25),
    ),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(25),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16,
          ),
        ),
        leading: Icon(
          icon.icon,
          color: Colors.blue,
        ),
      ),
    ),
  );
}