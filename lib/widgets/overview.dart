import 'package:flutter/material.dart';
import 'package:ui_task/views/Task%20section/my_tasks_content.dart';
import 'package:ui_task/views/Task%20section/ongoing_tasks_content.dart';
import 'package:ui_task/views/Task%20section/task_tracker_content.dart';
import 'package:ui_task/views/Task%20section/work_summary_content.dart';



enum SelectedTab { none, myTasks, taskTracker, ongoing, workSummary }

class overviewcontent extends StatefulWidget {
  const overviewcontent({super.key});

  @override
  State<overviewcontent> createState() => _overviewcontentState();
}

class _overviewcontentState extends State<overviewcontent> {
  SelectedTab selected = SelectedTab.myTasks;
  String _sortBy = 'Deadline';

  final Color primaryColor = Color(0xFF007AFF);
  final Color backgroundColor = Color(0xFFF6F7FB);

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16, top: 20, bottom: 16),
          child: Text(
            "Overview",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _overviewCard("Presence", "20", Colors.green),
              _overviewCard("Absence", "03", Colors.red),
              _overviewCard("Leaves", "02", Colors.orange),
            ],
          ),
        ),
        Container(
          height: 60,
          margin: const EdgeInsets.symmetric(vertical: 16),
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
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
              const Text('Sort By:', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(width: 12),
              Expanded(
                child: Row(
                  children: ['Deadline', 'Project'].map((label) {
                    bool selectedLabel = _sortBy == label;
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Radio<String>(
                          value: label,
                          groupValue: _sortBy,
                          activeColor: Colors.black,
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          onChanged: (val) => setState(() => _sortBy = val!),
                        ),
                        Text(
                          label,
                          style: TextStyle(
                            color: selectedLabel ? Colors.black : Colors.grey[800],
                          ),
                        ),
                        const SizedBox(width: 16),
                      ],
                    );
                  }).toList(),
                ),
              ),
              InkWell(
                onTap: () {
                  // todo-----------------------------------------------pinne
                },
                borderRadius: BorderRadius.circular(20),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.filter_list),
                ),
              ),
            ],
          ),
        ),
        // Conditional Content
        if (selected == SelectedTab.myTasks)
          MyTasksContent(scrollController: ScrollController())
        else if (selected == SelectedTab.taskTracker)
          TaskTrackerContent(scrollController: ScrollController())
        else if (selected == SelectedTab.ongoing)
          OngoingPendingContent(scrollController: ScrollController())
        else if (selected == SelectedTab.workSummary)
          WorkSummaryContent(scrollController: ScrollController()),
      ],
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
}