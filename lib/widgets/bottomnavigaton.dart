import 'package:cofeeshop/provider/cart.dart';
import 'package:cofeeshop/screens/cart_screen/cart_screen.dart';
import 'package:cofeeshop/screens/favorate%20&%20orderconfrom/favorate.dart';
import 'package:cofeeshop/screens/home_screen/home_page.dart';
import 'package:cofeeshop/screens/order_historyScreen/orders_histroy.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import '../constants.dart';

class PageNavigation extends StatefulWidget {
  const PageNavigation({
    super.key,
  });

  @override
  State<PageNavigation> createState() => _PageNavigationState();
}

class _PageNavigationState extends State<PageNavigation> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const MyHomePage(),
    const FavoriteView(),
    const OrderHistoryScreen(),
    const CartScreen(),
  ];

  final List<BottomNavigationBarItem> _bottomNavigationBarItems = [
    const BottomNavigationBarItem(
      icon: FaIcon(FontAwesomeIcons.house),
      label: '',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.favorite_border,
        size: 30,
      ),
      label: '',
    ),
    const BottomNavigationBarItem(
      icon: FaIcon(FontAwesomeIcons.bagShopping),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Consumer<Cart>(
        builder: (context, value, child) {
          if (value.totalquantity <= 0) {
            return const Icon(Icons.shopping_cart_outlined, size: 25);
          } else {
            return badges.Badge(
                badgeContent: Text('${value.totalquantity}'),
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  size: 30,
                ));
          }
        },
      ),
      label: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kaccentcolor,
        selectedIconTheme: const IconThemeData(size: 30),
        unselectedItemColor: klightgrycolor,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            if (index == 1) {
              _bottomNavigationBarItems[1] = const BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                ),
                label: '',
              );
            } else {
              _bottomNavigationBarItems[1] = const BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.heart,
                ),
                label: '',
              );
            }
          });
        },
        items: _bottomNavigationBarItems,
      ),
      body: _pages[_currentIndex],
    );
  }
}
