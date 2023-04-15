import 'package:cofeeshop/constants.dart';
import 'package:cofeeshop/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import '../../../provider/orders.dart' as ord;
import 'package:intl/intl.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    Key? key,
    required this.order,
  }) : super(key: key);
  final ord.OrdersItem order;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ExpansionTile(
        trailing: Icon(
          Icons.keyboard_double_arrow_down_rounded,
          color: klightgrycolor,
        ),
        iconColor: kdarktgrycolor,
        collapsedShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: klightgrycolor.withAlpha(50),
        collapsedBackgroundColor: klightgrycolor.withAlpha(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          '\$${order.amount}',
          style: TextStyle(
              color: kdarktgrycolor, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          DateFormat.MMMMEEEEd().format(order.dateTime),
          style: TextStyle(color: klightgrycolor),
        ),
        children: order.products
            .map((prod) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProductTile(
                      leadingImage: prod.image,
                      title: prod.title,
                      trailing: prod.amount.toStringAsFixed(2),
                      subtitile: 'Quantity : ${prod.qunatity}'),
                ))
            .toList(),
      ),
    );
  }
}
