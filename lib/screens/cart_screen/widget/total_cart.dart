import 'package:flutter/material.dart';

class TotalCart extends StatelessWidget {
  const TotalCart({
    Key? key,
    required this.value,
    required this.tital,
    required this.fit,
  }) : super(key: key);

  final String value;
  final String tital;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          tital,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 35,
          width: 35,
          child: FittedBox(
            fit: fit,
            child: Text(
              value,
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.white70),
            ),
          ),
        ),
      ],
    );
  }
}
