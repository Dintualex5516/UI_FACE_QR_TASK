

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ui_task/views/dashboard%20pages/leaves/leavedashboard.dart';
import 'package:ui_task/widgets/dashappbar.dart';
import 'package:file_picker/file_picker.dart';

class ApplyLeaveScreen extends StatefulWidget {
  const ApplyLeaveScreen({Key? key}) : super(key: key);

  @override
  State<ApplyLeaveScreen> createState() => _ApplyLeaveScreenState();
}

class _ApplyLeaveScreenState extends State<ApplyLeaveScreen> {
  final _reasonController = TextEditingController();
  DateTime? _fromDate;
  DateTime? _toDate;
  String? _leaveType;
  bool _showLeaveForm = false;
  bool _showDashboard = true;

  final _leaveTypes = ['Sick Leave', 'Casual Leave', 'Work From Home', 'Other'];

Future<void> _pickDate(BuildContext ctx, bool isFrom) async {
  DateTime now = DateTime.now();
  DateTime today = DateTime(now.year, now.month, now.day);

 
  DateTime base = isFrom
      ? (_fromDate ?? today)
      : (_toDate ?? today);

 
  DateTime initial = base.isBefore(today) ? today : base;

  final picked = await showDatePicker(
    context: ctx,
    initialDate: initial,
    firstDate: today,
    lastDate: DateTime(today.year + 1),
    selectableDayPredicate: (day) {
      final d = DateTime(day.year, day.month, day.day);
      return !d.isBefore(today);
    },
  );

  if (picked != null) {
    setState(() {
      if (isFrom) _fromDate = picked;
      else _toDate = picked;
    });
  }
}



  String _format(DateTime? dt) =>
      dt == null ? '' : DateFormat('dd-MM-yyyy').format(dt);

  @override
  void dispose() {
    _reasonController.dispose();
    super.dispose();
  }

  BoxDecoration get shadowBoxDecoration => BoxDecoration(
        color: const Color(0xFFF6F7FB),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 4,
            offset: const Offset(0, 2),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    const labelStyle = TextStyle(color: Colors.grey, fontSize: 14);
    TextEditingController _fileController = TextEditingController();
    PlatformFile? pickedFile;

    return Scaffold(
      appBar:AppBarHistory() ,
      backgroundColor: Colors.white,
      
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          children: [
            
           Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 40, 
                    child: ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          _showDashboard = !_showDashboard;
                          _showLeaveForm = false;
                        });
                      },
                      icon: const Icon(
                        Icons.dashboard,
                        size: 20, 
                        color: Colors.grey, 
                      ),
                      label: const Text('Dashboard'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.grey, 
                        textStyle: const TextStyle(fontSize: 14), 
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          _showLeaveForm = !_showLeaveForm;
                          _showDashboard = false;
                        });
                      },
                      icon: const Icon(
                        Icons.send,
                        size: 20,
                        color: Colors.grey,
                      ),
                      label: const Text('Request Leave'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.grey,
                        textStyle: const TextStyle(fontSize: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            //Dashboard 
            if (_showDashboard) DashboardContent(
              pendingRequest: 1,
              teamOnLeave: 2,
              totalDays: 20,
              remainingDays: 29,
              quarterlyTaken: [5, 4, 3, 2],
              upcomingLeaves: [
                LeaveModel(
                  title: 'Annual Leave',
                  from: DateTime(2025, 4, 22),
                  to: DateTime(2025, 4, 24),
                  days: 3,
                  status: LeaveStatus.pending,
                ),
              ],
            ),

            //Request Leave Form
            if (_showLeaveForm) ...[
              Align(
                alignment: Alignment.centerLeft,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Back'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Apply for Leave',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text('Employee Name', style: labelStyle),
              const SizedBox(height: 4),
              Container(
                decoration: shadowBoxDecoration,
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_outline),
                    hintText: 'Employee Name – auto-filled',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Employee ID', style: labelStyle),
              const SizedBox(height: 4),
              Container(
                decoration: shadowBoxDecoration,
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.badge_outlined),
                    hintText: 'Employee ID – auto-filled',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Text('From', style: labelStyle),
                  const SizedBox(width: 170),
                  const Text('To', style: labelStyle),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: shadowBoxDecoration,
                      child: ElevatedButton.icon(
                        onPressed: () => _pickDate(context, true),
                        icon: const Icon(Icons.calendar_today, color: Colors.grey),
                        label: Text(
                          _fromDate == null ? 'From' : _format(_fromDate),
                          style: TextStyle(
                            color: _fromDate == null ? Colors.grey : Colors.black,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          shadowColor: Colors.transparent,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.compare_arrows, color: Colors.grey, size: 28),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      decoration: shadowBoxDecoration,
                      child: ElevatedButton.icon(
                        onPressed: () => _pickDate(context, false),
                        icon: const Icon(Icons.calendar_today, color: Colors.grey),
                        label: Text(
                          _toDate == null ? 'To' : _format(_toDate),
                          style: TextStyle(
                            color: _toDate == null ? Colors.grey : Colors.black,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          shadowColor: Colors.transparent,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 56,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: shadowBoxDecoration,
                      child: Row(
                        children: const [
                          Icon(Icons.event_note_outlined, color: Colors.grey),
                          SizedBox(width: 8),
                          Text('Leave Type', style: TextStyle(color: Colors.grey, fontSize: 13)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                 Expanded(
  child: Container(
    height: 52,
    padding: const EdgeInsets.symmetric(horizontal: 8),
    decoration: shadowBoxDecoration,
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        isExpanded: true, // ✅ Important to prevent overflow
        hint: const Text(
          'Choose Type',
          style: TextStyle(color: Colors.grey, fontSize: 13),
        ),
        value: _leaveType,
        icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
        items: _leaveTypes
            .map((s) => DropdownMenuItem(value: s, child: Text(s)))
            .toList(),
        onChanged: (v) => setState(() => _leaveType = v),
      ),
    ),
  ),
),

                ],
              ),
              const SizedBox(height: 16),
              const Text('Reason', style: labelStyle),
              const SizedBox(height: 4),
              Container(
                decoration: shadowBoxDecoration,
                child: TextFormField(
                  controller: _reasonController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    hintText: 'Text area',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w400),
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Attachment', style: labelStyle),
              const SizedBox(height: 4),
              Container(
                decoration: shadowBoxDecoration,
                child:TextFormField(
                  controller: _fileController,
                  readOnly: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.attachment_outlined),
                    hintText: 'Attachment (Optional)',
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                  onTap: () async {
                    FilePickerResult? result = await FilePicker.platform.pickFiles();

                    if (result != null && result.files.isNotEmpty) {
                      pickedFile = result.files.first;
                      _fileController.text = pickedFile!.name;
                      
                    }
                  },
                ),
                
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Submit logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('Submit', style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
