import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:cofeeshop/provider/cart.dart';
import '../../../constants.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
    required this.image,
    required this.title,
    required this.prodcutid,
    required this.id,
    required this.amount,
    required this.qunatity,
    required this.description,
  }) : super(key: key);
  final String image;
  final String title;
  final String prodcutid;
  final String id;
  final double amount;
  final int qunatity;
  final String description;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 5,
        color: Colors.grey.shade800,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Slidable(
          key: ValueKey(id),
          endActionPane: ActionPane(motion: const ScrollMotion(), children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(15),
              onPressed: (context) {
                Provider.of<Cart>(context, listen: false).removeItem(prodcutid);
              },
              backgroundColor: Colors.redAccent,
              icon: Icons.delete,
            ),
          ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: SizedBox(
                  height: size.height * 0.13,
                  width: size.width * 0.20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    title,
                    style: kblacktextStyle(25),
                  ),
                  Text(description)
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '\$$amount',
                      style: kblacktextStyle(20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                          color: kaccentcolor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        'x $qunatity',
                        style: kblacktextStyle(18),
                      )),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
