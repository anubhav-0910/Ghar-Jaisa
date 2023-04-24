import 'package:flutter/material.dart';

import 'package:project_s4/constants/global_variables.dart';
import 'package:project_s4/features/orders/screens/orders_history_screen.dart';

import '../../features/home/screens/home_screen.dart';

class BottomBar extends StatefulWidget {
  static const routeName = '/actual-home';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  //Variables
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  //Screens
  List<Widget> pages = [
    (const HomeScreen()),
    OrdersHistoryScreen(),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        iconSize: 28,
        onTap: updatePage,
        items: [
          //1 HOME
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 0
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: const Icon(
                Icons.home_outlined,
              ),
            ),
            label: '',
          ),

          //2 CART
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 1
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: const Icon(
                Icons.shopping_cart_checkout_sharp,
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
