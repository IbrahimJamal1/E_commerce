import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/feature/auth/login/cubit/login_cubit.dart';
import 'package:e_commerce/feature/home/function/function.dart';
import 'package:e_commerce/feature/home/models/modelproduct.dart';
import 'package:e_commerce/feature/search/search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

AppBar appBarhome(BuildContext context) {
  final uid = FirebaseAuth.instance.currentUser?.uid;

  return AppBar(
    title: StreamBuilder<DocumentSnapshot>(
      stream: uid == null
          ? null
          : FirebaseFirestore.instance.collection("users").doc(uid).snapshots(),

      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(selecttypetime()), const Text("Loading...")],
          );
        }

        if (snapshot.hasError) {
          return const Text("Error");
        }

        if (!snapshot.hasData || !snapshot.data!.exists) {
          return const Text("User");
        }

        final data = snapshot.data!.data() as Map<String, dynamic>;

        print(data);

        final name = data['name'] ?? 'User';

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              selecttypetime(),
              style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              "Hello, $name",
              style: const TextStyle(fontWeight: FontWeight.w800),
            ),
          ],
        );
      },
    ),

    actions: [
      IconButton(
        onPressed: () async {
          await showSearch<ProductModel?>(
            context: context,
            delegate: Searchpage(),
          );
        },
        icon: const Icon(Icons.search_rounded, size: 26),
      ),

      const SizedBox(width: 15),

      IconButton(
        onPressed: () async {
          await context.read<LoginCubit>().logout();

          if (context.mounted) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              'login',
              (route) => false,
            );
          }
        },
        icon: const Icon(Icons.logout_outlined, size: 26, color: Colors.red),
      ),
    ],
  );
}
