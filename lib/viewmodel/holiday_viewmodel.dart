import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/model/holiday page model/holiday_model.dart';

class HolidayViewModel extends ChangeNotifier {
  DateTime _focusedDay = DateTime(2025, 6, 1);
  DateTime get focusedDay => _focusedDay;

  List<DateTime> publicHolidays = [
    DateTime(2025, 6, 3),
    DateTime(2025, 6, 12),
  ];

  List<DateTime> optionalHolidays = [
    DateTime(2025, 6, 20),
  ];

  List<DateTime> companyHolidays = [
    DateTime(2025, 6, 16),
    DateTime(2025, 6, 17),
    DateTime(2025, 6, 25),
  ];

  final List<Holiday> holidayList = [
    Holiday(
      date: DateTime(2025, 6, 17),
      day: 'Tuesday',
      name: 'Bakrid',
      type: 'Public Holiday',
      note: 'Company-wide holiday',
    ),
    Holiday(
      date: DateTime(2025, 8, 15),
      day: 'Thursday',
      name: 'Independence Day',
      type: 'National Holiday',
      note: 'Paid Leave',
    ),
    Holiday(
      date: DateTime(2025, 10, 23),
      day: 'Wednesday',
      name: 'Diwali',
      type: 'Optional',
      note: 'Can be applied',
    ),
  ];

  String get monthYearLabel => DateFormat('MMMM yyyy').format(_focusedDay);

  void updateFocusedDay(DateTime picked) {
    _focusedDay = DateTime(picked.year, picked.month, 1);
    notifyListeners();
  }

  bool isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  int get remainingDays {
    final today = DateTime.now();
    final lastDayOfMonth = DateTime(_focusedDay.year, _focusedDay.month + 1, 0);
    return lastDayOfMonth.difference(today).inDays;
  }

  List<List<DateTime?>> buildCalendarDays() {
    DateTime firstDayOfMonth = DateTime(_focusedDay.year, _focusedDay.month, 1);
    int weekdayOffset = firstDayOfMonth.weekday % 7;
    int daysInMonth = DateTime(_focusedDay.year, _focusedDay.month + 1, 0).day;

    List<DateTime?> days = List<DateTime?>.filled(weekdayOffset, null, growable: true);
    for (int i = 0; i < daysInMonth; i++) {
      days.add(DateTime(_focusedDay.year, _focusedDay.month, i + 1));
    }

    int totalRows = (days.length / 7).ceil();
    List<List<DateTime?>> calendarRows = [];

    for (int i = 0; i < totalRows; i++) {
      calendarRows.add(days.skip(i * 7).take(7).toList());
    }

    return calendarRows;
  }

  Color? getCellColor(DateTime date) {
    if (publicHolidays.any((d) => isSameDay(d, date))) {
      return Colors.green;
    } else if (optionalHolidays.any((d) => isSameDay(d, date))) {
      return Colors.yellow;
    } else if (companyHolidays.any((d) => isSameDay(d, date))) {
      return Colors.blue;
    }
    return null;
  }
}
