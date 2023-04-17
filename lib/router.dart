// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project_s4/common/widgets/bottom_bar.dart';
import 'package:project_s4/features/admin/screens/add_products_screen.dart';
import 'package:project_s4/features/home/screens/category_screen.dart';
import 'package:project_s4/features/home/widgets/app_drawer.dart';
import 'package:project_s4/features/search/screens/search_screen.dart';
import 'features/auth/screens/login_screen.dart';
import 'features/auth/screens/signup_screen.dart';
import 'features/home/screens/home_screen.dart';
import './features/user_profile/screens/edit_profile_screen.dart';
import './features/user_profile/screens/user_profile_screen.dart';

Route<dynamic>? generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LoginScreen(),
      );
    case SignUpScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SignUpScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AppDrawer(BottomBar()),
      );

    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AppDrawer(BottomBar()),
      );

    case AddProductScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AddProductScreen(),
      );

    case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SearchScreen(
          searchQuery: searchQuery,
        ),
      );

    case CategoryScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CategoryScreen(
          category: category,
        ),
      );

    case UserProfileScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => UserProfileScreen(),
      );

    case EditProfileScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => EditProfileScreen(),
      );

    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}
