

import 'package:flutter/material.dart';
import 'package:ui_task/views/login/onlinemode/center%20_face_ver.dart';



class FaceVerificationScreen extends StatefulWidget {
  final bool isCheckout;

  const FaceVerificationScreen({Key? key, required this.isCheckout}) : super(key: key);

  @override
  State<FaceVerificationScreen> createState() => _FaceVerificationScreenState();
}

class _FaceVerificationScreenState extends State<FaceVerificationScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: -50, end: 50).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildScannerOverlay() {
    return AnimatedBuilder(
      animation: _animation,
      builder: (_, child) {
        return Positioned(
          top: 90 + _animation.value,
          child: Container(
            width: 140,
            height: 2,
            color: Colors.lightBlueAccent,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10.withOpacity(0.95),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Face Verification",
              style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Please capture your face",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const SizedBox(height: 40),

            // Face Scanning annnimation

            Center(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    width: 180,
                    height: 220,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white38, width: 3),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Image.asset("assets/images/facial.jpg", fit: BoxFit.contain),
                    ),
                  ),
                  buildScannerOverlay(),
                ],
              ),
            ),

            const SizedBox(height: 50),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CenterYourFaceScreen(isCheckout: widget.isCheckout),
                  ),
                );
              },
              child: const Text("Take  Photo", style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.w600),),
            ),
          ],
        ),
      ),
    );
  }
}
