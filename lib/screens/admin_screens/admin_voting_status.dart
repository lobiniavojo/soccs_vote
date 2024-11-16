import 'package:flutter/material.dart';

class VotingStatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF720082), // Custom purple color for the AppBar
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 40, // Adjust size if needed
              height: 40,
              child: Image.asset(
                'assets/images/soccs_logo.png', // Logo asset path
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'SOCCS',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Title Section
            Text(
              'SOCCS Elections 2024',
              style: TextStyle(
                color: Color(0xFF720082),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Voting Status',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'First Years',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Divider(color: Colors.grey[400], thickness: 1),
            const SizedBox(height: 20),

            // Voting Status Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Voted Column
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Voted:',
                        style: TextStyle(
                          color: Color(0xFF720082),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ...List.generate(6, (index) => VotingStatusItem()),
                    ],
                  ),

                  // Not Yet Voted Column
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Not Yet Voted:',
                        style: TextStyle(
                          color: Color(0xFF720082),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ...List.generate(6, (index) => VotingStatusItem()),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// VotingStatusItem widget to display circle and line
class VotingStatusItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(
            Icons.circle,
            size: 12,
            color: Color(0xFF720082),
          ),
          const SizedBox(width: 10),
          Container(
            width: 100, // Set a fixed width for the line to match the design
            child: Divider(thickness: 1, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
