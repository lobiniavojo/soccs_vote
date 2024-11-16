import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(  // Wrap everything in SingleChildScrollView
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,  // Center the content vertically
            children: [
              Center(
                child: Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF720082),
                  ),
                ),
              ),
              Divider(thickness: 1, color: Colors.grey),
              SizedBox(height: 16),
              // Centering the CircleAvatar widget
              Center(
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey.shade400,
                ),
              ),
              SizedBox(height: 24),
              ProfileField(label: 'Name', value: 'Juan Dela Cruz'),
              ProfileField(label: 'Student No.', value: '0121-1782'),
              ProfileField(label: 'Year Level', value: '4th Year'),
              ProfileField(label: 'Section', value: 'WAM B'),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Show the change password bottom sheet
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                    ),
                    builder: (context) => ChangePasswordSheet(),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // updated property
                  foregroundColor: Color(0xFF720082), // updated property
                  elevation: 2,
                  side: BorderSide(color: Colors.grey.shade300),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Change Password',
                      style: TextStyle(color: Colors.black),
                    ),
                    Icon(Icons.arrow_forward, color: Colors.black),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileField extends StatelessWidget {
  final String label;
  final String value;

  ProfileField({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(color: Color(0xFF720082), fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              value,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

class ChangePasswordSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24, // To prevent overlap with keyboard
      ),
      child: SingleChildScrollView(  // Make the bottom sheet content scrollable
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Change Password',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF720082)
              ),
            ),
            SizedBox(height: 16),
            ProfileField(label: 'Current Password', value: 'WAM B'),
            ProfileField(label: 'New Password', value: 'WAM B'),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Implement the change password functionality here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF720082),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Change Password',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
