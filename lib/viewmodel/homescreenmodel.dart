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

//   void showCheckoutConfirmationDialog(BuildContext context, String? method) {
//     if (method == 'face') {
//       Navigator.push(
//   context,
//   MaterialPageRoute(
//     builder: (_) => FaceVerificationScreen(isCheckout: true),
//   ),
// );
//     } else if (method == 'qr') {
//     Navigator.push(
//   context,
//   MaterialPageRoute(
//     builder: (_) => QRVerificationScreen(isCheckout: true),
//   ),
// );
//     } else {
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: const Text("Error"),
//           content: const Text("Punch in method not found."),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text("OK"),
//             )
//           ],
//         ),
//       );
//     }
//   }

void showCheckoutConfirmationDialog(BuildContext context, String? method) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Stack(
          children: [
            Container(
              width: 300,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                const SizedBox(height: 10),
                const Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 50),
                const SizedBox(height: 16),
                const Text(
                  "Do you really want to continue!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 24),
                Row(children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(dialogContext).pop(),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: Colors.blue),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text("Update Task", style: TextStyle(color: Colors.blue)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(dialogContext).pop(); // Close the dialog

                        // Navigate based on punch method
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
                          // Show fallback error dialog
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: const Text("Error"),
                              content: const Text("Punch in method not found."),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text("OK"),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text("Punch Out", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ]),
              ]),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: GestureDetector(
                onTap: () => Navigator.of(dialogContext).pop(),
                child: const Icon(Icons.close, color: Colors.grey),
              ),
            ),
          ],
        ),
      );
    },
  );
}


}