import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Image.asset(
                'assets/images/soccs_logo.png', // Replace with your logo image path
                height: 100, // Adjust size as needed
              ),
              SizedBox(height: 24),

              // LOGIN Text
              Text(
                'LOGIN',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF720082),
                  letterSpacing: 2, // Adjust to mimic outline effect
                ),
              ),
              SizedBox(height: 36),

              // Student ID Field
              TextField(
                decoration: InputDecoration(
                  labelText: 'STUDENT ID',
                  labelStyle: TextStyle(
                    color: Color(0xFF720082),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Password Field
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'PASSWORD',
                  labelStyle: TextStyle(
                    color: Color(0xFF720082),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 36),

              // Login Button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/nav');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF720082),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                ),
                child: Text(
                  'USER LOGIN',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              SizedBox(height: 16),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/adnav');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF720082),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                ),
                child: Text(
                  'ADMIN LOGIN',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              SizedBox(height: 16),

              // Forgot Password Text
              TextButton(
                onPressed: () {
                  // Add forgot password action here
                },
                child: Text(
                  'Forgot password',
                  style: TextStyle(
                    color: Color(0xFF720082),
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}