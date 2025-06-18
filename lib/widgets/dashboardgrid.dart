import 'package:flutter/material.dart';

class DashboardGrid extends StatelessWidget {
  const DashboardGrid({super.key});

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
            children: const [
              _DashboardItem(Icons.calendar_month, "Attendance", Colors.green),
              _DashboardItem(Icons.logout, "Leaves", Colors.orange),
              _DashboardItem(Icons.check_circle, "Leave Status", Colors.purple),
              _DashboardItem(Icons.list_alt, "Holiday List", Colors.blue),
              _DashboardItem(Icons.receipt_long, "Payslip", Colors.teal),
              _DashboardItem(Icons.bar_chart, "Reports", Colors.red),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

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
