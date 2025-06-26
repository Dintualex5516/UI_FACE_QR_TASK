import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';


class ApplyLeaveViewModel extends ChangeNotifier {
  final reasonController = TextEditingController();
  final fileController = TextEditingController();

  DateTime? fromDate;
  DateTime? toDate;
  String? leaveType;
  PlatformFile? pickedFile;
  bool showLeaveForm = false;
  bool showDashboard = true;

  final List<String> leaveTypes = [
    'Sick Leave',
    'Casual Leave',
    'Work From Home',
    'Other'
  ];

  Future<void> pickDate(BuildContext ctx, bool isFrom) async {
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);
    DateTime base = isFrom ? (fromDate ?? today) : (toDate ?? today);
    DateTime initial = base.isBefore(today) ? today : base;

    final picked = await showDatePicker(
      context: ctx,
      initialDate: initial,
      firstDate: today,
      lastDate: DateTime(today.year + 1),
      selectableDayPredicate: (day) => !day.isBefore(today),
    );

    if (picked != null) {
      if (isFrom) fromDate = picked;
      else toDate = picked;
      notifyListeners();
    }
  }

  String format(DateTime? dt) => dt == null ? '' : DateFormat('dd-MM-yyyy').format(dt);

  Future<void> pickAttachment() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.isNotEmpty) {
      pickedFile = result.files.first;
      fileController.text = pickedFile!.name;
      notifyListeners();
    }
  }

  void toggleForm(bool showForm) {
    showLeaveForm = showForm;
    showDashboard = !showForm;
    notifyListeners();
  }

  void disposeFields() {
    reasonController.dispose();
    fileController.dispose();
    super.dispose();
  }
}
