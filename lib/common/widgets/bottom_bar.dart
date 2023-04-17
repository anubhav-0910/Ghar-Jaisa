import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:project_s4/constants/global_variables.dart';

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
    (HomeScreen()),
    const Center(
      child: Text("Orders"),
    ),
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

          //2 FAVOURITES
          // BottomNavigationBarItem(
          //   icon: Container(
          //     width: bottomBarWidth,
          //     decoration: BoxDecoration(
          //       border: Border(
          //         top: BorderSide(
          //           color: _page == 1
          //               ? GlobalVariables.selectedNavBarColor
          //               : GlobalVariables.backgroundColor,
          //           width: bottomBarBorderWidth,
          //         ),
          //       ),
          //     ),
          //     child: const Icon(
          //       Icons.favorite_outline_outlined,
          //     ),
          //   ),
          //   label: '',
          // ),

          //3 CART
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
              child: const badges.Badge(
                badgeContent: Text("2"),
                badgeStyle: badges.BadgeStyle(
                  elevation: 0,
                  badgeColor: Colors.white,
                ),
                child: Icon(
                  Icons.shopping_cart_outlined,
                ),
              ),
            ),
            label: '',
          ),

          ///4 MESSAGE

          ///
        ],
      ),
    );
  }
}
