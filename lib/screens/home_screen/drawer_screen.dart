import 'package:flutter/material.dart';
import '../../constants.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kprimarycolor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: ListView(
        children: [
          const CircleAvatar(
            radius: 80,
            backgroundImage: NetworkImage(
              'https://images.pexels.com/photos/6976943/pexels-photo-6976943.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Hello \nCaterena',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: klightgrycolor,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const DrawerTile(
            icon: Icons.person,
            title: 'Account',
          ),
          const DrawerTile(
            icon: Icons.shopping_bag_rounded,
            title: 'My orders',
          ),
          const DrawerTile(
              title: 'Cupeons', icon: Icons.card_giftcard_rounded),
          const DrawerTile(title: 'Settings', icon: Icons.settings),
          const DrawerTile(title: 'About', icon: Icons.info_outline_rounded),
          
        ],
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    Key? key,
    this.onpressed,
    required this.title,
    required this.icon,
  }) : super(key: key);
  final Function()? onpressed;
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onpressed,
      leading: Icon(
        icon,
        color: klightgrycolor,
      ),
      title: Text(
        title,
        style: TextStyle(color: klightgrycolor, fontSize: 15),
      ),
    );
  }
}