

import 'package:flutter/material.dart';
import 'package:ui_task/model/holiday%20page%20model/holiday_model.dart';

import 'package:intl/intl.dart';

class HolidayViewModel extends ChangeNotifier {
  DateTime _focusedDay = DateTime(2025, 6, 1);
  DateTime get focusedDay => _focusedDay;

  void updateFocusedDay(DateTime newDate) {
    _focusedDay = newDate;
    notifyListeners();
  }

  final List<Holiday> holidays = [
    Holiday(date: DateTime(2025, 6, 17), name: "Bakrid", type: "Public Holiday", note: "Company-wide holiday"),
    Holiday(date: DateTime(2025, 8, 15), name: "Independence Day", type: "National Holiday", note: "Paid Leave"),
    Holiday(date: DateTime(2025, 10, 23), name: "Diwali", type: "Optional", note: "Can be applied"),
  ];

  final List<DateTime> publicHolidays = [DateTime(2025, 6, 3), DateTime(2025, 6, 12)];
  final List<DateTime> optionalHolidays = [DateTime(2025, 6, 20)];
  final List<DateTime> companyHolidays = [DateTime(2025, 6, 16), DateTime(2025, 6, 17), DateTime(2025, 6, 25)];

  String get monthYearLabel => DateFormat('MMMM yyyy').format(_focusedDay);

  int get remainingDays {
    final today = DateTime.now();
    final lastDayOfMonth = DateTime(_focusedDay.year, _focusedDay.month + 1, 0);
    return lastDayOfMonth.difference(today).inDays;
  }

  bool isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  Color? getDayColor(DateTime day) {
    if (publicHolidays.any((d) => isSameDay(d, day))) return Colors.green;
    if (optionalHolidays.any((d) => isSameDay(d, day))) return Colors.yellow;
    if (companyHolidays.any((d) => isSameDay(d, day))) return Colors.blue;
    return null;
  }
}
