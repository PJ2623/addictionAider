import 'package:addiction_aider/consts/colors.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDCD9EC),
      body: Center(
        child: Column(
          children: [
            const Text(
              'Homepage',
              style: TextStyle(
                fontSize: 50,
                fontFamily: "Fatone",
                color: Colors.black,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 26),
              child: Text(
                'I pledge to stay sober for my health and well-being',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  height: 0.8,
                  fontFamily: "Fatone",
                  color: secColor,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: const Color(0xFF28E07E),
          ),
              child: 
            const Row(
              children: [
                Column(
                  children: [
                    Text('STREAK 🔥', style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Fatone",
                      color: secColor,
                    ),)
                  ],
                )
              ],
            ),)
            
          ],
        ),
      ),
    );
  }
}