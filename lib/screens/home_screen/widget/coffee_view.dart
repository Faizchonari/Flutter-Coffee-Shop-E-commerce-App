import 'package:cofeeshop/provider/cart.dart';
import 'package:cofeeshop/provider/coffeedata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'itemcard.dart';

class CoffeeView extends StatelessWidget {
  const CoffeeView({super.key});

  @override
  Widget build(BuildContext context) {
    final coffeedata = Provider.of<CofeeData>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);

    final deviceSize = MediaQuery.of(context).size;

    return SizedBox(
      height: deviceSize.height * 0.37,
      width: deviceSize.width,
      child: ListView.builder(
        itemCount: coffeedata.coffeeList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final coffeindex = coffeedata.coffeeList[index];
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ItemCard(
                start: CrossAxisAlignment.start,
                coffeindex: coffeindex,
                imageWidth: 0.3,
                cart: cart,
                index: index),
          );
        },
      ),
    );
  }
}
