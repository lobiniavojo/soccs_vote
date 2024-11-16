import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'admin_voting_status.dart';

class ElectionStatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF720082), // Custom color for the app bar
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              child: Image.asset(
                'assets/images/soccs_logo.png', // Logo asset path
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
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 20),
          Column(
            children: [
              Text(
                'SOCCS Election 2024',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF720082),
                ),
              ),
              Text(
                'Voting Status',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
              Divider(color: Colors.black, thickness: 1),
            ],
          ),
          SizedBox(height: 20),
          // Set fixed height for the chart
          SizedBox(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 60,
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          const style = TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          );
                          switch (value.toInt()) {
                            case 0:
                              return Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: Text('First Year', style: style),
                              );
                            case 1:
                              return Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: Text('Second Year', style: style),
                              );
                            case 2:
                              return Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: Text('Third Year', style: style),
                              );
                            case 3:
                              return Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: Text('Fourth Year', style: style),
                              );
                          }
                          return Text('', style: style);
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 10,
                        reservedSize: 28,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          return Text(
                            '${value.toInt()}',
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          );
                        },
                      ),
                    ),
                  ),
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.symmetric(horizontal: BorderSide(color: Colors.grey)),
                  ),
                  barGroups: [
                    BarChartGroupData(
                      x: 0,
                      barRods: [
                        BarChartRodData(
                          toY: 25,
                          color: Color(0xFF720082),
                          width: 20,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 1,
                      barRods: [
                        BarChartRodData(
                          toY: 30,
                          color: Color(0xFF720082),
                          width: 20,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 2,
                      barRods: [
                        BarChartRodData(
                          toY: 20,
                          color: Color(0xFF720082),
                          width: 20,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 3,
                      barRods: [
                        BarChartRodData(
                          toY: 50,
                          color: Color(0xFF720082),
                          width: 20,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          // Containers for each year level with gradient background
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  // Navigate to the First Year screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VotingStatusScreen()),
                  );
                },
                child: YearLevelContainer(label: 'First Year'),
              ),
              YearLevelContainer(label: 'Second Year'),
              YearLevelContainer(label: 'Third Year'),
              YearLevelContainer(label: 'Fourth Year'),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

// Custom container widget with gradient for each year level
class YearLevelContainer extends StatelessWidget {
  final String label;

  YearLevelContainer({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: Color(0xFF720082), // Solid color instead of gradient
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
