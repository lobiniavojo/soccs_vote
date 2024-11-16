import 'package:flutter/material.dart';

class ElectionHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF720082),  // Purple color for the app bar
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 40,  // Adjust size if needed
              height: 40,
              child: Image.asset(
                'assets/images/soccs_logo.png',  // Logo asset
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: 8),
            Text(
              'SOCCS',
              style: TextStyle(fontSize: 20, color: Colors.white),  // Title text style
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,  // Background color (similar to ProfileScreen)
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: Text(
                'Election History',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF720082),  // Purple color
                ),
              ),
            ),
            Divider(color: Colors.grey),
            ElectionYearSection(year: "2023"),
            Divider(color: Colors.grey),
            ElectionYearSection(year: "2022"),
            Divider(color: Colors.grey),
            ElectionYearSection(year: "2021"),
          ],
        ),
      ),
    );
  }
}

class ElectionYearSection extends StatelessWidget {
  final String year;

  ElectionYearSection({required this.year});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SOCCS Election $year',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF720082),  // Purple color
          ),
        ),
        SizedBox(height: 8),
        ElectionPosition(title: 'President', name: 'Name'),
        ElectionPosition(title: 'Vice President', name: 'Name'),
        ElectionPosition(title: 'Secretary', name: 'Name'),
        ElectionPosition(title: 'Treasurer', name: 'Name'),
        ElectionPosition(title: 'P.I.O', name: 'Name'),
        ElectionPosition(title: 'Representative', name: 'Name'),
        ElectionPosition(title: 'Representative', name: 'Name'),
      ],
    );
  }
}

class ElectionPosition extends StatelessWidget {
  final String title;
  final String name;

  ElectionPosition({required this.title, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],  // Grey color for the title
            ),
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF720082),  // Purple color for the name
            ),
          ),
        ],
      ),
    );
  }
}
