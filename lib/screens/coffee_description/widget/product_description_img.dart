import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../provider/coffee.dart';
import '../../../widgets/favaratebutton.dart';

class ProductDescriptionIMG extends StatelessWidget {
  const ProductDescriptionIMG({
    super.key,
    required this.size,
    required this.coffedata,
    required this.coffeeid,
  });

  final Size size;
  final Coffee coffedata;
  final Map<String, dynamic> coffeeid;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      width: double.infinity,
      height: size.height * 0.60,
      decoration: BoxDecoration(
        borderRadius: kroundedbottomborder(40),
        image: DecorationImage(
            image: NetworkImage(
              coffedata.image,
            ),
            fit: BoxFit.cover),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: Container(
          height: size.height * 0.18,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: kroundedbottomborder(30),
              color: Colors.black.withOpacity(0.1)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      coffedata.title,
                      style: const TextStyle(fontSize: 25),
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.star_rounded,
                          color: kaccentcolor,
                          size: 30,
                        ),
                        Text(
                          ' 4.5',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )
                      ],
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // here i want to add favorate botton
                    kroundedBlackContainer(
                      child: FavoriteButton(coffee: coffedata),
                    ),
                    kroundedBlackContainer(
                      child: Text(
                        coffedata.description,
                        style: TextStyle(
                            color: Colors.grey.shade400,
                            fontWeight: FontWeight.w500),
                      ),
                      padding: 8,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
