import 'package:flutter/material.dart';

class OngoingPendingContent extends StatelessWidget {
  final ScrollController scrollController;
  OngoingPendingContent({required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      padding: EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Center(
          child: Container(
            height: 4,
            width: 40,
            margin: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2)),
          ),
        ),
        Text("Ongoing & Pending tasks", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        SizedBox(height: 20),
        _buildOngoingTask("UI/UX Design Implementation", "18‑06‑2025", "80%", "Ongoing Task"),
        Divider(),
                SizedBox(height: 20),
        _buildOngoingTask("Responsive Design", "12‑06‑2025", "45%", "Pending Task"),
        SizedBox(height: 20),
      ]),
    );
  }

  Widget _buildOngoingTask(String title, String due, String percent, String status) {
    Color statusColor = status.contains("Ongoing") ? Colors.green : Colors.orange;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: TextStyle(fontSize: 16, color: Color(0xFF008000))),
      SizedBox(height: 20),
      Row(
        children: [
          Text("Status:", ),
          
          Text(" $status", style: TextStyle(color: statusColor)),
        ],
      ),
      SizedBox(height: 4),
      Text("Start date: 12‑05‑2025"),
      Row(
        children: [
          Text("Expected completion :"),
          Text("  $due",style: TextStyle(color: Colors.blueAccent)),
        ],
      ),
      SizedBox(height: 25),
      Row(
        children: [
          Row(
            children: [
              Text("Priority :"),
               Text(" High", style: TextStyle(color: Colors.red)),
            ],
          ),
                  SizedBox(width: 110),
                  Align(
        alignment: Alignment.bottomRight,
        child:ElevatedButton(
  onPressed: () {},
  child: Text("Make as Done"),
 
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0), 
    ),
  ),
)
      ),

        ],
      ) ,
      
      // Align(
      //   alignment: Alignment.bottomRight,
      //   child: ElevatedButton(
      //     onPressed: () {},
      //     child: Text("Make as Done"),
      //     style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white),
      //   ),
      // ),
      SizedBox(height: 8),
     
    ]);
  }
}
