import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_task/viewmodel/holiday_viewmodel.dart';
import 'package:ui_task/widgets/components/holidayscreen_components.dart';
import 'package:ui_task/widgets/dashappbar.dart';
import 'package:intl/intl.dart';

class HolidayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HolidayViewModel(),
      child: Scaffold(
        appBar: AppBarHistory(),
        backgroundColor: Colors.white,
        body: Consumer<HolidayViewModel>(
          builder: (context, vm, _) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      holidayStatBox(
                        title: 'Total\nHolidays',
                        value: '18 days',
                        subtitle: 'in a year',
                        icon: Icons.calendar_today,
                        progressBar: LinearProgressIndicator(
                            value: 0.75,
                            color: Colors.blue,
                            backgroundColor: const Color(0xFFF2F2F5)),
                      ),
                      const SizedBox(width: 12),
                      holidayStatBox(
                        title: 'Upcoming\nHolidays',
                        value: '4',
                        subtitle: '(Bakrid - 17 June)',
                        icon: Icons.calendar_today,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        buildLegendDot(Colors.green, 'Public'),
                        const SizedBox(width: 8),
                        buildLegendDot(Colors.yellow, 'Optional'),
                        const SizedBox(width: 8),
                        buildLegendDot(Colors.blue, 'Company'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildCalendarSection(context, vm),
                  const SizedBox(height: 20),
                  _buildHolidayTable(vm),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCalendarSection(BuildContext context, HolidayViewModel vm) {
    final firstDay = DateTime(vm.focusedDay.year, vm.focusedDay.month, 1);
    final offset = firstDay.weekday % 7;
    final totalDays = DateTime(vm.focusedDay.year, vm.focusedDay.month + 1, 0).day;
    final cells = List<DateTime?>.filled(offset, null, growable: true)..addAll(
      List.generate(totalDays, (i) => DateTime(vm.focusedDay.year, vm.focusedDay.month, i + 1)),
    );

    final rows = (cells.length / 7).ceil();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 8, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
                .map((day) => Text(day,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: day == 'Sun' ? Colors.red : Colors.black)))
                .toList(),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton.icon(
              onPressed: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: vm.focusedDay,
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2030),
                  initialDatePickerMode: DatePickerMode.year,
                );
                if (picked != null) {
                  vm.updateFocusedDay(DateTime(picked.year, picked.month, 1));
                }
              },
              icon: const Icon(Icons.calendar_today, size: 16, color: Colors.black),
              label: Text(vm.monthYearLabel,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black)),
            ),
          ),
          ...List.generate(rows, (r) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(7, (c) {
                final i = r * 7 + c;
                final date = (i < cells.length) ? cells[i] : null;
                if (date == null) return Container(width: 40, height: 40);
                final color = vm.getDayColor(date);
                return Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(4)),
                  alignment: Alignment.center,
                  child: Text(
                    '${date.day}',
                    style: TextStyle(color: color != null ? Colors.white : Colors.black, fontWeight: FontWeight.w600),
                  ),
                );
              }),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildHolidayTable(HolidayViewModel vm) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Table(
        border: TableBorder.symmetric(
          inside: BorderSide(color: Colors.grey.shade300),
          outside: BorderSide(color: Colors.grey.shade300),
        ),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(children: [
            tableCell("Date", isHeader: true),
            ...vm.holidays.map((h) => tableCell(DateFormat('dd MMMM').format(h.date))),
          ]),
          TableRow(children: [
            tableCell("Day", isHeader: true),
            ...vm.holidays.map((h) => tableCell(DateFormat('EEEE').format(h.date))),
          ]),
          TableRow(children: [
            tableCell("Holiday \nName", isHeader: true),
            ...vm.holidays.map((h) => tableCell(h.name)),
          ]),
          TableRow(children: [
            tableCell("Type", isHeader: true),
            ...vm.holidays.map((h) => tableCell(h.type)),
          ]),
          TableRow(children: [
            tableCell("Note", isHeader: true),
            ...vm.holidays.map((h) => tableCell(h.note)),
          ]),
        ],
      ),
    );
  }
}