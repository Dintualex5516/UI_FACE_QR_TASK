import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:ui_task/viewmodel/leave_status_viewmodel.dart';
import 'package:ui_task/widgets/bottomnavigation.dart';
import 'package:ui_task/widgets/components/leavestatus_components.dart';
import 'package:ui_task/widgets/dashappbar.dart';

class LeaveStatusScreen extends StatelessWidget {
  const LeaveStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LeaveStatusViewModel(),
      child: const _LeaveStatusViewBody(),
    );
  }
}

class _LeaveStatusViewBody extends StatelessWidget {
  const _LeaveStatusViewBody();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<LeaveStatusViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarHistory(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(children: [
              InfoBox(
                title: "Leave Taken",
                value: "16 days",
                icon: Icons.event_busy,
                child: Column(
                  children: [
                    const SizedBox(height: 4),
                    const Text("10 days remaining this Month", style: TextStyle(fontSize: 9)),
                    const SizedBox(height: 4),
                    LinearProgressIndicator(
                      value: 0.6,
                      color: Colors.blue,
                      backgroundColor: Colors.grey[200],
                    ),
                  ],
                ),
              ),
              InfoBox(
                title: "Leave Balance",
                value: "8 days",
                icon: Icons.calendar_today,
                child: const Text("29 days remaining this month", style: TextStyle(fontSize: 10)),
              ),
            ]),
            Row(children: [
              InfoBox(
                title: "Pending Request",
                value: "1 request",
                icon: Icons.hourglass_bottom,
                child: const Text("29 days remaining this month", style: TextStyle(fontSize: 10)),
              ),
              InfoBox(
                title: "Approved Leaves",
                value: "5 leaves",
                icon: Icons.verified,
                child: const Text("29 days remaining this month", style: TextStyle(fontSize: 10)),
              ),
            ]),
            Row(children: [
              InfoBox(
                title: "Rejected Leaves",
                value: "2 leaves",
                icon: Icons.cancel,
                child: const Text("29 days remaining this month", style: TextStyle(fontSize: 10)),
              ),
              InfoBox(
                title: "Upcoming Leaves",
                value: "1 leave",
                icon: Icons.upcoming,
                child: const Text("29 days remaining this month", style: TextStyle(fontSize: 10)),
              ),
            ]),

            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 6)],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
                        .map((d) => Text(d, style: const TextStyle(fontWeight: FontWeight.bold)))
                        .toList(),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton.icon(
                      onPressed: () async => vm.pickMonth(context),
                      icon: const Icon(Icons.calendar_month, color: Colors.black),
                      label: Text(vm.monthYearLabel,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black)),
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...vm.buildCalendar(),
                ],
              ),
            ),

            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Table(
                border: TableBorder.all(color: Colors.grey.shade400),
                columnWidths: const {
                  0: FlexColumnWidth(1.1),
                  1: FlexColumnWidth(1.6),
                  2: FlexColumnWidth(1.5),
                  3: FlexColumnWidth(1.5),
                },
                children: [
                  TableRow(children: [
                    TableTextCell("Date", isHeader: true),
                    TableTextCell("Leave Type", isHeader: true),
                    TableTextCell("Status", isHeader: true),
                    TableTextCell("Reason", isHeader: true),
                  ]),
                  TableTextCellRow("10 June", "Sick Leave", "Approved", "Fever", Colors.green),
                  TableTextCellRow("20 June", "Casual Leave", "Pending", "Family Function", Colors.orange),
                  TableTextCellRow("01 July", "WFH", "Rejected", "No backup", Colors.red),
                ],
              ),
            ),

            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 6)],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Leave Overview", style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      BarChart(label: "Q1", value: 8),
                      BarChart(label: "Q2", value: 6),
                      BarChart(label: "Q3", value: 3),
                      BarChart(label: "Q4", value: 2),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 6),
                          child: Icon(Icons.circle, color: Colors.blue, size: 8),
                        ),
                        Text(
                          "Leave days taken",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Divider(),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Total days:\n20", style: TextStyle(fontSize: 13)),
                      Text("Remaining:\n29", style: TextStyle(fontSize: 13)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:CustomBottomNavigationBar(currentIndex: 1, onTap: (int value) {  },) ,
    );
  }
}

TableRow TableTextCellRow(String date, String type, String status, String reason, Color statusColor) {
  return TableRow(
    children: [
      TableTextCell(date),
      TableTextCell(type),
      TableTextCell(status, color: statusColor),
      TableTextCell(reason),
    ],
  );
}