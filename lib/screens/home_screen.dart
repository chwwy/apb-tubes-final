import 'package:apb5/helpers/helper.dart';
import 'package:apb5/screens/dashboard_screen.dart';
import 'package:apb5/screens/detail_screen.dart';
import 'package:apb5/screens/make_order_screen.dart';
import 'package:apb5/screens/profile_screen.dart';
import 'package:apb5/themes/colors/colors_manager.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget menus(selectedIndex){
    switch (selectedIndex) {
      case 0:
          return const DashboardScreen();
      case 1:
          return const MakeOrderScreen();
      case 2:
          return const DetailScreen();
      case 3:
          return const ProfileScreen();
      default:
       return const Text("Tidak ada menu");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: menus(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Center(child: Image.asset(width: 23.0,'${Helper.assetImagePath}icon_home.png')),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Center(child: Image.asset(width: 23.0,'${Helper.assetImagePath}ic_clock.png')),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Center(child: Image.asset(width: 23.0,'${Helper.assetImagePath}icon_heart.png')),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Center(child: Image.asset(width: 23.0,'${Helper.assetImagePath}icon_user_grey.png')),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: black,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
