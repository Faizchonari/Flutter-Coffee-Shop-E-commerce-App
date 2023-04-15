import 'package:cofeeshop/constants.dart';
import 'package:cofeeshop/screens/home_screen/widget/itemcard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import '../../provider/cart.dart';
import '../../provider/coffeedata.dart';

 

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    final coffeeData = Provider.of<CofeeData>(context);
    final favoriteCoffees =
        coffeeData.coffeeList.where((coffee) => coffee.isFavarate).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: favoriteCoffees.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/favorite-empty.json',
                    width: 250,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'No Favorate Yet',
                    style: TextStyle(
                        fontSize: 25,
                        color: kdarktgrycolor,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            )
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 4,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20),
              itemCount: favoriteCoffees.length,
              itemBuilder: (context, index) {
                final coffeindex = favoriteCoffees[index];
                return ItemCard(
                  coffeindex: coffeindex,
                  cart:
                      cart, // pass null because the cart functionality is not needed here
                  index: index,
                  start: CrossAxisAlignment
                      .center, // center the text for better UI
                  imageWidth: 0.6, // adjust the image size
                );
              },
            ),
    );
  }
}
