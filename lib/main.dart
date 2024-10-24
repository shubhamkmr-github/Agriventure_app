import 'package:agriventure/account.dart';
import 'package:agriventure/home.dart';
import 'package:agriventure/plan.dart';
import 'package:agriventure/post.dart';
import 'package:agriventure/welcome_screen.dart';
import 'package:agriventure/wishlist.dart';
import 'package:flutter/material.dart';
import 'login_signup.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    ));

// Home screen with bottom navigation
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // List of screens to navigate to
  final List<Widget> _screens = [
    HomePage(),
    PlanScreen(),
    AddTripPage(),
    WishlistScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex], // Display the selected screen
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)), // Round top corners
    child: BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Home',
    backgroundColor: Color(0xFF4CAF50), // Background color for the Home item
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.assignment),
    label: 'Plan',
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.post_add),
    label: 'Post',
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.favorite),
    label: 'Wishlist',
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.person),
    label: 'Account',
    ),
    ],
    currentIndex: _selectedIndex,
    onTap: _onItemTapped,
    selectedItemColor: Colors.white,
    unselectedItemColor: Color(0xFFD0E8D0),
    showUnselectedLabels: true,
    backgroundColor: Color(0xFF4CAF50), // Set background color for the navigation bar
      ),
      ),
    );
  }
}
