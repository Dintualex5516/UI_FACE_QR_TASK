import 'package:flutter/material.dart';
// import 'package:ui_task/views/dashboard%20pages/HolidayList/holidaylist.dart';
import 'package:ui_task/views/dashboard%20pages/HolidayList/holydaylist_view.dart';
import 'package:ui_task/views/dashboard%20pages/attendancescreen/attendancescreen.dart';
import 'package:ui_task/views/dashboard%20pages/leave%20status/leave_status_view.dart';
// import 'package:ui_task/views/dashboard%20pages/leave%20status/leavestatus_screen.dart';
import 'package:ui_task/views/dashboard%20pages/leaves/leavescreen.dart';



class _DashboardItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _DashboardItem(this.icon, this.label, this.color);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: color.withOpacity(0.2),
          child: Icon(icon, color: color, size: 28),
        ),
        const SizedBox(height: 6),
        Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
class DashboardGrid extends StatelessWidget {
  const DashboardGrid({super.key});

  // Define placeholder callbacks here
  void _onAttendanceTap(BuildContext context) {
    Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) =>  AttendanceCalendarScreen(),
    ),
  );
  }

  void _onLeavesTap(BuildContext context) {
    Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const ApplyLeaveScreen(),
    ),
  );
    
  }

  void _onLeaveStatusTap(BuildContext context) {
      Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const LeaveStatusScreen(),
    ),
  );
  }

  void _onHolidayListTap(BuildContext context) {
    Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) =>  HolidayScreen(),
    ),
  );
  }

  void _onPayslipTap(BuildContext context) {
    // TODO: implement Payslip navigation
  }

  void _onReportsTap(BuildContext context) {
    // TODO: implement Reports navigation
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16, bottom: 16),
          child: Text(
            "Dashboard",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              InkWell(
                onTap: () => _onAttendanceTap(context),
                child: const _DashboardItem(Icons.calendar_month, "Attendance", Colors.green),
              ),
              InkWell(
                onTap: () => _onLeavesTap(context),
                child: const _DashboardItem(Icons.logout, "Leaves", Colors.orange),
              ),
              InkWell(
                onTap: () => _onLeaveStatusTap(context),
                child: const _DashboardItem(Icons.check_circle, "Leave Status", Colors.purple),
              ),
              InkWell(
                onTap: () => _onHolidayListTap(context),
                child: const _DashboardItem(Icons.list_alt, "Holiday List", Colors.blue),
              ),
              InkWell(
                onTap: () => _onPayslipTap(context),
                child: const _DashboardItem(Icons.receipt_long, "Payslip", Colors.teal),
              ),
              InkWell(
                onTap: () => _onReportsTap(context),
                child: const _DashboardItem(Icons.bar_chart, "Reports", Colors.red),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
