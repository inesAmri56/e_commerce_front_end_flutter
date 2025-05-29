
import 'package:ecommerce/features/modules/cardscreen/views/cardscreen_view.dart';
import 'package:ecommerce/features/modules/favorites/views/favorites_view.dart';
import 'package:ecommerce/features/modules/home/views/home_view.dart';
import 'package:ecommerce/features/modules/profile/views/profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';

class AppButtomNavigationBar extends StatefulWidget {
  final int initialIndex;
  AppButtomNavigationBar({super.key, this.initialIndex = 0});

  final List<Widget> screens = [
    HomeView(),
    FavoritesView(),
    CardscreenView(),
    ProfileView(),
  ];

  @override
  State<AppButtomNavigationBar> createState() => _AppButtomNavigationBarState();
}

class _AppButtomNavigationBarState extends State<AppButtomNavigationBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.green,
        unselectedItemColor: AppColors.purple,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            label: "Favorite",
            icon: Icon(Icons.favorite_outline),
          ),
          BottomNavigationBarItem(
            label: "Store",
            icon: Icon(Icons.shopping_cart),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person_2_outlined),
          ),
        ],
      ),
    );
  }
}
