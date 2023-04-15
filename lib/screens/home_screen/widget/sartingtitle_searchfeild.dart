import 'package:cofeeshop/constants.dart';
import 'package:cofeeshop/screens/coffee_description/coffee_description.dart';
import 'package:cofeeshop/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:searchfield/searchfield.dart';
import '../../../provider/coffeedata.dart';

class SartingTitleandSearchfeild extends StatelessWidget {
  const SartingTitleandSearchfeild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final coffeedata = Provider.of<CofeeData>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Find the best\ncoffee for you',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SearchField(
            hint: 'Seach you favorate coffee...',
            searchStyle: TextStyle(color: klightgrycolor),
            suggestionItemDecoration: const BoxDecoration(
              gradient: kblacklinearGradient,
            ),
            itemHeight: 70,
            maxSuggestionsInViewPort: 3,
            searchInputDecoration: InputDecoration(
              hintStyle: TextStyle(color: kdarktgrycolor),
              prefixIcon: Icon(
                Icons.search,
                color: kdarktgrycolor,
              ),
              fillColor: klightgrycolor.withAlpha(22),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            suggestions: coffeedata.coffeeList
                .map(
                  (e) => SearchFieldListItem(
                    e.title,
                    item: e,
                    child: ProductTile(
                      onTap: () {
                        final index = coffeedata.coffeeList.indexOf(e);
                        Navigator.of(context).pushNamed(
                            CoffeeDescription.routName,
                            arguments: {'id': e.id, 'index': index});
                      },
                      leadingImage: e.image,
                      subtitile: e.description,
                      title: e.title,
                      trailing: '\$ ${e.amount.toStringAsFixed(2)}',
                    ),
                  ),
                )
                .toList(),
          ),
        )
      ],
    );
  }
}
