import 'package:flutter/material.dart';
import 'package:lecture11/features/home_screen.dart';
import 'package:lecture11/features/mycart/my_cart.dart';

int currentindex = 0;
void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int currentIndex = 0;

  final List<Widget> screens = [HomeScreen(), MyCart()];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 16,
          selectedItemColor: Color(0xff53B175),
          unselectedFontSize: 10,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "My Cart",
            ),
          ],
        ),
      ),
    );
  }
}
