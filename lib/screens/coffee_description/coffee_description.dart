import 'package:cofeeshop/screens/coffee_description/widget/product_description.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cofeeshop/screens/coffee_description/widget/product_description_img.dart';
import '../../provider/coffeedata.dart';

class CoffeeDescription extends StatelessWidget {
  const CoffeeDescription({super.key});
  static const routName = '/CoffeeDescriptionScreen';

  @override
  Widget build(BuildContext context) {
    final coffeeid =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final size = MediaQuery.of(context).size;
    final coffedata =
        Provider.of<CofeeData>(context, listen: false).findById(coffeeid['id']);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ProductDescriptionIMG(
              size: size, coffedata: coffedata, coffeeid: coffeeid),
          ProductDescription(size: size, coffedata: coffedata),
        ],
      ),
    );
  }
}
