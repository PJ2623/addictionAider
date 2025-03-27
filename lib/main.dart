import 'package:flutter/material.dart';
import 'screens/splashscreen.dart';

void main() {
  runApp(const AddictionAiderApp());
}

class AddictionAiderApp extends StatelessWidget {
  const AddictionAiderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: Splashscreen());
  }
}
