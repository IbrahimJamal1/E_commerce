import 'package:flutter/material.dart';

Widget navItem({
  required IconData icon,
  required String label,
  required int index,
  required int currentIndex,
  required Function(int) onTap,
}) {
  final bool selected = currentIndex == index;

  return Container(
    margin: EdgeInsets.only(left: 40, right: 40),
    child: InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () {
        onTap(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 26, color: selected ? Colors.blue : Colors.grey),
          const SizedBox(height: 3),
          Text(
            label,
            style: TextStyle(
              fontSize: 15,
              color: selected ? Colors.blue : Colors.grey,
              fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
          if (selected)
            Container(
              width: 30,
              height: 3,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(40),
              ),
            ),
        ],
      ),
    ),
  );
}
