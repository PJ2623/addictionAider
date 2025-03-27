import 'package:addiction_aider/screens/landingpage.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 6), () {
      // Navigate to the next screen (e.g., HomeScreen)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LandingPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDCD9EC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFDCD9EC),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Addiction Aider Logo-no background.png',
              height: 200,
            ),
            const SizedBox(height: 40),
            const CircularProgressIndicator(
              color: Color(0xFF28E07E),
            ),
          ],
        ),
      ),
    );
  }
}