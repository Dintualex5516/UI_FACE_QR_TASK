import 'package:flutter/material.dart';
import 'package:ui_task/services/punch_method_service.dart';
import 'package:ui_task/views/punch%20in%20out%20screens/offline%20mode/QR_ver_screen.dart';
import 'package:ui_task/views/punch%20in%20out%20screens/onlinemode/face_verification.dart';

class HomeScreenViewModel extends ChangeNotifier {
  int currentIndex = 0;
  String? punchMethod;

  void updateTabIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  Future<void> loadPunchInMethod() async {
    punchMethod = await getPunchInMethod();
    notifyListeners();
  }

  void showCheckoutConfirmationDialog(BuildContext context, String? method) {
    if (method == 'face') {
      Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => FaceVerificationScreen(isCheckout: true),
  ),
);
    } else if (method == 'qr') {
    Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => QRVerificationScreen(isCheckout: true),
  ),
);
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Error"),
          content: const Text("Punch in method not found."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            )
          ],
        ),
      );
    }
  }
}