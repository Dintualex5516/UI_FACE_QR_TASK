import 'package:flutter/material.dart';

Widget buildLegendDot(Color color, String label) {
  return Row(
    children: [
      Container(width: 12, height: 12, decoration: BoxDecoration(color: color, shape: BoxShape.rectangle)),
      const SizedBox(width: 4),
      Text(label),
    ],
  );
}

Widget holidayStatBox({required String title, required String value, required String subtitle, required IconData icon, Widget? progressBar}) {
  return Flexible(
    flex: 1,
    child: Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(title, style: TextStyle(color: Colors.grey[700])), Icon(icon, color: Colors.blue)],
          ),
          const SizedBox(height: 12),
          Text(value, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Text(subtitle, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          if (progressBar != null) ...[const SizedBox(height: 5), progressBar],
        ],
      ),
    ),
  );
}

Widget tableCell(String text, {bool isHeader = false}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
        color: isHeader ? Colors.blue : Colors.black,
        fontSize: 13,
      ),
    ),
  );
}
