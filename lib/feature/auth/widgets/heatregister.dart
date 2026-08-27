import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Widget headregister(XFile? selectedImage, VoidCallback onTap) {
  return Center(
    child: InkWell(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 80,
        padding: const EdgeInsets.all(3),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.lightBlue,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFEBF2FD),
              ),
              alignment: Alignment.center,
              child: selectedImage == null
                  ? const Text("🧑", style: TextStyle(fontSize: 40))
                  : ClipOval(
                      child: Image.file(
                        File(selectedImage.path),
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),

            if (selectedImage == null)
              Positioned(
                right: -3,
                bottom: -3,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.lightBlue,
                    border: Border.all(color: Colors.white, width: 3),
                  ),
                  child: const Icon(Icons.add, size: 18, color: Colors.black),
                ),
              ),
          ],
        ),
      ),
    ),
  );
}
