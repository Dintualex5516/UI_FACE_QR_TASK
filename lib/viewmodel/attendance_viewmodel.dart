import 'package:flutter/material.dart';
import 'package:ui_task/model/attendancemodel.dart';


extension DateHelpers on DateTime {
  String get monthName {
    const names = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
    return names[month - 1];
  }
  int get daysInMonth => DateTime(year, month + 1, 0).day;
}

class AttendanceViewModel extends ChangeNotifier {
  DateTime focusedDay = DateTime(2025, 6, 1);
  DateTime? selectedDay;

  final Map<DateTime, Color> highlightDays = {
    DateTime(2025, 6, 3): Colors.green,
    DateTime(2025, 6, 5): Colors.green,
    DateTime(2025, 6, 10): Colors.green,
    DateTime(2025, 6, 12): Colors.green,
    DateTime(2025, 6, 15): Colors.red,
    DateTime(2025, 6, 20): Colors.orange,
  };

  final Map<String, double> stats = {
    "Presence": 20,
    "Absence": 3,
    "Leaves": 2,
    "Late": 6,
  };

  final Map<String, Color> statColors = {
    "Presence": Colors.green,
    "Absence": Colors.red,
    "Leaves": Colors.orange,
    "Late": Colors.blue,
  };

  void changeMonth(int offset) {
    focusedDay = DateTime(focusedDay.year, focusedDay.month + offset, 1);
    notifyListeners();
  }

  void changeYear(int year) {
    focusedDay = DateTime(year, focusedDay.month, 1);
    notifyListeners();
  }

  void selectDay(DateTime day) {
    selectedDay = day;
    notifyListeners();
  }

  AttendanceData get selectedDayData => AttendanceData(
    date: selectedDay ?? DateTime.now(),
    status: "Present",
    checkIn: "09:30 AM",
    checkOut: "06:00 PM",
    workMode: "Office",
    verification: "Selfie",
    location: "Lat: 13.05, Long: 80.24",
    notes: "Worked On UI Bug Fixing",
  );
}
