import 'package:addiction_aider/screens/login.dart';
import 'package:addiction_aider/screens/signup.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFDCD9EC),
      ),
      backgroundColor: const Color(0xFFDCD9EC),
      body: Center(
        
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Image.asset(
              'assets/images/Addiction Aider Logo-no background.png',
              height: 200,
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpPage()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF28E07E),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFF28E07E),
                        ),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 44, vertical: 16),
                        child: Text(
                          'SIGN UP',
                          style: TextStyle(
                            fontFamily: 'Baloo',
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFDCD9EC),

                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          width: 2,
                          color: const Color(0xFF28E07E),
                        ),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                            fontFamily: 'Baloo',
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              'JOIN OUR COMMUNITY OF 100K+',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Baloo',
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
