

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum TaskStatus { notStarted, inProgress, completed, overdue }

enum TaskAction { start, update, complete }

class TaskTrackerContent extends StatefulWidget {
  final ScrollController scrollController;
  TaskTrackerContent({required this.scrollController});

  @override
  _TaskTrackerContentState createState() => _TaskTrackerContentState();
}

class _TaskTrackerContentState extends State<TaskTrackerContent> {
  TaskStatus _status1 = TaskStatus.inProgress;
  TaskStatus _status2 = TaskStatus.notStarted;
  TaskAction? _action1;
  TaskAction? _action2;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: widget.scrollController,
      padding: EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Center(
          child: Container(
            height: 4,
            width: 40,
            margin: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
        Text(
          "Task Tracker",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        _buildTask(
          "UI/UX Design Implementation",
          "18‑06‑2025",
          69,
          _status1,
          (v) => setState(() => _status1 = v),
          _action1,
          (a) => setState(() => _action1 = a),
        ),
        Divider(),
        _buildTask(
          "Responsive Design",
          "18‑06‑2025",
          45,
          _status2,
          (v) => setState(() => _status2 = v),
          _action2,
          (a) => setState(() => _action2 = a),
        ),
        SizedBox(height: 16),
      ]),
    );
  }

  Widget _buildTask(
    String title,
    String dueDate,
    int progress,
    TaskStatus statusValue,
    ValueChanged<TaskStatus> onStatusChange,
    TaskAction? actionValue,
    ValueChanged<TaskAction?> onActionChange,
  ) {
    Color progColor = progress >= 60 ? Colors.green : Colors.orange;

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        Expanded(
          child: Text(title, style: TextStyle(fontSize: 14, color: Color(0xFF008000))
          ),
        ),
              Text("Due Date: $dueDate", style: TextStyle(fontSize: 11,color: Colors.grey[600])),
        
      ]),
      // SizedBox(height: 6),
      
      SizedBox(height: 8),

      
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text("Status:", style: TextStyle(fontWeight: FontWeight.w600)),
          SizedBox(width: 8),
          for (var s in TaskStatus.values)
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Radio<TaskStatus>(
                  value: s,
                  groupValue: statusValue,
                  activeColor: s == TaskStatus.completed ? Colors.green : (s == TaskStatus.inProgress ? Colors.orange : Colors.grey),
                  onChanged: (TaskStatus? v) {
                    if (v != null) onStatusChange(v);
                  },
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),


                Text(
                  describeEnum(s)
                      .replaceAll('notStarted', 'Not Started')
                      .replaceAll('inProgress', 'In Progress'),
                  style: TextStyle(
                    color: s == TaskStatus.completed ? Colors.green : (s == TaskStatus.inProgress ? Colors.orange : Colors.grey),
                    fontSize: 12,
                  ),
                ),
              ]),
            ),
        ]),
      ),

      SizedBox(height: 8),




      // Progress Row with "Progress" label-----------------------------------------


      Row(children: [
        Text("Progress:", style: TextStyle(fontWeight: FontWeight.w600)),
        SizedBox(width: 8),
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 36,
              height: 36,
              child: CircularProgressIndicator(
                value: progress / 100,
                color: progColor,
                backgroundColor: progColor.withOpacity(0.2),
                strokeWidth: 3,
              ),
            ),
            Text("$progress%", style: TextStyle(fontSize: 12)),
          ],
        ),
        SizedBox(width: 30),
        Icon(Icons.access_time, color: Colors.amber, size: 18),
        SizedBox(width: 7),
        Text(
          "2 days \nremaining",
          style: TextStyle(color: Colors.amber[800], fontSize: 12),
        ),
        Spacer(),
        Icon(Icons.edit, color: Colors.grey, size: 18),
        SizedBox(width: 4),
        Text("Assigned by", style: TextStyle(color: Colors.grey[800], fontSize: 12)),
      ]),

      SizedBox(height: 14),

      Text("Priority: Low   Medium   High", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
      SizedBox(height: 12),

      // Action Selection
      Row(children: [
        for (var a in TaskAction.values)
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Radio<TaskAction>(
                value: a,
                groupValue: actionValue,
                activeColor: Colors.blue,
                onChanged: (TaskAction? v) => onActionChange(v),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              Text(describeEnum(a).capitalize(), style: TextStyle(color: Colors.blue, fontSize: 12)),
            ]),
          ),
      ]),

      SizedBox(height: 10),
      
    ]);
  }
}

extension StringCasingExtension on String {
  String capitalize() => this.isNotEmpty ? "${this[0].toUpperCase()}${substring(1)}" : "";
}
