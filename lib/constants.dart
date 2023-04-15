import 'package:flutter/material.dart';

const kaccentcolor = Color(0xffd17842);
const kprimarycolor = Color(0xff0c0f14);

const kblacklinearGradient = LinearGradient(
  colors: [Color(0xff000000), Color(0xff5d5d5d)],
  begin: Alignment.bottomRight,
  end: Alignment.topLeft,
);

BorderRadius kroundedbottomborder(double radius) {
  return BorderRadius.only(
      bottomLeft: Radius.circular(radius),
      bottomRight: Radius.circular(radius));
}

final klightgrycolor = Colors.grey.shade300;
final kdarktgrycolor = Colors.grey.shade400;
const kreadmoreTexStyle = TextStyle(fontSize: 15, color: kaccentcolor);
TextStyle ksmallTitleTextStyle({required double fontsize}) =>
    TextStyle(color: kdarktgrycolor, fontSize: fontsize);

Container kgradiantIcon(
  IconData icon,
) {
  return Container(
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: kblacklinearGradient),
    child: Icon(
      icon,
      color: Colors.grey.shade500,
    ),
  );
}

Widget kroundedBlackContainer({required Widget child, double padding = 0}) {
  return Container(
    padding: EdgeInsets.all(padding),
    decoration: BoxDecoration(
        gradient: kblacklinearGradient,
        borderRadius: BorderRadius.circular(10)),
    child: child,
  );
}

TextStyle kblacktextStyle(double fontsize) {
  return TextStyle(
      fontSize: fontsize, fontWeight: FontWeight.bold, color: kdarktgrycolor);
}
