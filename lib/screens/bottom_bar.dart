import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
// import 'package:provider/provider.dart';
import 'package:udemy_flutter/screens/cart_screen.dart';
import 'package:udemy_flutter/screens/categories_screen.dart';
import 'package:udemy_flutter/screens/home_screen.dart';
import 'package:udemy_flutter/screens/user_screen.dart';

// import '../provider/dark_theme_provider.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;
  // final List<Map<String, dynamic>> _pages = [
  //   {'page': const HomeScreen(), 'title': 'Home'},
  //   {'page': const CategoriesScreen(), 'title': 'Category'},
  //   {'page': const CartScreen(), 'title': 'Cart'},
  //   {'page': const UserScreen(), 'title': 'User'},
  // ];

  final List _pages = [
    const HomeScreen(),
    CategoriesScreen(),
    const CartScreen(),
    const UserScreen(),
  ];

  final List _titles = [
    'Home',
    'Category',
    'Cart',
    'User',
  ];

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final themeState = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: _pages[_selectedIndex],
      appBar: _titles[_selectedIndex] != 'User'
          ? AppBar(
              title: Text(_titles[_selectedIndex]),
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            )
          : AppBar(
              title: const Text(''),
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
              toolbarHeight: 10,
            ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).cardColor,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _selectedPage,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Theme.of(context).colorScheme.secondary,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                    _selectedIndex == 0 ? IconlyBold.home : IconlyLight.home),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(_selectedIndex == 1
                    ? IconlyBold.category
                    : IconlyLight.category),
                label: "Category"),
            BottomNavigationBarItem(
                icon: Icon(
                    _selectedIndex == 2 ? IconlyBold.buy : IconlyLight.buy),
                label: "Cart"),
            BottomNavigationBarItem(
                icon: Icon(
                    _selectedIndex == 3 ? IconlyBold.user2 : IconlyLight.user2),
                label: "User"),
          ]),
    );
  }
}
