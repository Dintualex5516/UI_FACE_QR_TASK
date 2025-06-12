

import 'package:flutter/material.dart';
import 'package:ui_task/ongoing_tasks_content.dart';
import 'my_tasks_content.dart';
import 'task_tracker_content.dart';
import 'ongoing_tasks_content.dart';
import 'work_summary_content.dart';

enum SelectedTab { none, myTasks, taskTracker, ongoing, workSummary }
String _sortBy = 'Deadline';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Color primaryColor = Color(0xFF007AFF);
  final Color backgroundColor = Color(0xFFF6F7FB);

  SelectedTab selected = SelectedTab.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top User Info
                  Container(
                    padding: EdgeInsets.all(16),
                    color: Colors.white,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundImage: NetworkImage("https://media.licdn.com/dms/image/v2/D5603AQG8pugqWanzNA/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1722544790022?e=1755129600&v=beta&t=GmN-4Hoar1stXcXngmfE5y2fO6JwPQrpLIulL1wALYs"),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Dintu Alex Varghese", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                              Text("Full‑stack Developer", style: TextStyle(color: Colors.grey[600])),
                            ],
                          ),
                        ),
                        Icon(Icons.notifications, color: primaryColor),
                      ],
                    ),
                  ),

                  // Greeting
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Text("Good Morning,\nDintu Alex Varghese",
                      style: TextStyle(fontSize: 20, color: Colors.black87)),
                  ),

                  // Check-In Card
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("You haven’t Checked‑in yet", style: TextStyle(color: Colors.red)),
                          SizedBox(height: 12),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: Text("Check In"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                              ),
                              SizedBox(width: 12),
                              ElevatedButton(
                                onPressed: null,
                                child: Text("Check Out"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey[300],
                                  foregroundColor: Colors.black54,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Overview Section
                  Padding(
                    padding: EdgeInsets.only(left: 16, top: 20, bottom: 16),
                    child: Text("Overview",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _overviewCard("Presence", "20", Colors.green),
                        _overviewCard("Absence", "03", Colors.red),
                        _overviewCard("Leaves", "02", Colors.orange),
                      ],
                    ),
                  ),

                  // Menu Buttons
                  Container(
                    height: 60,
                    margin: EdgeInsets.symmetric(vertical: 16),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      children: [
                        _tabButton(SelectedTab.myTasks, Icons.task_alt, "My Tasks"),
                        _tabButton(SelectedTab.taskTracker, Icons.timer, "Task Tracker"),
                        _tabButton(SelectedTab.ongoing, Icons.pending_actions, "Ongoing & Pending"),
                        _tabButton(SelectedTab.workSummary, Icons.work_outline, "Work Summary"),
                      ],
                    ),


                    
                  ),
                  

                  Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
  child: Row(
    children: [
      Text('Sort By:', style: TextStyle(fontWeight: FontWeight.w600)),
      SizedBox(width: 12),
      // Horizontal radio options
      Expanded(
        child: Row(
          children: ['Deadline', 'Project'].map((label) {
            bool selected = _sortBy == label;
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio<String>(
                  value: label,
                  groupValue: _sortBy,
                  activeColor: Theme.of(context).primaryColor,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onChanged: (val) => setState(() => _sortBy = val!),
                ),
                Text(label, style: TextStyle(color: selected ? Theme.of(context).primaryColor : Colors.grey[800])),
                SizedBox(width: 16),
              ],
            );
          }).toList(),
        ),
      ),
      // Filter icon button
      InkWell(
        onTap: () {
          // TODO: Handle filter tap
        },
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.filter_list, color: Theme.of(context).primaryColor),
        ),
      ),
    ],
  ),
),

                  // Inline Content
                  if (selected == SelectedTab.myTasks)
                    MyTasksContent(scrollController: ScrollController())
                  else if (selected == SelectedTab.taskTracker)
                    TaskTrackerContent(scrollController: ScrollController())
                  else if (selected == SelectedTab.ongoing)
                    OngoingPendingContent(scrollController: ScrollController())
                  else if (selected == SelectedTab.workSummary)
                    WorkSummaryContent(scrollController: ScrollController()),

                  // Dashboard Section (pushed down)
                      Divider(),
                  Padding(
                    padding: EdgeInsets.only(left: 16,  bottom: 16),
                    child: Text("Dashboard", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: GridView.count(
                      crossAxisCount: 3,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        _dashboardItem(Icons.calendar_month, "Attendance", Colors.green),
                        _dashboardItem(Icons.logout, "Leaves", Colors.orange),
                        _dashboardItem(Icons.check_circle, "Leave Status", Colors.purple),
                        _dashboardItem(Icons.list_alt, "Holiday List", Colors.blue),
                        _dashboardItem(Icons.receipt_long, "Payslip", Colors.teal),
                        _dashboardItem(Icons.bar_chart, "Reports", Colors.red),
                      ],
                    ),
                  ),

                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(fontSize: 12),
        unselectedLabelStyle: TextStyle(fontSize: 12),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 24), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.history, size: 24), label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.time_to_leave, size: 24), label: "Leave"),
          BottomNavigationBarItem(icon: Icon(Icons.person, size: 24), label: "Profile"),
        ],
      ),
    );
  }

  Widget _tabButton(SelectedTab tab, IconData icon, String label) {
    final bool active = selected == tab;
    return Padding(
      padding: EdgeInsets.only(right: 12),
      child: ElevatedButton.icon(
        onPressed: () {
          setState(() {
            selected = active ? SelectedTab.none : tab;
          });
        },
        icon: Icon(icon, color: active ? primaryColor : Colors.grey),
        label: Text(label, style: TextStyle(color: active ? primaryColor : Colors.grey[800])),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          side: BorderSide(color: active ? primaryColor : Colors.grey.shade300),
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  Widget _overviewCard(String title, String count, Color color) {
    return Container(
      width: 100,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
      ),
      child: Column(
        children: [
          Text(count, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
          SizedBox(height: 4),
          Text(title, style: TextStyle(color: Colors.grey[700])),
        ],
      ),
    );
  }

  Widget _dashboardItem(IconData icon, String label, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(radius: 28, backgroundColor: color.withOpacity(0.2),
          child: Icon(icon, color: color, size: 28)),
        SizedBox(height: 6),
        Text(label, textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
