import 'package:book_store/presentation/core/app_colors.dart';
import 'package:book_store/presentation/screens/cart/shopping_cart_screen.dart';
import 'package:book_store/presentation/screens/home/home_screen.dart';
import 'package:book_store/presentation/screens/search/search_screen.dart';
import 'package:book_store/presentation/screens/wish/wish_list_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  //
  List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
    const WishListScreen(),
    const ShoppingCartScreen(),
  ];
  //
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Bottom Navigation Bar
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        color: AppColors.primary,
        backgroundColor: Colors.white,

        items: [
          Icon(CupertinoIcons.home, size: 30, color: Colors.white),
          Icon(CupertinoIcons.search, size: 30, color: Colors.white),
          Icon(
            CupertinoIcons.list_bullet_indent,
            size: 30,
            color: Colors.white,
          ),
          Icon(CupertinoIcons.cart, size: 30, color: Colors.white),
        ],
      ),
      //
      body: screens[selectedIndex],
    );
  }
}
