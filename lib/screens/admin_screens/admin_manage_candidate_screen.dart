import 'package:flutter/material.dart';

class ManageCandidatesScreen extends StatelessWidget {
  final List<Position> positions = [
    Position(
      title: "President",
      candidates: [
        Candidate(name: "Juan Dela Cruz", partyList: "Partylist"),
        Candidate(name: "Juan Dela Cruz", partyList: "Partylist"),
      ],
    ),
    Position(
      title: "Vice President",
      candidates: [
        Candidate(name: "Juan Dela Cruz", partyList: "Partylist"),
        Candidate(name: "Juan Dela Cruz", partyList: "Partylist"),
      ],
    ),
    Position(
      title: "Secretary",
      candidates: [
        Candidate(name: "Juan Dela Cruz", partyList: "Partylist"),
        Candidate(name: "Juan Dela Cruz", partyList: "Partylist"),
      ],
    ),
  ];

  void _showAddCandidateForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'ADD CANDIDATE',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF720082)),
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Candidate Name',
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Candidate Position',
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
                dropdownColor: Colors.white, // Ensures the dropdown background is white
                items: positions
                    .map((position) => DropdownMenuItem(
                  child: Text(position.title),
                  value: position.title,
                ))
                    .toList(),
                onChanged: (value) {
                  // Handle selection of position
                },
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Candidate Image',
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Logic to add the candidate
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Add',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF720082), // Custom color for AppBar
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
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _showAddCandidateForm(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Aligns the content to the top
          crossAxisAlignment: CrossAxisAlignment.center, // Centers the text horizontally
          children: [
            Text(
              'SOCCS ELECTION 2024\nMANAGE CANDIDATES',
              textAlign: TextAlign.center, // Centers the text horizontally inside the Text widget
              style: TextStyle(
                  color: Color(0xFF720082),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Divider(thickness: 1, color: Colors.grey),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: positions.length,
                itemBuilder: (context, index) {
                  return PositionSection(position: positions[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PositionSection extends StatelessWidget {
  final Position position;

  PositionSection({required this.position});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center, // This centers the title horizontally in the Column
      children: [
        SizedBox(height: 16),
        // Centering the position title text
        Center(
          child: Text(
            position.title.toUpperCase(),
            style: TextStyle(
                color: Color(0xFF720082),
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
        ),
        Divider(color: Colors.grey),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: position.candidates.map((candidate) {
            return CandidateCard(candidate: candidate);
          }).toList(),
        ),
      ],
    );
  }
}

class CandidateCard extends StatelessWidget {
  final Candidate candidate;

  CandidateCard({required this.candidate});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey.shade400,
        ),
        SizedBox(height: 8),
        Text(
          candidate.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          candidate.partyList,
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                // Edit logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF720082),
                padding: EdgeInsets.symmetric(horizontal: 8),
              ),
              child: Text("Edit"),
            ),
            SizedBox(width: 4),
            ElevatedButton(
              onPressed: () {
                // Remove logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent.shade700,
                padding: EdgeInsets.symmetric(horizontal: 8),
              ),
              child: Text("Remove"),
            ),
          ],
        ),
      ],
    );
  }
}

class Position {
  final String title;
  final List<Candidate> candidates;

  Position({required this.title, required this.candidates});
}

class Candidate {
  final String name;
  final String partyList;

  Candidate({required this.name, required this.partyList});
}
