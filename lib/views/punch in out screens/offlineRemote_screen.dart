import 'package:flutter/material.dart';
import 'package:ui_task/services/punch_method_service.dart';
import 'package:ui_task/views/punch%20in%20out%20screens/offline%20mode/QR_ver_screen.dart';
import 'package:ui_task/views/punch%20in%20out%20screens/onlinemode/face_verification.dart';

void showmModeConfirmationDialog(BuildContext context) {
  
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Stack(
          children: [
         
            Container(
              width: 500,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),

                  // const Icon(
                  //   Icons.warning_amber_rounded,
                  //   color: Colors.orange,
                  //   size: 50,
                  // ),
                  // const SizedBox(height: 16),
// text of warng
                  const Text(
                    "Select Punch In Type",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    "Are you working from home or on site today",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      // fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                   const SizedBox(height: 34),

                 
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                                onPressed: () async {
                                  await savePunchInMethod('face');
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => FaceVerificationScreen(isCheckout: false),
                                    ),
                                  );
                                },
                                icon: Icon(Icons.login, color: Colors.white),
                                label: Text("online ", style: TextStyle(color: Colors.white)),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromARGB(255, 65, 142, 230),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5), // for pill-like or rounded button
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                  elevation: 4,
                                ),
                              ),),
                      
                       SizedBox(width: 12),
                      Expanded(
                        child:ElevatedButton.icon(
                              onPressed: () async {
                                await savePunchInMethod('qr');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => QRVerificationScreen(isCheckout: false),
                                  ),
                                );
                              },
                              icon: Icon(Icons.logout, color: Colors.white),
                              label: Text("Onsite", style: TextStyle(color: Colors.white)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(255, 65, 142, 230),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                elevation: 4,
                              ),
                            ),
                        // ElevatedButton(
                        //   onPressed: () {
                        //     Navigator.of(context).pop();
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => const FaceVerificationScreen(isCheckout: true),
                        //       ),
                        //     );
                        //   },
                        //   style: ElevatedButton.styleFrom(
                        //     backgroundColor: Colors.blue,
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(8),
                        //     ),
                        //     padding: const EdgeInsets.symmetric(vertical: 14),
                        //   ),
                        //   child: const Text("Online", style: TextStyle(color: Colors.white)),
                        // ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

           
            Positioned(
              top: 8,
              right: 8,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: const Icon(Icons.close, color: Colors.grey),
              ),
            ),
          ],
        ),
      );
    },
  );
}






// import 'package:flutter/material.dart';
// import 'package:ui_task/views/login/offline%20mode/QR_ver_screen.dart';
// import 'package:ui_task/views/login/onlinemode/face_verification.dart';

// void showmModeConfirmationDialog(BuildContext context) {
  
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

//                   // const Icon(
//                   //   Icons.warning_amber_rounded,
//                   //   color: Colors.orange,
//                   //   size: 50,
//                   // ),
//                   // const SizedBox(height: 16),
// // text of warng
//                   const Text(
//                     "Select Punch In Type",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20,
//                     ),
//                   ),
//                   const SizedBox(height: 14),
//                   const Text(
//                     "Are you working from home or on site today",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20,
//                     ),
//                   ),
//                    const SizedBox(height: 34),

                 
//                   Row(
//                     children: [
//                       Expanded(
//                         child: OutlinedButton(
//                           onPressed: ()  {
//                             Navigator.of(context).pop();
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => const QRVerificationScreen(isCheckout: true),
//                               ),
//                             );
//                           },

//                           style: OutlinedButton.styleFrom(
//                             backgroundColor: Colors.white,
//                             side: const BorderSide(color: Colors.blue),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             padding: const EdgeInsets.symmetric(vertical: 14),
//                           ),
//                           child: const Text("On Site", style: TextStyle(color: Colors.blue)),
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
//                                 builder: (context) => const FaceVerificationScreen(isCheckout: true),
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
//                           child: const Text("Online", style: TextStyle(color: Colors.white)),
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
