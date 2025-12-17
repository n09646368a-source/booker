import 'package:flutter/material.dart';
import 'package:flutter_application_6/screens/favorites_screen.dart';
import 'package:flutter_application_6/screens/home_screen.dart';

import '../screens/explore_screen.dart';
import '../screens/profile_screen.dart';

class AppNavBar extends StatefulWidget {
  const AppNavBar({super.key});

  @override
  State<AppNavBar> createState() => _AppNavBarState();
}

class _AppNavBarState extends State<AppNavBar> {
  List<Widget> pages = [
    HomeScreen(),
    FavoritesScreen(),
    ExploreScreen(),
    Container(),
    ProfileScreen(),
  ];
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) {
          setState(() {
            currentPage = value;
          });
        },
        selectedIndex: currentPage,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
            selectedIcon: Icon(Icons.home, color: Colors.blue),
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
            selectedIcon: Icon(Icons.favorite, color: Colors.blue),
          ),
          NavigationDestination(
            icon: Icon(Icons.explore),
            label: 'Explore',
            selectedIcon: Icon(Icons.explore, color: Colors.blue),
          ),
          NavigationDestination(
            icon: Icon(Icons.my_library_books),
            label: 'My Books',
            selectedIcon: Icon(Icons.explore, color: Colors.blue),
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
            selectedIcon: Icon(Icons.explore, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
