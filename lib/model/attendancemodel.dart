import 'package:flutter/material.dart';

class AttendanceData {
  final DateTime date;
  final String status;
  final String checkIn;
  final String checkOut;
  final String workMode;
  final String verification;
  final String location;
  final String notes;

  AttendanceData({
    required this.date,
    required this.status,
    required this.checkIn,
    required this.checkOut,
    required this.workMode,
    required this.verification,
    required this.location,
    required this.notes,
  });
}
