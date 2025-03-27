import 'package:flutter/material.dart';
import 'package:addiction_aider/consts/colors.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // Simplified with fixed values
  final int _streakDays = 0; // You can set this to any initial value you want

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
            const SizedBox(height: 20),

            // Streak Container
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF28E07E),
                ),
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'STREAK 🔥',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Fatone",
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '$_streakDays Days',
                            style: const TextStyle(
                              fontSize: 26,
                              fontFamily: "Fatone",
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: const Color(0xFF28E07E),
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 4),
                                child: Text(
                                  'REWARDS',
                                  style: TextStyle(
                                    color: blackColor,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Fatone",
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        const Text(
                          'I\'VE BEEN SOBER FOR....',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Fatone",
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Column(
                          children: [
                            Text(
                              '00:01:30:18',
                              style: TextStyle(
                                fontSize: 32,
                                height: 0.8,
                                fontFamily: "Fatone",
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'M      D      H      M      S',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: "Fatone",
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: const Color(0xFF28E07E),
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 4),
                              child: Text(
                                'RESET',
                                style: TextStyle(
                                  color: blackColor,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Fatone",
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),

            //The two options
            Row(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFF28E07E),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFF28E07E),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
