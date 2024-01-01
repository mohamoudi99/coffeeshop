import 'package:flutter/material.dart';

class CoffeeItem {
  int amount;
  double price;
  double total;

  CoffeeItem({required this.amount, required this.price, this.total = 0.0});
}

class AppState extends ChangeNotifier {
  int totalItemCount = 0;
  double totalPrice = 0.0;

  Map<String, CoffeeItem> items = {
    'Black': CoffeeItem(amount: 0, price: 3.5, total: 0.0),
    'Caramel': CoffeeItem(amount: 0, price: 4.0, total: 0.0),
    'Mocha': CoffeeItem(amount: 0, price: 4.0, total: 0.0),
    'Vanilla': CoffeeItem(amount: 0, price: 4.0, total: 0.0),
  };

  void updateCart(String itemName) {
    totalItemCount++;
    totalPrice += items[itemName]!.price;
    items[itemName]!.amount++;
    items[itemName]!.total += items[itemName]!.price;
    notifyListeners();
  }

  void removeFromCart(String itemName) {
    totalItemCount--;
    totalPrice -= items[itemName]!.price;
    items[itemName]!.amount--;
    items[itemName]!.total -= items[itemName]!.price;
    notifyListeners();
  }
}
