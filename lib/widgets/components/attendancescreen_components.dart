import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

Widget buildOverviewBox(String key, double value, Color color) => Container(
      width: 80,
      height: 90,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(key, style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text(value.toInt().toString().padLeft(2, '0'),
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );

Widget buildDetailBox(String label, String value, Color bgColor, Color textColor) => Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          SizedBox(height: 6),
          Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
            decoration: BoxDecoration(color: textColor, borderRadius: BorderRadius.circular(5)),
            child: Text(value, style: TextStyle(color: Colors.white, fontSize: 12)),
          ),
        ],
      ),
    );

Widget buildPieChart(Map<String, double> stats, Map<String, Color> colors) => AspectRatio(
      aspectRatio: 1,
      child: PieChart(
        PieChartData(
          sections: stats.entries.map((e) {
            return PieChartSectionData(
              value: e.value,
              color: colors[e.key],
              radius: 90,
              title: '${e.value.toInt()} \n Days',
              titleStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
              titlePositionPercentageOffset: 0.6,
            );
          }).toList(),
          centerSpaceRadius: 70,
          sectionsSpace: 2,
        ),
      ),
    );
