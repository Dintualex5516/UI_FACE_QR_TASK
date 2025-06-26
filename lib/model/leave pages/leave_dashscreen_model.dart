enum LeaveStatus { pending, approved }

class LeaveModel {
  final String title;
  final DateTime from;
  final DateTime to;
  final int days;
  final LeaveStatus status;

  LeaveModel({
    required this.title,
    required this.from,
    required this.to,
    required this.days,
    required this.status,
  });
}
