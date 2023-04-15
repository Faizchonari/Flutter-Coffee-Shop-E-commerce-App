import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../provider/cart.dart';
import '../../../provider/coffee.dart';
import '../../../widgets/favaratebutton.dart';
import '../../coffee_description/coffee_description.dart';

// ignore: must_be_immutable
class ItemCard extends StatelessWidget {
  ItemCard(
      {super.key,
      required this.coffeindex,
      required this.cart,
      required this.index,
      required this.start,
      required this.imageWidth});

  final Coffee coffeindex;
  final Cart cart;
  final int index;
  var start = CrossAxisAlignment.start;
  final double imageWidth;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      width: deviceSize.width * 0.33,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: kblacklinearGradient),
      child: Column(
        crossAxisAlignment: start,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              SizedBox(
                width: deviceSize.width * imageWidth,
                height: deviceSize.height * 0.18,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(
                      CoffeeDescription.routName,
                      arguments: {'id': coffeindex.id, 'index': index}),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      coffeindex.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              FavoriteButton(
                coffee: coffeindex,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(text: '${coffeindex.title}\n', children: [
                TextSpan(
                    text: coffeindex.description,
                    style: const TextStyle(fontSize: 10, color: Colors.grey))
              ]),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                    text: '\$ ',
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: kaccentcolor),
                    children: [
                      TextSpan(
                          text: coffeindex.amount.toString(),
                          style: const TextStyle(color: Colors.white)),
                    ]),
              ),
              ElevatedButton(
                onPressed: () {
                  cart.addItem(
                      coffeindex.id,
                      coffeindex.amount,
                      coffeindex.title,
                      coffeindex.image,
                      coffeindex.description);
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                  backgroundColor: MaterialStateProperty.all(kaccentcolor),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(2)),
                  minimumSize: MaterialStateProperty.all(
                      const Size(30.0, 30.0)), // Set the desired size
                ),
                child: const Icon(
                  Icons.add_shopping_cart_rounded,
                  size: 18,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
