import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:addiction_aider/consts/colors.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late DateTime _startTime;
  Duration _elapsedTime = Duration.zero;
  Timer? _timer;
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    _loadStartTime();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _loadStartTime() async {
    final prefs = await SharedPreferences.getInstance();
    final savedTime = prefs.getInt('startTime');

    if (savedTime != null) {
      _startTime = DateTime.fromMillisecondsSinceEpoch(savedTime);
    } else {
      _startTime = DateTime.now();
      await prefs.setInt('startTime', _startTime.millisecondsSinceEpoch);
    }

    _startTimer(); // Start timer after _startTime is set
  }

  void _startTimer() {
    _isRunning = true;
    _timer?.cancel(); // Cancel any existing timer

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_isRunning) {
        setState(() {
          _elapsedTime = DateTime.now().difference(_startTime);
        });
      }
    });
  }

  Future<void> _resetTimer() async {
    _isRunning = false;
    _timer?.cancel(); // Stop the timer

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('startTime');

    setState(() {
      _startTime = DateTime.now();
      _elapsedTime = Duration.zero;
    });

    await prefs.setInt('startTime', _startTime.millisecondsSinceEpoch);

    _startTimer(); // Restart the timer after resetting
  }

  String _formatTime() {
    final months = _elapsedTime.inDays ~/ 30;
    final days = _elapsedTime.inDays % 30;
    final hours = _elapsedTime.inHours % 24;
    final minutes = _elapsedTime.inMinutes % 60;
    final seconds = _elapsedTime.inSeconds % 60;

    return '${months.toString().padLeft(2, '0')}:' 
           '${days.toString().padLeft(2, '0')}:' 
           '${hours.toString().padLeft(2, '0')}:' 
           '${minutes.toString().padLeft(2, '0')}:' 
           '${seconds.toString().padLeft(2, '0')}';
  }

  int _calculateStreakDays() {
    return _elapsedTime.inDays;
  }

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
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFF28E07E),
              ),
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left Side - Streak Info
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'STREAK 🔥',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Fatone",
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '${_calculateStreakDays()} Days',
                          style: const TextStyle(
                            fontSize: 26,
                            fontFamily: "Fatone",
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            // Check rewards functionality
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                          ),
                          child: const Text(
                            'Rewards',
                            style: TextStyle(
                              color: Color(0xFF28E07E),
                              fontFamily: "Fatone",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Right Side - Timer & Reset Button
                  Column(
                    children: [
                      Column(
                        children: [
                          Text(
                            _formatTime(),
                            style: const TextStyle(
                              fontSize: 22,
                              fontFamily: "Fatone",
                              color: Colors.white,
                              letterSpacing: 2,
                            ),
                          ),
                          const SizedBox(height: 6),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(width: 4),
                              Text('M', style: TextStyle(color: Colors.white)),
                              SizedBox(width: 8),
                              Text('D', style: TextStyle(color: Colors.white)),
                              SizedBox(width: 8),
                              Text('HR', style: TextStyle(color: Colors.white)),
                              SizedBox(width: 8),
                              Text('MIN', style: TextStyle(color: Colors.white)),
                              SizedBox(width: 8),
                              Text('SEC', style: TextStyle(color: Colors.white)),
                              SizedBox(width: 4),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: _resetTimer,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                        ),
                        child: const Text(
                          'Reset',
                          style: TextStyle(
                            color: Color(0xFF28E07E),
                            fontFamily: "Fatone",
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
