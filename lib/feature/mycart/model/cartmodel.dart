import 'dart:ui';

class CartItem {
  final String id;
  final String name;
  final double price;
  final int quantity;
  final String? selectedSize;
  final String image;
  final Color color;
  final int stock;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.selectedSize,
    required this.image,
    required this.color,
    required this.stock,
  });
}