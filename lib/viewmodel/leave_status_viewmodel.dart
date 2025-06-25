import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ui_task/model/leavestatus_model.dart';


class LeaveStatusViewModel extends ChangeNotifier {
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;
  int currentIndex = 1;


  final List<DateTime> publicHolidays = [DateTime(2025, 6, 3), DateTime(2025, 6, 12)];
  final List<DateTime> optionalHolidays = [DateTime(2025, 6, 20)];
  final List<DateTime> companyHolidays = [
    DateTime(2025, 6, 16),
    DateTime(2025, 6, 17),
    DateTime(2025, 6, 25),
  ];

  late Map<DateTime, Color> coloredDays;

  LeaveStatusViewModel() {
    coloredDays = {
      for (var d in publicHolidays) DateTime(d.year, d.month, d.day): Colors.green,
      for (var d in optionalHolidays) DateTime(d.year, d.month, d.day): Colors.yellow,
      for (var d in companyHolidays) DateTime(d.year, d.month, d.day): Colors.red,
    };
  }

  List<LeaveEntry> leaveEntries = [
    LeaveEntry(date: "10 June", type: "Sick Leave", status: "Approved", reason: "Fever", statusColor: Colors.green),
    LeaveEntry(date: "20 June", type: "Casual Leave", status: "Pending", reason: "Family Function", statusColor: Colors.orange),
    LeaveEntry(date: "01 July", type: "WFH", status: "Rejected", reason: "No backup", statusColor: Colors.red),
  ];

  bool isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  String get monthYearLabel => DateFormat('MMMM yyyy').format(focusedDay);

  void pickMonth(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: focusedDay,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      initialDatePickerMode: DatePickerMode.year,
    );
    if (picked != null) {
      focusedDay = DateTime(picked.year, picked.month, 1);
      selectedDay = null;
      notifyListeners();
    }
  }

  List<Widget> buildCalendar() {
    final rows = <Widget>[];
    final firstOfMonth = DateTime(focusedDay.year, focusedDay.month, 1);
    final offset = firstOfMonth.weekday % 7;
    final daysInMonth = DateTime(focusedDay.year, focusedDay.month + 1, 0).day;

    final cells = List<DateTime?>.filled(offset, null, growable: true)
      ..addAll(List.generate(daysInMonth, (i) => DateTime(focusedDay.year, focusedDay.month, i + 1)));

    final rowsCount = (cells.length / 7).ceil();
    for (var r = 0; r < rowsCount; r++) {
      rows.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(7, (c) {
          final idx = r * 7 + c;
          return idx < cells.length ? buildDayCell(cells[idx]) : const SizedBox(width: 32, height: 32);
        }),
      ));
    }
    return rows;
  }

  Widget buildDayCell(DateTime? date) {
    if (date == null) return const SizedBox(width: 32, height: 32);
    final clean = DateTime(date.year, date.month, date.day);
    final isSelected = selectedDay != null && isSameDay(clean, selectedDay!);
    final bg = coloredDays[clean];

    return GestureDetector(
      onTap: () {
        selectedDay = clean;
        notifyListeners();
      },
      child: Container(
        width: 32,
        height: 32,
        margin: const EdgeInsets.symmetric(vertical: 4),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : bg,
          shape: BoxShape.rectangle,
        ),
        child: Text(
          '${date.day}',
          style: TextStyle(
            color: isSelected || bg != null ? Colors.white : Colors.black,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
