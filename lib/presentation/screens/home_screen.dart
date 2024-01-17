import 'package:flutter/material.dart';

import 'package:tourist_guide_app/const.dart';
import 'package:tourist_guide_app/presentation/screens/category_screen.dart';
import 'package:tourist_guide_app/presentation/screens/favorites_screen.dart';
import 'package:tourist_guide_app/presentation/widgets/custom_appbar_title.dart';
import 'package:tourist_guide_app/presentation/widgets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> _screens = const [
    {
      "screen": CategoryScreen(),
      "title": "الدليل السياحي",
    },
    {
      "screen": FavoritesScreen(),
      "title": "المفضلة",
    },
  ];

  int _selectedScreenIndex = 0;

  void _onTapButtomNavigationBar(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: CustomAppBarTitle(
            appBarTitile: _screens[_selectedScreenIndex]["title"],
          ),
        ),
      ),
      drawer: const CustomDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTapButtomNavigationBar,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).hintColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedScreenIndex,
        selectedFontSize: fSize * .9,
        iconSize: heightScreen * .035,
        unselectedFontSize: fSize * .8,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "التصنيفيات",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "المفضلة",
          ),
        ],
      ),
      body: _screens[_selectedScreenIndex]["screen"],
    );
  }
}
