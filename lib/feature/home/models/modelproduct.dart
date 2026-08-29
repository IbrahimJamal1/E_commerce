import 'dart:ui';

class ProductModel {
  final String id;
  final String type;
  final String name;
  final String prands;
  final String description;
  final String image;
  final double price;
  final double rating;
  final double numrating;
  final String category;
  final String onstack;
  final int stock;
  final Color color;

  final String? material;
  final String? weight;
  final String? waterproof;
  final String? origin;
  final String? sku;
  ProductModel({
    required this.id,
    required this.type,
    required this.name,
    required this.prands,
    required this.description,
    required this.image,
    required this.price,
    required this.category,
    required this.onstack,
    required this.rating,
    required this.numrating,
    required this.stock,
    required this.color,
    this.material,
    this.weight,
    this.waterproof,
    this.origin,
    this.sku,
  });
}
