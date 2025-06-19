// import 'package:flutter/material.dart';
// import 'package:ui_task/views/homescreens/loginhomescreen.dart';
// import 'package:ui_task/views/login/offline%20mode/QR_ver_screen.dart';
// import 'package:ui_task/views/login/onlinemode/face_verification.dart';

// void showCheckoutConfirmationDialog(
//   BuildContext context, 
// //   {
// //   // required PunchMode? lastPunchMode,
// // }
// ) {
  
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return Dialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         child: Stack(
//           children: [
         
//             Container(
//               width: 300,
//               padding: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 color: Colors.white,
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const SizedBox(height: 10),

//                   const Icon(
//                     Icons.warning_amber_rounded,
//                     color: Colors.orange,
//                     size: 50,
//                   ),
//                   const SizedBox(height: 16),
// // text of warng
//                   const Text(
//                     "Do you really want to continue!",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.orange,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                   ),
//                   const SizedBox(height: 24),

                 
//                   Row(
//                     children: [
//                       Expanded(
//                         child: OutlinedButton(
//                           onPressed: () => Navigator.of(context).pop(),
//                           style: OutlinedButton.styleFrom(
//                             backgroundColor: Colors.white,
//                             side: const BorderSide(color: Colors.blue),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             padding: const EdgeInsets.symmetric(vertical: 14),
//                           ),
//                           child: const Text("Update Task", style: TextStyle(color: Colors.blue)),
//                         ),
//                       ),
//                       const SizedBox(width: 12),
//                       Expanded(
//                         child: ElevatedButton(
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 // builder: (context) => const FaceVerificationScreen(isCheckout: true),
//                                 builder: (context) => const QRVerificationScreen(isCheckout: true),
//                               ),
//                             );
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.blue,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             padding: const EdgeInsets.symmetric(vertical: 14),
//                           ),
//                           child: const Text("Checkout", style: TextStyle(color: Colors.white)),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),

           
//             Positioned(
//               top: 8,
//               right: 8,
//               child: GestureDetector(
//                 onTap: () => Navigator.of(context).pop(),
//                 child: const Icon(Icons.close, color: Colors.grey),
//               ),
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }


// logoutflow.dart
import 'package:flutter/material.dart';
import 'package:ui_task/views/punch%20in%20out%20screens/offline%20mode/QR_ver_screen.dart';
import 'package:ui_task/views/punch%20in%20out%20screens/onlinemode/face_verification.dart';

void showCheckoutConfirmationDialog(
  BuildContext context, {
  required String? punchMethod,
}) {
  showDialog(
    context: context,
    builder: (dialogContext) {
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
                      onPressed: () async {
                        Navigator.of(dialogContext).pop();

                        if (punchMethod == 'face') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const FaceVerificationScreen(isCheckout: true),
                            ),
                          );
                        } else if (punchMethod == 'qr') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const QRVerificationScreen(isCheckout: true),
                            ),
                          );
                        } else {
                          showDialog(
                            context: dialogContext,
                            builder: (_) => AlertDialog(
                              title: const Text("Error"),
                              content: const Text("Punch method not found."),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(dialogContext).pop(),
                                  child: const Text("OK"),
                                )
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
                      child: const Text("Checkout", style: TextStyle(color: Colors.white)),
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
