import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  // create a cart that have list(map).
  final List<Map<String, dynamic>> cart = [];

  // To add the product to cart.
  void addProduct(Map<String, dynamic> product) {
    cart.add(product);
    notifyListeners(); // Notifies listeners of state changes. Then only it will add to a cart.
  }

  // To Remove the product to cart.
  void removeProduct(Map<String, dynamic> product) {
    cart.remove(product);
    notifyListeners(); // Notifies listeners of state changes
  }
}
