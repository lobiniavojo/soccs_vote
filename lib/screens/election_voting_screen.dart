import 'package:flutter/material.dart';

class ElectionVotingScreen extends StatefulWidget {
  @override
  _ElectionVotingScreenState createState() => _ElectionVotingScreenState();
}

class _ElectionVotingScreenState extends State<ElectionVotingScreen> {
  Map<String, int?> selectedCandidates = {};

  void updateSelectedCandidate(String position, int? candidate) {
    setState(() {
      selectedCandidates[position] = candidate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 16),
              Text(
                'SOCCS ELECTION 2024',
                style: TextStyle(
                    fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF720082)),
              ),
              SizedBox(height: 16),
              Divider(color: Colors.grey),
              ElectionPosition(
                title: 'President',
                selectedCandidate: selectedCandidates['President'],
                onSelect: (candidate) => updateSelectedCandidate('President', candidate),
              ),
              Divider(color: Colors.grey),
              ElectionPosition(
                title: 'Vice President',
                selectedCandidate: selectedCandidates['Vice President'],
                onSelect: (candidate) => updateSelectedCandidate('Vice President', candidate),
              ),
              Divider(color: Colors.grey),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Access Code',
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Submit votes logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF720082),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'Submit Votes',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ElectionPosition extends StatelessWidget {
  final String title;
  final int? selectedCandidate;
  final Function(int?) onSelect;

  ElectionPosition({required this.title, required this.selectedCandidate, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF720082)),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CandidateCard(
              name: 'Juan Dela Cruz',
              party: 'Partylist',
              isSelected: selectedCandidate == 1,
              onTap: () => onSelect(1),
            ),
            SizedBox(width: 16),
            CandidateCard(
              name: 'Maria Clara',
              party: 'Partylist',
              isSelected: selectedCandidate == 2,
              onTap: () => onSelect(2),
            ),
          ],
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

class CandidateCard extends StatelessWidget {
  final String name;
  final String party;
  final bool isSelected;
  final VoidCallback onTap;

  CandidateCard({required this.name, required this.party, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.grey.shade300,
            child: Icon(Icons.person, color: Colors.grey.shade600, size: 40),
          ),
          SizedBox(height: 8),
          Text(name, style: TextStyle(color: Color(0xFF720082), fontWeight: FontWeight.bold)),
          Text(party, style: TextStyle(color: Colors.grey, fontSize: 12)),
          Radio(
            value: isSelected,
            groupValue: true,
            activeColor: Colors.purple,
            onChanged: (bool? selected) {
              if (selected ?? false) {
                onTap();
              }
            },
          ),
        ],
      ),
    );
  }
}
