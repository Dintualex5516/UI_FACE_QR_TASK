import 'package:flutter/material.dart';

/// InfoBox used to display title, value, icon, and optional child widget (progress, text, etc.)
class InfoBox extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Widget? child;

  const InfoBox({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 6)],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(title, style: const TextStyle(fontSize: 11, color: Colors.grey)),
                const SizedBox(width: 18),
                Icon(icon, color: Colors.blue),
              ],
            ),
            const SizedBox(height: 6),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                if (child != null) ...[
                  const SizedBox(height: 8),
                  child!,
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Table cell used inside a Flutter [Table] widget for both headers and data rows.
class TableTextCell extends StatelessWidget {
  final String text;
  final bool isHeader;
  final Color? color;

  const TableTextCell(this.text, {Key? key, this.isHeader = false, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          fontSize: 13,
          color: isHeader ? Colors.blue : (color ?? Colors.black),
        ),
      ),
    );
  }
}

/// Bar chart component used for a simple quarterly overview
class BarChart extends StatelessWidget {
  final String label;
  final int value;

  const BarChart({Key? key, required this.label, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: value * 5.0,
            width: 20,
            color: Colors.blue,
          ),
          const SizedBox(height: 4),
          Text(label),
        ],
      ),
    );
  }
}
