import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import '../../../constants.dart';
import '../../../provider/cart.dart';
import '../../../provider/coffee.dart';
import '../../cart_screen/cart_screen.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
    required this.size,
    required this.coffedata,
  }) : super(key: key);
  final Size size;
  final Coffee coffedata;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Container(
      height: size.height * 0.40,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Description',
            style: TextStyle(color: kdarktgrycolor, fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ReadMoreText(
              'Wet cappuccinos (also known as cappuccini chiaro or light cappuccinos) are made with more hot milk and less foamed milk ',
              trimLines: 2,
              trimMode: TrimMode.Line,
              colorClickableText: Colors.red,
              trimCollapsedText: 'Read more',
              trimExpandedText: 'Read less',
              moreStyle: kreadmoreTexStyle,
              lessStyle: kreadmoreTexStyle,
              style: TextStyle(color: klightgrycolor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'Price',
                      style: TextStyle(fontSize: 12, color: klightgrycolor),
                    ),
                    RichText(
                      text: const TextSpan(
                          text: '\$ ',
                          style: TextStyle(
                              fontSize: 18,
                              color: kaccentcolor,
                              fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                                text: '4.20',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white))
                          ]),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kaccentcolor,
                    padding: EdgeInsetsDirectional.symmetric(
                        vertical: 15, horizontal: size.width * 0.26),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(CartScreen.routName);
                    newMethod(cart, coffedata);
                  },
                  child: const Text('Buy Now'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void newMethod(Cart cart, Coffee coffedata) {
    return cart.addItem(coffedata.id, coffedata.amount, coffedata.title,
        coffedata.image, coffedata.description);
  }
}
