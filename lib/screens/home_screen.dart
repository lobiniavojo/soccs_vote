import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF720082), // Background color similar to the image
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Image.asset(
                'assets/images/soccs_logo.png', // Replace with your logo image path
                height: 150, // Adjust the size if needed
              ),
              SizedBox(height: 24),

              // SOCCS Text
              Text(
                'SOCCS',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 3, // Adjust to achieve a similar outline effect
                ),
              ),

              // College of Computer Studies Text
              Text(
                'College of Computer Studies\nLSPU SCC',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[300],
                ),
              ),
              SizedBox(height: 36),

              // Next Button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF9F149F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                ),
                child: Text(
                  'Next',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}