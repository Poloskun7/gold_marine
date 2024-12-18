import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gold_marine/screens/about_us_screen/about_us_screen.dart';
import 'package:gold_marine/screens/home_screen/home_screen.dart';
import 'package:gold_marine/screens/catalog_screen/catalog_screen.dart';

class Navigation extends StatefulWidget {
  final int initialIndex;

  const Navigation({super.key, required this.initialIndex});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  late int _selectedTab;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const CatalogScreen(),
    const AboutUsScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedTab = widget.initialIndex;
  }

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
    context.go(index == 0 ? '/' : index == 1 ? '/catalog' : '/about_us');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sailing),
            label: 'Каталог',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'О нас',
          ),
        ],
        onTap: onSelectTab,
      ),
    );
  }
}