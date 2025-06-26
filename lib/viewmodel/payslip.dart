import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PayslipController extends GetxController {
  final GlobalKey payslipBoundaryKey = GlobalKey();
  var selectedMonth = "June 2025".obs;
  var netPay = "₹45,000".obs;
  final downloadedMonths = <String, bool>{}.obs;

  void markAsDownloaded(String month) {
    downloadedMonths[month] = true;
  }

  void updatePayslipData(String month) {
    selectedMonth.value = month;
    if (month == "March 2025") netPay.value = "₹41,000";
    if (month == "April 2025") netPay.value = "₹43,500";
    if (month == "May 2025") netPay.value = "₹45,000";
    if (month == "June 2025") netPay.value = "₹45,000";
  }

  Future<void> exportPayslipToPdf() async {
    try {
      RenderRepaintBoundary boundary = payslipBoundaryKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      final pdf = pw.Document();
      final imageWidget = pw.MemoryImage(pngBytes);

      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return pw.Center(child: pw.Image(imageWidget));
          },
        ),
      );

      await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => pdf.save(),
        name: "payslip_${selectedMonth.value}.pdf",
      );
    } catch (e) {
      print("❌ Error exporting PDF: $e");
    }
  }
}