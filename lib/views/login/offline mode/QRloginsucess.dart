import 'package:flutter/material.dart';
import '../../homescreens/homescreen.dart';

class QRLoginSuccessView extends StatefulWidget {
  const QRLoginSuccessView({super.key});

  @override
  State<QRLoginSuccessView> createState() => _QRLoginSuccessViewState();
}

class _QRLoginSuccessViewState extends State<QRLoginSuccessView>
    with SingleTickerProviderStateMixin {
  bool _showContent = false;

  @override
  void initState() {
    super.initState();

  
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _showContent = true;
      });
    });

    
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) =>  HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: AnimatedOpacity(
            opacity: _showContent ? 1.0 : 0.0,
            duration: const Duration(seconds: 1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(
                  Icons.check_circle,
                  color: Colors.white,
                  size: 80,
                ),
                SizedBox(height: 20),
                Text(
                  "Successfully logged in",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 400),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
