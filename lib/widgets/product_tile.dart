import 'package:flutter/material.dart';
import '../constants.dart';

// ignore: must_be_immutable
class ProductTile extends StatelessWidget {
  ProductTile({
    Key? key,
    required this.leadingImage,
    required this.title,
    required this.trailing,
    required this.subtitile,
    this.onTap,
  }) : super(key: key);
  final String leadingImage;
  final String title;
  final String trailing;
  final String subtitile;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      tileColor: kdarktgrycolor.withAlpha(50),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: NetworkImage(leadingImage),
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, color: kdarktgrycolor),
      ),
      subtitle: Text(
        subtitile,
        style: TextStyle(
            fontWeight: FontWeight.w500, color: kaccentcolor.withAlpha(200)),
      ),
      trailing: Text(
        trailing,
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: kaccentcolor, fontSize: 18),
      ),
    );
  }
}
