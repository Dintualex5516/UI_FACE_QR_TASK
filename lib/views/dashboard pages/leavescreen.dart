import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  final _leaveTypes = ['Sick Leave', 'Casual Leave', 'Work From Home', 'Other'];

  Future<void> _pickDate(BuildContext ctx, bool isFrom) async {
    final now = DateTime.now();
    final initial = isFrom ? (_fromDate ?? now) : (_toDate ?? now);
    final picked = await showDatePicker(
      context: ctx,
      initialDate: initial,
      firstDate: DateTime(now.year - 1),
      lastDate: DateTime(now.year + 1),
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

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 253, 243, 243),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 4,
                offset: const Offset(0, 2),
              )
            ],
          ),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            leading: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: ClipOval(
                child: Image.asset(
                  "assets/images/ziya.jpeg",
                  height: 20,
                  width: 30,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            titleSpacing: 0,
            title: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 8.0),
              child: Container(
                height: 36,
                width: 200,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Search",
                  style: TextStyle(
                    color: Color.fromARGB(255, 102, 100, 100),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: const Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 5),
              IconButton(
                onPressed: () {},
                icon: ClipOval(
                  child: Image.asset(
                    "assets/images/dd.jpg",
                    height: 34,
                    width: 34,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
            centerTitle: false,
            foregroundColor: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
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
                // initialValue: 'Employee Name – auto-filled',
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

            const Text('Employee ID', style: labelStyle,),
            const SizedBox(height: 4),
            Container(
              decoration: shadowBoxDecoration,
              child: TextFormField(
                // initialValue: 'Employee ID – auto-filled',
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
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.compare_arrows,
                    color: Colors.grey, size: 28), // 2-way arrow
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
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // const Text('Leave Type', style: labelStyle),
            const SizedBox(height: 4),
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
                        Text('Leave Type',
                            style:
                                TextStyle(color: Colors.grey, fontSize: 13)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    height: 56,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: shadowBoxDecoration,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        hint: const Text('Choose Type',
                            style:
                                TextStyle(color: Colors.grey, fontSize: 13)),
                        value: _leaveType,
                        icon: const Icon(Icons.arrow_drop_down,
                            color: Colors.grey),
                        items: _leaveTypes
                            .map((s) =>
                                DropdownMenuItem(value: s, child: Text(s)))
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

            const Text('Attachment', style: labelStyle),
            const SizedBox(height: 4),
            Container(
              decoration: shadowBoxDecoration,
              child: TextFormField(
                readOnly: true,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.attachment_outlined),
                  hintText: 'Attachment (Optional)',
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                ),
                onTap: () {
                  // TODO: Add file picker logic
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
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('Submit',
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
