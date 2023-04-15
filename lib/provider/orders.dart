// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cofeeshop/screens/cart_screen/widget/cart_item.dart';
import 'package:flutter/material.dart';

import 'cart.dart';

class OrdersItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrdersItem({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
  });
}

class Orders extends ChangeNotifier {
  final List<OrdersItem> _orders = [];

  List<OrdersItem> get orders {
    return [..._orders];
  }

  void addOrders(List<CartItems> cartProducts, double total) {
    List<CartItem> products = cartProducts
        .map((cartItem) => CartItem(
              id: cartItem.id,
              title: cartItem.title,
              image: cartItem.image,
              amount: cartItem.amount,
              description: cartItem.descritoin,
              qunatity: cartItem.quantity,
              prodcutid: '',
            ))
        .toList();

    _orders.insert(
        0,
        OrdersItem(
            id: DateTime.now().toString(),
            amount: total,
            products: products,
            dateTime: DateTime.now()));
    notifyListeners();
  }
}
