import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/feature/profile/module/usermodel.dart';

Future<UserModel> getUserProfile(String uid) async {
  try {
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get();

    if (!snapshot.exists || snapshot.data() == null) {
      throw Exception('User profile not found');
    }

    return UserModel.fromMap(snapshot.data()!);
  } catch (e) {
    throw Exception('Failed to get user profile: $e');
  }
}