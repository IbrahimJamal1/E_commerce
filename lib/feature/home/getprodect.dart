import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/feature/home/models/modelproduct.dart';

Future<List<ProductModel>> getProducts() async {
  final snapshot = await FirebaseFirestore.instance
      .collection('products')
      .get();

  return snapshot.docs.map((doc) => ProductModel.fromJson(doc.data())).toList();
}

Future<List<ProductModel>> getFlashSale() async {
  final snapshot = await FirebaseFirestore.instance
      .collection('flashSale')
      .get();

  return snapshot.docs.map((doc) => ProductModel.fromJson(doc.data())).toList();
}

Future<List<ProductModel>> getrecommendedProducts() async {
  final snapshot = await FirebaseFirestore.instance
      .collection('recommendedProducts')
      .get();

  return snapshot.docs.map((doc) => ProductModel.fromJson(doc.data())).toList();
}

Future<List<ProductModel>> getNewProducts() async {
  final snapshot = await FirebaseFirestore.instance
      .collection('newProducts')
      .get();

  return snapshot.docs.map((doc) => ProductModel.fromJson(doc.data())).toList();
}
