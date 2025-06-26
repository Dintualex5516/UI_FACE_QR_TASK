import 'package:flutter/material.dart';

class StatBox extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final double iconSize;
  final String? bottomText;
  final double progress;

  const StatBox({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    this.iconSize = 28.0,
    this.bottomText,
    this.progress = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade300, blurRadius: 6, offset: const Offset(0, 3))
        ],
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
              ),
              Icon(icon, color: Colors.blue, size: iconSize),
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
            Text(bottomText!, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ],
      ),
    );
  }
}
