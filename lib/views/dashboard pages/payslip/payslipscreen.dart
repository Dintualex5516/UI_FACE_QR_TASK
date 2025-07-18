import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_task/viewmodel/payslip.dart';
import 'package:ui_task/widgets/navbar/bottomnavigation.dart';
import 'package:ui_task/widgets/components/payslip_components.dart';
import 'package:ui_task/widgets/dashappbar.dart';

class PaySlipScreen extends StatelessWidget {
  PaySlipScreen({super.key});
  final PayslipController controller = Get.put(PayslipController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
         
        
          
         
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppBarHistory(),
                const SizedBox(height: 10),
                Row(
                  children: [
                   
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back, color: Colors.black),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Payslip",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                RepaintBoundary(
                  key: controller.payslipBoundaryKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const PayslipHeader(),
                      const SizedBox(height: 20),
                      const EmployeeSummary(),
                      const SizedBox(height: 20),

                      // PF -------------------------
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("PF A/C Number:",
                              style: TextStyle(
                                  fontSize: 10, color: Colors.grey.shade700)),
                          const Text("DD/DD/3535/FGG5",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold)),
                          Text("UAN    :",
                              style: TextStyle(
                                  fontSize: 10, color: Colors.grey.shade700)),
                          const Text("123456",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 10),

                      const EarningsDeductionsTable(),
                      const SizedBox(height: 20),

                      const NetPayBox(),
                      const SizedBox(height: 20),
                      const Divider(),
                      const SizedBox(height: 20),
                      const Text(
                        "        -This document has been automatically generated by Ziya Academy",
                        style: TextStyle(fontSize: 8, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                GestureDetector(
                  onTap: () => controller.exportPayslipToPdf(),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade400,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        "Download the sample salary slip format for PDF",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                const Text("Monthly Payslip History",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                const SizedBox(height: 15),
                const PayslipHistory(),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 1,
        onTap: (int value) {},
      ),
    );
  }
}
