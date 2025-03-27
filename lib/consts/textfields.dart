// ignore_for_file: library_private_types_in_public_api
import 'package:addiction_aider/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

// Long Text Field
class LongTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText; // Optional hint text

  const LongTextField(
      {super.key,
      required this.controller,
      this.hintText,
      required bool readOnly});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return TextField(
      controller: controller,
      keyboardType: TextInputType.text,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: hintText ?? 'Something',
        hintStyle:
            TextStyle(color: blackColor.withOpacity(0.7), fontFamily: 'Baloo'),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: secColor, width: 2.0),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: secColor, width: 2.0),
          borderRadius: BorderRadius.circular(15),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.02,
          vertical: screenWidth * 0.045,
        ),
      ),
    );
  }
}

// Short Email Field
class ShortEmailTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText; // Optional hint text

  const ShortEmailTextField({super.key, required this.controller, this.hintText});

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
          fontSize: screenWidth * 0.04,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary, width: 2.0),
          borderRadius: BorderRadius.circular(screenWidth * 0.2),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary, width: 2.0),
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
          fontSize: screenWidth * 0.04,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary, width: 2.0),
          borderRadius: BorderRadius.circular(screenWidth * 0.2),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary, width: 2.0),
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
      style: TextStyle(
          fontFamily: 'Baloo',
          fontSize: screenWidth * 0.05,
          height: 0.9,
          color: blackColor),
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: widget.hintText ?? 'Enter Password',
        hintStyle: TextStyle(
          color: blackColor.withOpacity(0.7),
          fontFamily: 'Baloo',
          fontSize: screenWidth * 0.04,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: secColor, width: 2.0),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: secColor, width: 2.0),
          borderRadius: BorderRadius.circular(15),
        ),
        contentPadding: EdgeInsets.only(
          left: screenWidth * 0.12,
          top: screenWidth * 0.045,
          bottom: screenWidth * 0.045,
        ),
        suffixIcon: IconButton(
          iconSize: screenWidth * 0.05,
          icon: Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(_obscured ? LucideIcons.eye : LucideIcons.eyeOff,
                color: blackColor),
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

// Gender List Widget (example with Radio buttons)
class GenderList extends StatefulWidget {
  final TextEditingController controller;

  const GenderList({super.key, required this.controller});

  @override
  _GenderListState createState() => _GenderListState();
}

class _GenderListState extends State<GenderList> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: screenWidth * 0.44,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.02,
              vertical: screenWidth * 0.005,
            ),
            decoration: BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: secColor,
                width: 2.0,
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedGender,
                dropdownColor: secColor,
                hint: Center(
                  child: Text(
                    'Select Gender',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: blackColor,
                      fontFamily: 'Baloo',
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                ),
                isExpanded: true,
                icon: const Icon(
                  LucideIcons.arrowDown,
                  color: blackColor,
                ),
                items: [
                  DropdownMenuItem(
                    value: 'Male',
                    child: Center(
                      child: Text(
                        'Male',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: screenWidth * 0.05,
                          height: 0.9,
                          fontFamily: 'Baloo',
                          color: blackColor,
                        ),
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Female',
                    child: Center(
                      child: Text(
                        'Female',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: screenWidth * 0.05,
                            height: 0.9,
                            fontFamily: 'Baloo',
                            color: blackColor),
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Rather Not Say',
                    child: Center(
                      child: Text(
                        'Rather Not Say',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: screenWidth * 0.05,
                          height: 0.9,
                          fontFamily: 'Baloo',
                          color: blackColor,
                        ),
                      ),
                    ),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedGender = value;
                    widget.controller.text = selectedGender ?? '';
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DateOfBirthField extends StatelessWidget {
  final TextEditingController controller;

  const DateOfBirthField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final dateMaskFormatter = MaskTextInputFormatter(
      mask: '##/##/####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
    );

    return SizedBox(
      width: screenWidth * 0.44,
      child: TextFormField(
        controller: controller,
        inputFormatters: [dateMaskFormatter],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: screenWidth * 0.05,
          height: 0.9,
          fontFamily: 'Baloo',
          color: blackColor,
        ),
        decoration: InputDecoration(
          hintText: 'DD/MM/YYYY',
          hintStyle: TextStyle(
            fontSize: screenWidth * 0.04,
            color: blackColor.withOpacity(0.7),
            fontFamily: 'Baloo',
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: secColor,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: secColor,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: screenWidth * 0.06),
        ),
        onChanged: (text) {
          // Automatically convert to YYYY-MM-DD format if valid
          if (text.length == 10) {
            // When full date is entered
            final day = text.substring(0, 2);
            final month = text.substring(3, 5);
            final year = text.substring(6, 10);
            final formattedDob = "$day-$month-$year"; // Format to YYYY-MM-DD

            try {
              // Validate the date using intl
              DateFormat('dd-MM-yyyy').parseStrict(formattedDob);

              // Update the controller's text with the formatted date
              controller.value = TextEditingValue(
                text: formattedDob,
                selection: TextSelection.collapsed(offset: formattedDob.length),
              );
            } catch (e) {
              // Invalid date, you can show an error message if necessary
            }
          }
        },
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
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: screenWidth * 0.04,
          fontFamily: 'Baloo',
          color: blackColor.withOpacity(0.7),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: secColor, width: 2.0),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: secColor, width: 2.0),
          borderRadius: BorderRadius.circular(15),
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
