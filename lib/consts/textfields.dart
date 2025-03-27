// ignore_for_file: library_private_types_in_public_api
import 'package:addiction_aider/consts/colors.dart';
import 'package:flutter/material.dart';

// Long Text Field
class LongTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText; // Optional hint text

  const LongTextField({super.key, required this.controller, this.hintText, required bool readOnly});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return TextField(
      controller: controller,
      keyboardType: TextInputType.text,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: hintText ?? 'Something',
        hintStyle:  TextStyle(color: blackColor.withOpacity(0.7), fontFamily: 'Baloo'),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: secColor, width: 2.0),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: secColor, width: 2.0),
          borderRadius: BorderRadius.circular(15),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: screenHeight * 0.03,
          vertical: screenWidth * 0.045,
        ),
      ),
    );
  }
}

// Email Text Field
class EmailTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText; // Optional hint text

  const EmailTextField({super.key, required this.controller, this.hintText});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return TextField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: hintText ?? 'Your Email',
        hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontFamily: 'Baloo',
            fontSize: screenWidth * 0.04,),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2.0),
          borderRadius: BorderRadius.circular(screenWidth * 0.2),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2.0),
          borderRadius: BorderRadius.circular(screenWidth * 0.2),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.02,
          vertical: screenWidth * 0.06,
        ),
      ),
      style: TextStyle(
        fontSize: screenWidth * 0.05,
        height: 0.9,
        fontFamily: 'Baloo',
        
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}

// Password Text Field with Show/Hide Feature
class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText; // Optional hint text

  const PasswordTextField({super.key, required this.controller, this.hintText});

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscured = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return TextField(
      controller: widget.controller,
      obscureText: _obscured,
      style: TextStyle(fontFamily: 'Baloo', fontSize: screenWidth * 0.05,
        height: 0.9, color: blackColor),
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: widget.hintText ?? 'Enter Password',
        hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontFamily: 'Baloo',
            fontSize: screenWidth * 0.04,),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: secColor, width: 2.0),
          borderRadius: BorderRadius.circular(screenWidth * 0.2),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: secColor, width: 2.0),
          borderRadius: BorderRadius.circular(screenWidth * 0.2),
        ),
        contentPadding: EdgeInsets.only(
          left: screenWidth * 0.12,
          top: screenWidth * 0.045,
          bottom: screenWidth * 0.045,
        ),
        suffixIcon: IconButton(
          iconSize: screenWidth * 0.03,
          icon: Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(
              _obscured ? Icons.visibility : Icons.visibility_off,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          onPressed: () {
            setState(() {
              _obscured = !_obscured;
            });
          },
        ),
      ),
    );
  }
}

//Short TextField
class ShortUserNameField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const ShortUserNameField({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return TextField(
      controller: controller,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: hintText, // Use the provided hintText
        hintStyle: TextStyle(
          fontSize: screenWidth * 0.04,
          fontFamily: 'Baloo',
          color: blackColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: secColor, width: 2.0),
          borderRadius: BorderRadius.circular(screenWidth * 0.2),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: secColor, width: 2.0),
          borderRadius: BorderRadius.circular(screenWidth * 0.2),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.02,
          vertical: screenWidth * 0.045,
        ),
      ),
      style: TextStyle(
        fontSize: screenWidth * 0.05,
        height: 0.9,
        fontFamily: 'Baloo',
        color: blackColor,
      ),
    );
  }
}