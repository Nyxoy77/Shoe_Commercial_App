import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> cart = [];

  void addProduct(Map<String, dynamic> map) {
    cart.add(map);
    notifyListeners(); // Important else the changes wont be inflicted
  }

  void removeProduct(Map<String, dynamic> map) {
    cart.remove(map);
    notifyListeners(); // Important else the changes wont be inflicted
  }
}
