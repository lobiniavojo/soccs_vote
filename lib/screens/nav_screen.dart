import 'package:flutter/material.dart';
import 'election_history_screen.dart';
import 'election_voting_screen.dart';
import 'election_screen.dart';
import 'profile_screen.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _selectedIndex = 0;

  // Define your screens here
  static final List<Widget> _widgetOptions = <Widget>[
    ElectionScreen(),
    ElectionVotingScreen(), // Index 0 - main election screen
    ProfileScreen(), // Index 1 - election history screen
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
        automaticallyImplyLeading: false, // Remove the back button
        actions: [
          IconButton(
            icon: Icon(Icons.history_edu, size: 34, color: Colors.white), // History icon
            onPressed: () {
              // Navigate to ElectionHistoryScreen when the icon is pressed
              print('History click');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ElectionHistoryScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions[_selectedIndex], // Display the selected screen
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
            icon: Icon(Icons.how_to_vote, size: 40),
            label: 'Election',
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
