import 'package:flutter/material.dart';
import 'admin_election_screen.dart';
import 'admin_manage_screen.dart';
import 'admin_profile.dart';


class AdminNavScreen extends StatefulWidget {
  @override
  _AdminNavScreenState createState() => _AdminNavScreenState();
}

class _AdminNavScreenState extends State<AdminNavScreen> {
  int _selectedIndex = 0;

  // Define your screens here
  static final List<Widget> _widgetOptions = <Widget>[
    AdminElectionScreen(),
    AdminManageScreen(),
    AdminProfileScreen(),

  ];

  // This function is called when an item is tapped in BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF720082),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 40, // Adjust size if needed
              height: 40,
              child: Image.asset(
                'assets/images/soccs_logo.png', // Logo asset
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: 8),
            Text(
              'SOCCS',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ],
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_copy_outlined, size: 40,),
            label: 'Manage',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        backgroundColor: Color(0xFF720082),
      ),
    );
  }
}
