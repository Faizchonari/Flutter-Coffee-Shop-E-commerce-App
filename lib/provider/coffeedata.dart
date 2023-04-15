import 'package:cofeeshop/provider/coffee.dart';
import 'package:flutter/material.dart';

class CofeeData extends ChangeNotifier {
  final List<Coffee> _coffeeList = [
    Coffee(
        id: 'c1',
        title: 'Coffee',
        image:
            'https://images.pexels.com/photos/2396220/pexels-photo-2396220.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        amount: 4.5,
        description: 'with cream'),
    Coffee(
        id: 'c2',
        title: 'Cappuccino',
        image:
            'https://images.pexels.com/photos/2638019/pexels-photo-2638019.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        amount: 5.2,
        description: "with cololate flavor"),
    Coffee(
        id: 'c3',
        title: 'Flat White',
        image:
            'https://images.pexels.com/photos/312418/pexels-photo-312418.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        amount: 4.3,
        description: 'steamed milk foam'),
    Coffee(
        id: 'c4',
        title: 'Mocha',
        image:
            'https://elegantcoffee.com/wp-content/uploads/2020/06/mocha_new-500x500.jpg',
        amount: 6.4,
        description: 'chocolate flavor'),
    Coffee(
        id: 'C4',
        title: ' Latte',
        image:
            'https://images.unsplash.com/photo-1557142046-c704a3adf364?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
        amount: 7.5,
        description: 'vanila favor'),
    Coffee(
        id: 'c5',
        title: 'Espresso',
        image:
            'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
        amount: 4.6,
        description: 'thik blak coffee')
  ];

  List<Coffee> get coffeeList {
    return [..._coffeeList];
  }

  List<Coffee> get favoriteItems {
    return _coffeeList.where((item) => item.isFavarate).toList();
  }

  Coffee findByid(String id) {
    return _coffeeList.firstWhere((item) => item.id == id);
  }

  void addProduct() {
    notifyListeners();
  }

  Coffee findById(String id) {
    return coffeeList.firstWhere((cofe) => cofe.id == id);
  }

  void refreshUI() {
    notifyListeners();
  }
}
