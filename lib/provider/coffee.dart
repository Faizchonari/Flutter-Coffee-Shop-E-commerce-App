import 'package:flutter/material.dart';

enum CoffeeSize { small, medium, large }

class Coffee extends ChangeNotifier {
  final String id;
  final String title;
  CoffeeSize size;
  final String image;
  final String description;
  final double amount;
  bool isFavarate;

  Coffee(
      {required this.id,
      required this.title,
      this.size = CoffeeSize.small,
      required this.image,
      required this.amount,
      required this.description,
      this.isFavarate = false});

  void setSize(CoffeeSize size) {
    this.size = size;
    notifyListeners();
  }

  // void toggleFavoriteStatus() {
  //   isFavarate = !isFavarate;
  //   notifyListeners();
  // }
}
