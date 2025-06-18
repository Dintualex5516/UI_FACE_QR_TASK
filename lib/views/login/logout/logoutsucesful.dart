import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ui_task/views/homescreens/loginhomescreen.dart';


class LogoutSuccessScreen extends StatefulWidget {
  const LogoutSuccessScreen({super.key});

  @override
  State<LogoutSuccessScreen> createState() => _LogoutSuccessScreenState();
}

class _LogoutSuccessScreenState extends State<LogoutSuccessScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _showContent = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _scaleAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeOutBack);

    
    Future.delayed(const Duration(seconds: 1), () {
      _controller.forward();
      setState(() {
        _showContent = true;
      });
    });

   
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) =>  LoginHomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white,Color(0xFFFFA726), ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
                  AnimatedOpacity(
                  opacity: _showContent ? 1.0 : 0.0,
                  duration: const Duration(seconds: 1),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.check_circle,
                        color: Colors.orange,
                        size: 80,
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Successfully logged out",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 400),
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
