import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../provider/orders.dart';
import 'widget/order_item.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    final orders = orderData.orders;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Order History'),
      ),
      body: orders.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LottieBuilder.asset('assets/empty2.json', width: 300),
                  const Text(
                    'You have no orders yet !',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: orders.length,
              itemBuilder: (ctx, index) => OrderItem(
                  order: orders[index]), // pass order as a named argument
            ),
    );
  }
}
