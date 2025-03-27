// ignore_for_file: library_private_types_in_public_api

import 'package:addiction_aider/consts/colors.dart';
import 'package:addiction_aider/consts/textfields.dart';
import 'package:addiction_aider/screens/login.dart';
import 'package:addiction_aider/screens/strugglespage.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController retypepasswordController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  String? _selectedGender;

  @override
  void dispose() {
    _dobController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _dobController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  void _showSuccessMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Account created successfully!'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
              'SIGN UP',
              style: TextStyle(
                fontSize: 50,
                fontFamily: "Fatone",
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ShortUserNameField(
                          controller: firstNameController, 
                          hintText: 'FIRST NAME'
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ShortUserNameField(
                          controller: lastNameController, 
                          hintText: 'LAST NAME'
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: ShortUserNameField(
                          controller: usernameController, 
                          hintText: 'CREATE USERNAME'
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ShortUserNameField(
                          controller: emailController, 
                          hintText: 'EMAIL ADDRESS'
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: DateOfBirthField(
                          controller: _dobController,
                        
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: GenderList(controller: genderController)
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  PasswordTextField(controller: passwordController, hintText: 'CREATE PASSWORD'),
                  const SizedBox(height: 10),
                  PasswordTextField(controller: retypepasswordController, hintText: 'CONFIRM PASSWORD'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const StrugglesSelectionPage()));
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
                        'CONTINUE',
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
                  'HAVE AN ACCOUNT? ',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Baloo',
                    color: Colors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  },
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(
                      color: Color(0xFF28E07E),
                      fontFamily: 'Baloo',
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hintText) {
    return InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Color(0xFF28E07E)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Color(0xFF28E07E)),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Color(0xFF28E07E)),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      hintText: hintText,
      hintStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: "Baloo",
        height: 2,
      ),
    );
  }
}