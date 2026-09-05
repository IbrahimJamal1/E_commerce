import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OrderData {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<List<Map<String, dynamic>>> getOrders() async {
    final uid = _auth.currentUser?.uid;

    if (uid == null) {
      throw Exception('User is not logged in');
    }

    final snapshot = await _firestore
        .collection('users')
        .doc(uid)
        .collection('orders')
        .orderBy('createdAt', descending: true)
        .get();

    return snapshot.docs.map((doc) {
      return {
        'orderId': doc.id,
        ...doc.data(),
      };
    }).toList();
  }
}