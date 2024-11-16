import 'package:flutter/material.dart';

class ElectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(  // Wrap everything in SingleChildScrollView
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'SOCCS ELECTION 2024',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF720082),
                  ),
                ),
              ),
              Divider(thickness: 1, color: Colors.grey),
              SizedBox(height: 10),
              ElectionCategory(title: 'PRESIDENT'),
              Divider(thickness: 1, color: Colors.grey),
              ElectionCategory(title: 'VICE PRESIDENT'),
              Divider(thickness: 1, color: Colors.grey),
              ElectionCategory(title: 'SECRETARY'),
            ],
          ),
        ),
      ),
    );
  }
}

class ElectionCategory extends StatelessWidget {
  final String title;

  ElectionCategory({required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey[700],
          ),
        ),
        SizedBox(height: 10),
        CandidateCard(),
        CandidateCard(),
      ],
    );
  }
}

class CandidateCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[400],
            radius: 30,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Juan Dela Cruz',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFF720082),
                  ),
                ),
                Text(
                  'Partylist',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 4),
                LinearProgressIndicator(
                  value: 0.5, // Adjust the value for different progress
                  color: Color(0xFF720082),
                  backgroundColor: Colors.grey[300],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
