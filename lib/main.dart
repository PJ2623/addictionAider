import 'package:addiction_aider/screens/mainhomepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AddictionAiderApp());
}

class AddictionAiderApp extends StatelessWidget {
  const AddictionAiderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: MainHomeManger());
  }
}
