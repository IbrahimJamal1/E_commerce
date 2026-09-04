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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'name': name,
      'prands': prands,
      'description': description,
      'image': image,
      'price': price,
      'rating': rating,
      'numrating': numrating,
      'category': category,
      'onstack': onstack,
      'stock': stock,
      'color': color.toARGB32(),
      'material': material,
      'weight': weight,
      'waterproof': waterproof,
      'origin': origin,
      'sku': sku,
    };
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as String,
      type: json['type'] as String,
      name: json['name'] as String,
      prands: json['prands'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      price: (json['price'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      numrating: (json['numrating'] as num).toDouble(),
      category: json['category'] as String,
      onstack: json['onstack'] as String,
      stock: (json['stock'] as num).toInt(),
      color: Color((json['color'] as num).toInt()),
      material: json['material'] as String?,
      weight: json['weight'] as String?,
      waterproof: json['waterproof'] as String?,
      origin: json['origin'] as String?,
      sku: json['sku'] as String?,
    );
  }
}
