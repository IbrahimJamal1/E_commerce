import 'dart:ui';

import 'package:e_commerce/feature/mycart/model/cartmodel.dart';
import 'package:flutter/material.dart';

class Addtocatlocal extends ChangeNotifier {
  final List<CartItem> myCart = [];

  void addToCart({
    required String id,
    required String name,
    required double price,
    required int quantity,
    required String? selectedSize,
    required String image,
    required Color color,
    required int stock,
  }) {
    myCart.add(
      CartItem(
        id: id,
        name: name,
        price: price,
        quantity: quantity,
        selectedSize: selectedSize,
        image: image,
        color: color,
        stock: stock,
      ),
    );

    notifyListeners();
  }

  double calculateTotalPrice() {
    double totalPrice = 0.0;
    for (var item in myCart) {
      totalPrice += item.price * item.quantity;
    }
    return totalPrice;
  }

  double discount() {
    double totalPrice = calculateTotalPrice();
    return totalPrice * .15;
  }

  double total() {
    double totalPrice = calculateTotalPrice();
    double discountPrice = discount();
    double shipping = 20;

    return totalPrice - discountPrice + shipping;
  }

  void deleteFromCart(int index) {
    myCart.removeAt(index);
    notifyListeners();
  }

  void clearCart() {
    myCart.clear();
    notifyListeners();
  }
}
