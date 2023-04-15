import 'package:cofeeshop/screens/cart_screen/widget/total_cart.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:cofeeshop/constants.dart';
import 'package:cofeeshop/provider/cart.dart';
import 'package:cofeeshop/screens/cart_screen/widget/cart_item.dart';
import 'package:cofeeshop/screens/favorate%20&%20orderconfrom/order_conform.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  static const routName = " /Cart_Screen";
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Cart'),
        backgroundColor: Colors.transparent,
      ),
      body: cart.items.isEmpty ? emptyCart() : cartView(cart, context),
    );
  }

  Widget emptyCart() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/empty.json',
            width: 250,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: 'Your cart is empty\n',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: kdarktgrycolor),
                children: [
                  TextSpan(
                      text:
                          '\nLooks like you have not added anything to you cart',
                      style: TextStyle(
                        fontSize: 15,
                        color: kdarktgrycolor,
                      ))
                ]),
          )
        ],
      ),
    );
  }

  Widget cartView(Cart cart, BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) {
              final cardindex = cart.items.values.toList()[index];

              return CartItem(
                id: cardindex.id,
                description: cardindex.descritoin,
                image: cardindex.image,
                title: cardindex.title,
                amount: cardindex.amount,
                qunatity: cardindex.quantity,
                prodcutid: cart.items.keys.toList()[index],
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TotalCart(
                  tital: 'Qty',
                  value: '${cart.totalquantity}',
                  fit: BoxFit.contain),
              TotalCart(
                  fit: BoxFit.cover,
                  tital: 'Total',
                  value: '\$${cart.totalAmount.toStringAsFixed(2)}'),
            ],
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: kaccentcolor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: MediaQuery.of(context).size.width * 0.3)),
          onPressed: () {
            Navigator.of(context)
                .pushNamed(OrderConfirmationScreen.routeName, arguments: {
              'items': cart.items.values.toList(),
              'totalAmount': cart.totalAmount,
            });
          },
          child: const Text(
            'Check Out',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
