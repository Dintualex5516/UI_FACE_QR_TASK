import 'package:flutter/material.dart';
import 'package:ui_task/views/login/logout/logoutsucesful.dart';
import 'package:ui_task/views/login/offline%20mode/QRloginsucess.dart';
import 'package:ui_task/views/login/onlinemode/login_success_view.dart';

class CenterYourQRScreen extends StatelessWidget {
  final bool isCheckout;

  const CenterYourQRScreen({Key? key, required this.isCheckout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.white,
              Colors.white,
              Color.fromARGB(255, 80, 148, 226),
            ],
            
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    SizedBox(height: 350),
                    Text(
                      "Capture Your QR code",
                      style: TextStyle(
                      
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Point your QR right at the box,\nthen take a photo",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    // SizedBox(height: 40),
                    // Icon(Icons.camera_alt_outlined, size: 150, color: Colors.grey),
                  ],
                ),
              ),

              // Bottom buttons
              Positioned(
                bottom: 60,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Camera Icon ---------------------------
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const Icon(Icons.photo_camera, size: 18, color: Colors.black87),
                    ),
                    const SizedBox(width: 30),

                    // Tick Icon --------------------------------------
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => isCheckout
                                ? const LogoutSuccessScreen()                            
                                :  const QRLoginSuccessView(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 65, 142, 230),
                        ),
                        child: const Icon(Icons.check_outlined, size: 50, color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 30),

                    // Flash Icon ----------------------------------------------
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const Icon(Icons.flash_on, size: 18, color: Colors.black87),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
