import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ui_task/widgets/dashappbar.dart';

class HolidayScreen extends StatefulWidget {
  @override
  _HolidayScreenState createState() => _HolidayScreenState();
}

class _HolidayScreenState extends State<HolidayScreen> {
  DateTime _focusedDay = DateTime(2025, 6, 1);

  final List<DateTime> publicHolidays = [
    DateTime(2025, 6, 3),
    DateTime(2025, 6, 12),
  ];
  final List<DateTime> optionalHolidays = [DateTime(2025, 6, 20)];
  final List<DateTime> companyHolidays = [
    DateTime(2025, 6, 16),
    DateTime(2025, 6, 17),
    DateTime(2025, 6, 25)
  ];

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  String _monthYearLabel() => DateFormat('MMMM yyyy').format(_focusedDay);

  List<Widget> _buildCalendar() {
    final List<Widget> rows = [];

    DateTime firstDayOfMonth = DateTime(_focusedDay.year, _focusedDay.month, 1);
    int weekdayOffset = firstDayOfMonth.weekday % 7;
    int daysInMonth = DateTime(_focusedDay.year, _focusedDay.month + 1, 0).day;

    List<DateTime?> days = List.filled(weekdayOffset, null, growable: true);
    for (int i = 0; i < daysInMonth; i++) {
      days.add(DateTime(_focusedDay.year, _focusedDay.month, i + 1));
    }

    int totalRows = (days.length / 7).ceil();
    for (int i = 0; i < totalRows; i++) {
      rows.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(7, (j) {
          int index = i * 7 + j;
          if (index >= days.length) return _buildDayCell(null);
          return _buildDayCell(days[index]);
        }),
      ));
    }

    return rows;
  }

  Widget _buildDayCell(DateTime? date) {
    if (date == null) {
      return Container(width: 40, height: 40);
    }

    final isSunday = date.weekday == DateTime.sunday;
    final textColor = isSunday ? Colors.red : Colors.black;

    Color? bgColor;
    if (publicHolidays.any((d) => _isSameDay(d, date))) {
      bgColor = Colors.green;
    } else if (optionalHolidays.any((d) => _isSameDay(d, date))) {
      bgColor = Colors.yellow;
    } else if (companyHolidays.any((d) => _isSameDay(d, date))) {
      bgColor = Colors.blue;
    }

    return Container(
      width: 40,
      height: 40,
      margin: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(4),
      ),
      alignment: Alignment.center,
      child: Text(
        '${date.day}',
        style: TextStyle(
          color: bgColor != null ? Colors.white : textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  int get _remainingDays {
    final today = DateTime.now();
    final lastDayOfMonth = DateTime(_focusedDay.year, _focusedDay.month + 1, 0);
    return lastDayOfMonth.difference(today).inDays;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarHistory(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),

            
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(color: Colors.grey.shade300, blurRadius: 4)
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total\nHolidays',
                                style: TextStyle(color: Colors.grey[700])),
                            Icon(Icons.calendar_today, color: Colors.blue),
                          ],
                        ),
                        SizedBox(height: 12),
                        Text('18 days',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        SizedBox(height: 12),Text('in a year',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold)),
                         SizedBox(height: 5),
                        LinearProgressIndicator(
                          value: 0.75,
                          color: Colors.blue,
                          backgroundColor: Color.fromARGB(255, 242, 242, 245),
                        ),
                        
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Flexible(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(color: Colors.grey.shade300, blurRadius: 4)
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Upcoming\nHolidays',
                                style: TextStyle(color: Colors.grey[700])),
                            Icon(Icons.calendar_today, color: Colors.blue),
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Text('4',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold)),
                            SizedBox(width: 15),
                            Text('(Bakrid - 17 June)',
                                style: TextStyle(
                                    fontSize: 8, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        SizedBox(height: 19),
                        Text('$_remainingDays days remaining this month',
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

          // --------------------------------
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Row(
                children: [
                  _buildLegendDot(Colors.green, 'Public'),
                  SizedBox(width: 8),
                  _buildLegendDot(Colors.yellow, 'Optional'),
                  SizedBox(width: 8),
                  _buildLegendDot(Colors.blue, 'Company'),
                ],
              ),
            ),SizedBox(height: 17),

            // calendaar
Container(
  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  padding: const EdgeInsets.all(12),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.3),
        blurRadius: 8,
        offset: Offset(0, 3),
      ),
    ],
  ),
  child: Column(
    children: [
      // Days Row-----------------------
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
            .map((day) => Text(
                  day,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: day == 'Sun' ? Colors.red : Colors.black),
                ))
            .toList(),
      ),

      // Month-Year Selector-------------
      Align(
        alignment: Alignment.centerLeft,
        child: TextButton.icon(
          
          onPressed: () async {
            DateTime? picked = await showDatePicker(
              context: context,
              initialDate: _focusedDay,
              firstDate: DateTime(2020),
              lastDate: DateTime(2030),
              initialDatePickerMode: DatePickerMode.year,
            );
            if (picked != null) {
              setState(() {
                _focusedDay = DateTime(picked.year, picked.month, 1);
              });
            }
          },
          icon: Icon(Icons.calendar_today, size: 16,color: Colors.black,),
          label: Text(
            _monthYearLabel(),
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: Colors.black, ),
          ),
        ),
      ),

      /// Calendar Grid
      ..._buildCalendar(),
    ],
  ),
),


            /// HOLIDAY TABLE
            Container(
  padding: const EdgeInsets.all(16.0),
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
    columnWidths: const {
      0: IntrinsicColumnWidth(),
    },
    children: [
      TableRow(children: [
        _tableCell('Date', isHeader: true),
        _tableCell('17 June'),
        _tableCell('15 August'),
        _tableCell('23 October'),
      ]),
      TableRow(children: [
        _tableCell('Day', isHeader: true),
        _tableCell('Tuesday'),
        _tableCell('Thursday'),
        _tableCell('Wednesday'),
      ]),
      TableRow(children: [
        _tableCell('Holiday \nName', isHeader: true),
        _tableCell('Bakrid'),
        _tableCell('Independence Day'),
        _tableCell('Diwali'),
      ]),
      TableRow(children: [
        _tableCell('Type', isHeader: true),
        _tableCell('Public Holiday'),
        _tableCell('National Holiday'),
        _tableCell('Optional'),
      ]),
      TableRow(children: [
        _tableCell('Note', isHeader: true),
        _tableCell('Company-wide holiday'),
        _tableCell('Paid Leave'),
        _tableCell('Can be applied'),
      ]),
    ],
  ),
)

          ],
        ),
      ),
    );
  }

  Widget _buildLegendDot(Color color, String label) {
    return Row(
      children: [
        Container(
            width: 12,
            height: 12,
            decoration:
                BoxDecoration(color: color, shape: BoxShape.rectangle)),
        SizedBox(width: 4),
        Text(label),
      ],
    );
  }

  // TableRow _buildHolidayRow(
  //     String date, String day, String name, String type, String note) {
  //   return TableRow(children: [
  //     _tableCell(date),
  //     _tableCell(day),
  //     _tableCell(name),
  //     _tableCell(type),
  //     _tableCell(note),
  //   ]);
  // }

  Widget _tableCell(String text, {bool isHeader = false}) {
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
}
