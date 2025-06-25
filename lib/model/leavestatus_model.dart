import 'package:flutter/material.dart';

class LeaveEntry {
  final String date;
  final String type;
  final String status;
  final String reason;
  final Color statusColor;

  LeaveEntry({
    required this.date,
    required this.type,
    required this.status,
    required this.reason,
    required this.statusColor,
  });
}
