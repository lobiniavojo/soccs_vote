import 'package:flutter/material.dart';
import 'admin_manage_candidate_screen.dart';
import 'admin_election_status_screen.dart';

class AdminManageScreen extends StatelessWidget {
  final List<Election> elections = [
    Election(year: 2024, isActive: true),
    Election(year: 2023, isActive: false),
    Election(year: 2022, isActive: false),
    Election(year: 2021, isActive: false),
  ];

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
                  'MANAGE VOTING 2024',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF720082),
                  ),
                ),
              ),
              Divider(thickness: 1, color: Colors.grey),
              SizedBox(height: 10),
              ...elections.map((election) {
                return Column(
                  children: [
                    ElectionCard(election: election),
                    Divider(thickness: 1, color: Colors.grey),
                    SizedBox(height: 10),
                  ],
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}

class ElectionCard extends StatelessWidget {
  final Election election;

  ElectionCard({required this.election});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.purple.shade700,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'SOCCS Election ${election.year}',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Ensures even spacing between the children
              children: [
                StatusBadge(isActive: election.isActive),
                SizedBox(width: 10), // Space between status badge and buttons
                Expanded(  // Make the buttons take equal width
                  child: ActionButton(
                    label: 'Manage Candidates',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ManageCandidatesScreen()),
                      );
                    },
                  ),
                ),
                SizedBox(width: 5), // Small space between buttons
                Expanded(  // Make the buttons take equal width
                  child: ActionButton(
                    label: 'View Voting Status',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ElectionStatusScreen()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class StatusBadge extends StatelessWidget {
  final bool isActive;

  StatusBadge({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
      decoration: BoxDecoration(
        color: isActive ? Colors.green.shade200 : Colors.red.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isActive ? Icons.check_circle : Icons.cancel,
            color: isActive ? Colors.green : Colors.red,
            size: 15,
          ),
          SizedBox(width: 3),
          Flexible(
            child: Text(
              isActive ? 'ACTIVE' : 'INACTIVE',
              style: TextStyle(
                color: isActive ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  ActionButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF9F149F),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.symmetric(horizontal: 11, vertical: 6),
        alignment: Alignment.center,
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}


class Election {
  final int year;
  final bool isActive;

  Election({required this.year, required this.isActive});
}
