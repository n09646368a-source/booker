import 'package:flutter/material.dart';
import 'package:flutter_application_6/screens/favorites_screen.dart';
import 'package:flutter_application_6/screens/home_screen.dart';
import 'package:flutter_application_6/screens/login_screen.dart';

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
      appBar: AppBar(
        title: const Text('Booker'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Log out',
            onPressed: () async {
              final doLogout = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Log out'),
                  content: const Text('Are you sure you want to log out?'),
                  actions: [
                    TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Cancel')),
                    TextButton(onPressed: () => Navigator.of(context).pop(true), child: const Text('Log out')),
                  ],
                ),
              );

              if (doLogout == true) {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                  (route) => false,
                );
              }
            },
          ),
        ],
      ),
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
            icon: Icon(Icons.add),
            label: 'Add Apartment',
            selectedIcon: Icon(Icons.add, color: Colors.blue),
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
