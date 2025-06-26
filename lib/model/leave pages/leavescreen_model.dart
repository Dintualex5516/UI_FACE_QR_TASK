class LeaveRequestModel {
  String? employeeName;
  String? employeeId;
  DateTime? fromDate;
  DateTime? toDate;
  String? leaveType;
  String? reason;
  String? attachmentName;

  LeaveRequestModel({
    this.employeeName,
    this.employeeId,
    this.fromDate,
    this.toDate,
    this.leaveType,
    this.reason,
    this.attachmentName,
  });
}
