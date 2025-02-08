
import 'package:demo/LoginScreen.dart';
import 'package:flutter/material.dart';

import 'dart:async';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  startTimer() {
    var duration = Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => const LoginScreen()),
              (Route<dynamic> route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xFF1D1A25), // Background color
          ),
          child: Center(
            child: Image.asset(
              'assets/image/js.jpeg', // Replace with your logo image path
              fit: BoxFit.fill, // Ensures the logo scales nicely
            ),
          ),
        ),
    );
  }
}
