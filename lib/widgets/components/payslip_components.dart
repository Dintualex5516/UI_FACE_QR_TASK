

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_task/viewmodel/payslip.dart';

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow(this.label, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text("$label :", style: const TextStyle(fontSize: 8)),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class PayslipHeader extends StatelessWidget {
  const PayslipHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PayslipController>();
    return Obx(() => Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 4),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset("assets/images/ziya.jpeg", height: 50, width: 50),
                  const SizedBox(width: 10),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("ZiyaAcademy",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue)),
                      Text("KEY-TO SUCCESS",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Colors.green)),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text("Payslip for the Month",
                      style: TextStyle(fontSize: 8)),
                  Text(controller.selectedMonth.value,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12)),
                ],
              )
            ],
          ),
        ));
  }
}

class EmployeeSummary extends StatelessWidget {
  const EmployeeSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PayslipController>();
    return Obx(() => Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(color: Colors.black12, blurRadius: 4),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("EMPLOYEE SUMMARY",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13)),
                    SizedBox(height: 13),
                    InfoRow("Employee Name", "Hemant Rangarajan"),
                    InfoRow("Designation", "Full-stack Developer"),
                    InfoRow("Employee ID", "Employee ID"),
                    InfoRow("Date of Joining", "30/05/2025"),
                    InfoRow("Pay Period", "June 2025"),
                    InfoRow("Pay Date", "15/07/2025"),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 2),
                      BoxShadow(color: Colors.black12, blurRadius: 2),
                    ],
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 260,
                      height: 150,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.green.shade100,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12)),
                            ),
                            child: Row(
                              children: [
                                Container(
                                    width: 3,
                                    height: 50,
                                    color: Colors.green.shade700),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(controller.netPay.value,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                    const Text("Employee Net Pay",
                                        style: TextStyle(fontSize: 10)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const DottedLine(),
                          const SizedBox(height: 6),
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                InfoRow("Paid Days", "31"),
                                InfoRow("LOP Days", "0"),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class EarningsDeductionsTable extends StatelessWidget {
  const EarningsDeductionsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            blurRadius: 4,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Table(
              columnWidths: const {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(1),
                3: FlexColumnWidth(1),
                4: FlexColumnWidth(1),
                5: FlexColumnWidth(1),
              },
              children: [
                _buildTableRow([
                  "EARNINGS", "AMOUNT", "YTD", "DEDUCTIONS", "AMOUNT", "YTD"
                ], isHeader: true),
                _buildTableRow([
                  "Basic", "₹25,000", "₹3,00,000", "PF Deduction", "₹2,500", "₹30,000"
                ]),
                _buildTableRow([
                  "HRA", "₹10,000", "₹1,20,000", "Tax Deduction", "₹7,500", "₹90,000"
                ]),
                _buildTableRow([
                  "Travel Allowance", "₹3,000", "₹36,000", "", "", ""
                ]),
                _buildTableRow([
                  "Meal / Other Allow.", "₹2,000", "₹24,000", "", "", ""
                ]),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Gross Earnings ₹55,000",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                ),
                Text(
                  "Total Deductions ₹10,000",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TableRow _buildTableRow(List<String> cells, {bool isHeader = false}) {
    return TableRow(
      children: cells
          .map((cell) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(cell,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight:
                        isHeader ? FontWeight.bold : FontWeight.normal))))
          .toList(),
    );
  }
}

class NetPayBox extends StatelessWidget {
  const NetPayBox({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PayslipController>();
    return Obx(() => Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total Net Payable",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                      Text("Gross Earnings - Total Deductions",
                          style: TextStyle(fontSize: 10, color: Colors.black54)),
                    ],
                  ),
                  Text(controller.netPay.value,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Amount in Words: ${_amountInWords(controller.netPay.value)}",
              style: const TextStyle(fontSize: 8),
            ),
          ],
        ));
  }

  String _amountInWords(String amount) {
    final value = amount.replaceAll('₹', '').replaceAll(',', '');
    final numericValue = double.tryParse(value) ?? 0;

    if (numericValue == 41000) return "Indian Rupee Forty-One Thousand Only";
    if (numericValue == 43500)
      return "Indian Rupee Forty-Three Thousand Five Hundred Only";
    if (numericValue == 45000) return "Indian Rupee Forty-Five Thousand Only";
    return "Indian Rupee ${numericValue.toInt()} Only";
  }
}

class PayslipHistory extends StatelessWidget {
  const PayslipHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final List<List<String>> payslips = [
      ['March 2025', '₹41,000'],
      ['April 2025', '₹43,500'],
      ['May 2025', '₹45,000'],
      ['June 2025', '₹45,000'],
    ];

    final controller = Get.find<PayslipController>();
    return Obx(() => Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            columnWidths: const {
              0: FlexColumnWidth(.9), // Month
              1: FlexColumnWidth(1.1), // Net Pay
              2: FlexColumnWidth(1.7), // Status
              3: FlexColumnWidth(1.5), // Action
            },
            children: [
              TableRow(
                children: [
                  _tableHeaderCell("Month"),
                  _tableHeaderCell("Net Pay"),
                  _tableHeaderCell("Status"),
                  _tableHeaderCell("Action"),
                ],
              ),
              for (final row in payslips)
                TableRow(
                  children: [
                    _tableCell(row[0]),
                    _tableCell(row[1]),
                    _tableCell("✅Generated"),
                    GestureDetector(
                      onTap: () {
                        controller.updatePayslipData(row[0]);
                        controller.markAsDownloaded(row[0]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          controller.downloadedMonths[row[0]] == true
                              ? "✅ Downloaded"
                              : "📥 Download",
                          style: TextStyle(
                            fontSize: 10,
                            color: controller.downloadedMonths[row[0]] == true
                                ? Colors.green
                                : Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ));
  }

  Widget _tableCell(String text) => Padding(
        padding: const EdgeInsets.all(10),
        child: Text(text, style: const TextStyle(fontSize: 13)),
      );

  Widget _tableHeaderCell(String text) => Padding(
        padding: const EdgeInsets.all(10),
        child: Text(text,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
      );
}


