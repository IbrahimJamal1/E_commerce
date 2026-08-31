import 'package:flutter/material.dart';

Widget rowcheckstap(int step, int currentStep) {
  bool isActive = step <= currentStep;

  return Column(
    children: [
      Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isActive ? Colors.blue : Colors.grey,
            width: 2,
          ),
          color: isActive ? Colors.blue : Colors.grey.shade200,
        ),
        child: Text(
          step.toString(),
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: isActive ? Colors.white : Colors.grey,
          ),
        ),
      ),

      if (step == 2)
        Text(
          "Payment",
          style: TextStyle(
            color: isActive ? Colors.blue : Colors.grey.shade200,
          ),
        ),
      if (step == 1)
        Text(
          "Address",
          style: TextStyle(
            color: isActive ? Colors.blue : Colors.grey.shade200,
          ),
        ),
    ],
  );
}
