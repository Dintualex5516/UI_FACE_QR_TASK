import 'package:flutter/material.dart';

class WorkSummaryContent extends StatelessWidget {
  final ScrollController scrollController;

  WorkSummaryContent({required this.scrollController});

  final List<Map<String, dynamic>> summaries = [
    {"icon": Icons.calendar_today, "title": "Total Working Days", "value": "20"},
    {"icon": Icons.access_time, "title": "Total Hours worked", "value": "160 hours"},
    {"icon": Icons.timelapse, "title": "Average Daily Hours", "value": "8.0 hours"},
    {"icon": Icons.bar_chart, "title": "Productivity Indicator", "value": "80%"},
    {"icon": Icons.folder, "title": "Projects Involved", "value": "Revenue Dashboard"},
    {"icon": Icons.beach_access, "title": "Leave Taken", "value": "2 days"},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 4,
              width: 40,
              margin: EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.grey[300], borderRadius: BorderRadius.circular(2)
              ),
            ),
          ),
          Text("Work Summary", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),

       
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: summaries.map((item) {
              double w = (MediaQuery.of(context).size.width - 48) / 2;
              return Container(
                width: w,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 4)],
                ),
                child: Row(
                  children: [
                    Icon(item["icon"], color: Colors.blue),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item["title"], style: TextStyle(fontSize: 12, color: Colors.grey[700])),
                          SizedBox(height: 4),
                          Text(item["value"], style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
