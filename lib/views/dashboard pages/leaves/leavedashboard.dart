import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardContent extends StatelessWidget {
  final int pendingRequest;
  final int teamOnLeave;
  final int totalDays;
  final int remainingDays;
  final List<int> quarterlyTaken;
  final List<LeaveModel> upcomingLeaves;

  const DashboardContent({
    Key? key,
    required this.pendingRequest,
    required this.teamOnLeave,
    required this.totalDays,
    required this.remainingDays,
    required this.quarterlyTaken,
    required this.upcomingLeaves,
  }) : super(key: key);

  Widget statBox({
    required String title,
    required String value,
    required IconData icon,
     double iconSize = 28.0,
    String? bottomText,
    double progress = 0.0,
  }) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 6, offset: const Offset(0, 3))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontSize: 13, color: Colors.grey)),
                    const SizedBox(height: 6),
                    Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),Icon(icon, color: Colors.blue, size: 20),
              
            ],
          ),
          const SizedBox(height: 8),
          if (progress > 0)
            LinearProgressIndicator(
              value: progress,
              minHeight: 4,
              color: Colors.blue,
              backgroundColor: Colors.blue.shade100,
            ),
          if (bottomText != null) ...[
            const SizedBox(height: 8),
            Text(bottomText, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ],
      ),
    );
  }

  Widget _buildBarChart() => BarChart(
    BarChartData(
      alignment: BarChartAlignment.spaceAround,
      barTouchData: BarTouchData(enabled: false),
      titlesData: FlTitlesData(
        leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, _) {
              const labels = ['Q1', 'Q2', 'Q3', 'Q4'];
              return Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(labels[value.toInt()], style: const TextStyle(fontSize: 12)),
              );
            },
            reservedSize: 28,
          ),
        ),
      ),
      borderData: FlBorderData(show: false),
      barGroups: List.generate(4, (index) => BarChartGroupData(
        x: index,
        barRods: [BarChartRodData(
          toY: quarterlyTaken[index].toDouble(),
          color: Colors.blue,
          borderRadius: BorderRadius.circular(4),
          width: 16,
        )],
      )),
      gridData: FlGridData(show: false),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final labelStyle = TextStyle(color: Colors.grey[700]);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Flexible(fit: FlexFit.loose, child: statBox(
            title: 'Total Leave Taken',
            value: '$totalDays days',
            icon: Icons.event,
            progress: totalDays / (totalDays + remainingDays),
            bottomText: '$remainingDays days remaining',
          )),
          const SizedBox(width: 8),
          Flexible(fit: FlexFit.loose, child: statBox(
            title: 'Approval Rate',
            value: '92%',
            icon: Icons.pie_chart,
            bottomText: '$remainingDays days remaining',
          )),
        ]),
        const SizedBox(height: 12),
        Row(children: [
          Flexible(fit: FlexFit.loose, child: statBox(
            title: 'Pending Request',
            value: pendingRequest.toString(),
            icon: Icons.hourglass_bottom,
            bottomText: '$remainingDays days remaining',
          )),
          const SizedBox(width: 8),
          Flexible(fit: FlexFit.loose, child: statBox(
            title: 'Member on Leave',
            value: teamOnLeave.toString(),
            icon: Icons.group,
            bottomText: '$remainingDays days remaining',
          )),
        ]),
        const SizedBox(height: 24),
        const Text('Leave Overview', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Container(
          height: 160,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: const Color(0xFFF6F7FB), borderRadius: BorderRadius.circular(12)),
          child: _buildBarChart(),
        ),
        const SizedBox(height: 16),
        Divider(),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Total days', style: labelStyle),
          Text('Remaining', style: labelStyle),
        ]),
        const SizedBox(height: 4),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('$totalDays', style: const TextStyle(fontWeight: FontWeight.bold)),
          Text('$remainingDays', style: const TextStyle(fontWeight: FontWeight.bold)),
        ]),Divider(),
        const SizedBox(height: 24),
        const Text('  Upcoming Leave', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const Text('   Your Scheduled Time Off', style: TextStyle(fontSize: 12)),
        const SizedBox(height: 12),
        for (final l in upcomingLeaves)
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(3),
                boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 6, offset: const Offset(0, 3))],
              ),
              child: Row(children: [
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(l.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    const SizedBox(height: 4),
                    Text(
                      '${DateFormat('MMM d, yyyy').format(l.from)} to ${DateFormat('MMM d, yyyy').format(l.to)} (${l.days} days)',
                      style: const TextStyle(color: Colors.grey,fontSize: 13),
                    ),
                  ]),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: l.status == LeaveStatus.pending ? Colors.orange.shade100 : Colors.green.shade100,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    l.status == LeaveStatus.pending ? 'Pending' : 'Approved',
                    style: TextStyle(
                      color: l.status == LeaveStatus.pending ? const Color.fromARGB(255, 10, 10, 10) : Colors.green,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ]),
            ),
          ),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: Colors.orange.shade50, borderRadius: BorderRadius.circular(8)),
          child: Row(children: const [
            Icon(Icons.info_outline, color: Color.fromARGB(255, 15, 15, 15)),
            SizedBox(width: 9),
            Expanded(child: 
            Text('Pending Approval \t\nYour Leave request i swaiting manager approval', style: TextStyle(color: Color.fromARGB(255, 19, 19, 18))),
            
            ),
          ]),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}

class LeaveModel {
  final String title;
  final DateTime from;
  final DateTime to;
  final int days;
  final LeaveStatus status;

  LeaveModel({
    required this.title,
    required this.from,
    required this.to,
    required this.days,
    required this.status,
  });
}

enum LeaveStatus { pending, approved }
