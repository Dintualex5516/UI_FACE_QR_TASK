import 'package:flutter/material.dart';



class MyTasksContent extends StatelessWidget {
  final ScrollController scrollController;
  MyTasksContent({required this.scrollController});


  final List<Map<String, String>> tasks = [
    {
      "title": "UI/UX design implementation",
      "desc": "translating design specifications   into functional and visually appealing user interfaces."
    },
    {
      "title": "Responsive design",
      "desc": "ensuring the app adapts seamlessly to all devices."
    },
    {
      "title": "Back-end development",
      "desc": "Creating and managing databases effectively."
    },
    {
      "title": "Server‑Side logic",
      "desc": "Handling server platform logic and APIs.."
    },
  ];

  @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(
      
      controller: scrollController,
      padding: EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Center(
          child: Container(height: 4, width: 40, margin: EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2))),
        ),
        
        Text("My tasks", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 16),
        ...tasks.map((t) => Padding(
          padding: EdgeInsets.only(bottom: 16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(t["title"]!,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF008000))),
            SizedBox(height: 4),
            Text(t["desc"]!, style: TextStyle(color: Colors.grey[700])),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Start"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  elevation: 0,
                ),
              ),
            ),
            Divider(),
          ]),
        ))
      ]),
    );
  }
}
