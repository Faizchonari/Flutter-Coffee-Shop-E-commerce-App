import 'package:flutter/material.dart';
import '../../../constants.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Special for you',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.all(8),
          height: 150,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: kblacklinearGradient,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 150,
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1610632380989-680fe40816c6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '5 Coffee Beans You \nMust Try!',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Try the best coffee Beans\nyou never had...',
                      style: TextStyle(color: Colors.grey.shade400),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
