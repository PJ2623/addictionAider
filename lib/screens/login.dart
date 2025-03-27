import 'package:addiction_aider/consts/colors.dart';
import 'package:addiction_aider/consts/textfields.dart';
import 'package:addiction_aider/screens/mainhomepage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFDCD9EC),
      ),
      backgroundColor: const Color(0xFFDCD9EC),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Addiction Aider Logo-no background.png',
              height: 140,
            ),
            const SizedBox(height: 16),
            const Text(
              'LOGIN',
              style: TextStyle(
                fontFamily: 'Fatone',
                fontSize: 60,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  LongTextField(controller: usernameController, readOnly: false, hintText: 'USERNAME OR EMAIL'),
                  const SizedBox(height: 10),
                  PasswordTextField(controller: passwordController, hintText: 'PASSWORD',), 
                  const SizedBox(height: 36),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainHomeManger()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: secColor,
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
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "DON'T HAVE AN ACCOUNT?",
                        style: TextStyle(
                          fontFamily: 'Baloo',
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          ' CREATE ONE',
                          style: TextStyle(
                            fontFamily: 'Baloo',
                            color: Color(0xFF28E07E),
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
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