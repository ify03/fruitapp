import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
//list of items on sale
  final List _shopItems = [
    //[itemName, ItemPrice, imagePath, color]
    ["Apple", "140.00", "images/images.jpeg", Colors.green],
    ["Berry", "50.00", "images/images (6).jpeg", Colors.yellow],
    ["Orange", "20.00", "images/images (2).jpeg", Colors.pink],
    ["Avocado", "250.00", "images/images (5).jpeg", Colors.blue],
  ];

  final List _cartItems = [];
  get shopItems => _shopItems;
  get cartItems => _cartItems;
  void addItmToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  //remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  //cal total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
