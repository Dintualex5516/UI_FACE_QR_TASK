
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:ui_task/widgets/bottomnavigation.dart';
import 'package:ui_task/widgets/components/reportscreen.dart';
import 'dart:math';

import 'package:ui_task/widgets/dashappbar.dart'; // your custom AppBarHistory

class AttendanceReportScreen extends StatefulWidget {
  const AttendanceReportScreen({super.key});

  @override
  State<AttendanceReportScreen> createState() => _AttendanceReportScreenState();
}

class _AttendanceReportScreenState extends State<AttendanceReportScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarHistory(),  
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Reports',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Summary cards grid
              GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.4,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: const [
                  SummaryCard(
                    title: "Total Working\nDays\n(This Month)",
                    value: "22 days",
                    icon: Icons.calendar_month,
                  ),
                  SummaryCard(
                    title: "Total Hours\nWorked",
                    value: "145 hrs",
                    icon: Icons.schedule,
                  ),
                  SummaryCard(
                    title: "Tasks \nCompleted  ",
                    value: "35 this month",
                    icon: Icons.check_circle_outline,
                  ),
                  SummaryCard(
                    title: "Average\nDaily Hours",
                    value: "6.6 hrs/day",
                    icon: Icons.access_time,
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Clock-in/out log
              const Text(
                "Daily Clock-In/Out Log",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: _buildLogTable(),
              ),

              const SizedBox(height: 24),

              // Attendance legend + chart
              const Text(
                "Attendance",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  LegendDot(color: Colors.green, text: 'Present'),
                  SizedBox(width: 16),
                  LegendDot(color: Colors.red, text: 'Absence'),
                  SizedBox(width: 16),
                  LegendDot(color: Colors.blue, text: 'Avg hrs'),
                ],
              ),
              const SizedBox(height: 1),
              const SizedBox(height: 250, child: ChartPreview()),

              // Bottom navigation space
              // const SizedBox(height: kBottomNavigationBarHeight),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 1,
        onTap: (int value) {},
      ),
    );
  }


Widget _buildLogTable() {
  final rows = [
    ["Date", "Check-in", "Check-out", " Total Hrs", "Status"],
    ["June 21", "09:15 AM", "05:45 PM", " 8.5 hrs", "Present"],
    ["June 22", "--", "--", " 0 hrs", "Absent"],
    ["June 23", "09:30 AM", "04:00 PM"," 6.5 hrs", "Half Day"],
  ];

  return Column(
    children: rows.map((row) {
      final isHeader = row == rows.first;
      final status = row.length > 4 ? row[4] : '';
      final statusColor = {
        "Present": Colors.green,
        "Absent": Colors.red,
        "Half Day": Colors.orange,
      }[status] ?? Colors.black87;

      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 1),
            child: Row(
              children: row.asMap().entries.map((e) {
                final idx = e.key;
                return Expanded(
                  flex: idx == 1 ? 2 : 2,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      e.value,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight:
                            isHeader ? FontWeight.bold : FontWeight.normal,
                        color: isHeader
                            ? Colors.black
                            : (idx == 4 ? statusColor : Colors.black87),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          if (!isHeader)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: CustomPaint(
                painter: DottedLinePainter(),
                size: const Size(double.infinity, 1),
              ),
            ),
        ],
      );
    }).toList(),
  );
}

}

// Summary 
class SummaryCard extends StatelessWidget {
  final String title, value;
  final IconData icon;
  const SummaryCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext ctx) => Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(title,
                    style:
                        const TextStyle(fontSize: 12, color: Colors.black54,fontWeight: FontWeight.bold)),SizedBox(width: 32), 
                        Icon(icon, size: 28, color: Colors.lightBlue),
              ],
            ),
            
            const SizedBox(height: 10),
            Text(value,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            
          ],
        ),
      );
}

// Legend dot UI
class LegendDot extends StatelessWidget {
  final Color color;
  final String text;
  const LegendDot({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext ctx) => Row(
        children: [
          Container(width: 10, height: 10, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
          const SizedBox(width: 5),
          Text(text, style: const TextStyle(fontSize: 12)),
        ],
      );
}


// Dotted line painter
class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const dashWidth = 5.0;
    const dashSpace = 3.0;
    double x = 0;
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 0.8;
    while (x < size.width) {
      canvas.drawLine(Offset(x, 0), Offset(x + dashWidth, 0), paint);
      x += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
