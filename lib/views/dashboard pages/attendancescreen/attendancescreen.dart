
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

extension DateHelpers on DateTime {
  String get monthName {
    const names = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
    return names[month - 1];
  }
  int get daysInMonth => DateTime(year, month + 1, 0).day;
}

class AttendanceCalendarScreen extends StatefulWidget {
  @override
  _AttendanceCalendarScreenState createState() =>
      _AttendanceCalendarScreenState();
}

class _AttendanceCalendarScreenState extends State<AttendanceCalendarScreen> {
  DateTime _focusedDay = DateTime(2025, 6, 1);
  DateTime? _selectedDay;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(),
        title: Text('Attendance Calendar',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
       
Container(
  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
    boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(
        icon: Icon(Icons.chevron_left),
        onPressed: () => setState(() {
          _focusedDay = DateTime(_focusedDay.year, _focusedDay.month - 1, 1);
        }),
      ),

   
      Row(
        children: [
          Text(
            '${_focusedDay.monthName} ',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          DropdownButton<int>(
            value: _focusedDay.year,
            underline: SizedBox(), 
            items: List.generate(
              5,
              (i) => _focusedDay.year - 2 + i,
            ).map((year) {
              return DropdownMenuItem(
                value: year,
                child: Text(
                  year.toString(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              );
            }).toList(),
            onChanged: (year) {
              if (year != null) {
                setState(() {
                  _focusedDay = DateTime(year, _focusedDay.month, 1);
                });
              }
            },
            icon: Icon(Icons.arrow_drop_down),
          ),
        ],
      ),

      IconButton(
        icon: Icon(Icons.chevron_right),
        onPressed: () => setState(() {
          _focusedDay = DateTime(_focusedDay.year, _focusedDay.month + 1, 1);
        }),
      ),
    ],
  ),
),

          SizedBox(height: 16),

          // Calendar
          Container(
            decoration: BoxDecoration(
              
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TableCalendar(
                firstDay: DateTime(2025, 1, 1),
                lastDay: DateTime(2025, 12, 31),
                focusedDay: _focusedDay,
                selectedDayPredicate: (d) => isSameDay(d, _selectedDay),
                onDaySelected: (s, _) => setState(() => _selectedDay = s),
                headerVisible: false,
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: TextStyle(color: Colors.blue),
                  weekendStyle: TextStyle(color: Colors.blue),
                ),
                calendarStyle: CalendarStyle(
                  cellPadding: EdgeInsets.symmetric(vertical: 6),
                  todayDecoration:
                      BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                  selectedDecoration:
                      BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                ),
                calendarBuilders: CalendarBuilders(
                  defaultBuilder: (ctx, day, _) {
                    final bg = highlightDays[
                        DateTime(day.year, day.month, day.day)];
                    if (bg != null) {
                      return Center(
                        child: CircleAvatar(
                          radius: 14,
                          backgroundColor: bg,
                          child: Text('${day.day}',
                              style: TextStyle(color: Colors.white, fontSize: 12)),
                        ),
                      );
                    }
                    return null;
                  },
                  todayBuilder: (ctx, day, _) => Center(
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.blue,
                      child: Text('${day.day}',
                          style: TextStyle(color: Colors.white, fontSize: 14)),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 24),

          // Overview Section
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Overview',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text('Total Days: ${_focusedDay.daysInMonth}',
                  style: TextStyle(fontSize: 12)),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: stats.keys.map((key) {
                  return Container(
                    width: 80,
                    height: 90,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow:
                          [BoxShadow(color: Colors.black12, blurRadius: 4)],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(key,
                            style: TextStyle(
                                color: statColors[key]!, fontSize: 10,fontWeight:FontWeight.bold)),
                        SizedBox(height: 4),
                        Text(
                          stats[key]!.toInt().toString().padLeft(2, '0'),
                          style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: statColors[key]),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 16),
              
              Center(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: PieChart(
                    PieChartData(
                      sections: stats.entries.map((e) {
                        final clr = statColors[e.key]!;
                        return PieChartSectionData(
                          value: e.value,
                          color: clr,
                          radius: 90,
                          title: '${e.value.toInt()} \n Days',
                          titleStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          titlePositionPercentageOffset: 0.6,
                        );
                      }).toList(),
                      centerSpaceRadius: 70,
                      sectionsSpace: 2,
                    ),
                  ),
                ),
              ),
            ]),
          ),



           SizedBox(height: 30),

          Text(
            _selectedDay != null
              ? DateFormat('MMMM d, y').format(_selectedDay!)
              : 'Select a date',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text("status",
            
            
            style: TextStyle(fontSize: 14, ),
          ), SizedBox(width: 230),
              Container(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text('Present', style: TextStyle(color: Colors.green)),
              ),
            ],
          ),

          Divider(height: 32),

          // Check‑in 
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Icon(Icons.alarm, color: Colors.green),
                SizedBox(width: 4),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Check‑in'),
                    Text('09:30 AM', style: TextStyle(color: Colors.green,fontWeight:FontWeight.bold)),
                  ],
                )
              ]),
              Icon(Icons.arrow_forward, size:32, color:Colors.grey),
              Row(children: [
                Icon(Icons.alarm_off, color: Colors.green),
                SizedBox(width: 4),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Check‑out'),
                    Text('06:00 PM', style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold)),
                  ],
                )
              ]),
            ],
          ),

          SizedBox(height: 24),

          // Work Mode 

          Row(children: [
            Expanded(
              child: Center(
                child: _detailBox(
                    'Work Mode', 'Office', Colors.blue[100]!, Colors.blue),
              ),
            ),
            SizedBox(width: 150),
            Expanded(
              child: Center(
                child: _detailBox(
                    'Verification', 'Selfie', Colors.orange[100]!, Colors.orange),
              ),
            ),
          ]),

          SizedBox(height: 24),

         
            Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.location_on_rounded, size: 24, color: Color(0xFFEC0606)),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Location',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text('Lat: 13.05, Long: 80.24'),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 16),

          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.note, size: 24),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Notes',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text('Worked On UI Bug Fixing'),
                  ],
                ),
              ],
            ),
          ),
                  
        ]),
      ),
    );
  }

  Widget _detailBox(String label, String value, Color bg, Color fg) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(label),
        SizedBox(height: 6),
        // Text(value,
        //     style:
        //         TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: fg)),

                SizedBox(width: 230),
              Container(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                decoration: BoxDecoration(
                  color:fg,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text('$value', style: TextStyle(color: Colors.white, fontSize: 12)),
              ),
    ]),
    );
  }
}
