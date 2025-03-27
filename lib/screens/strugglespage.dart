import 'package:addiction_aider/screens/mainhomepage.dart';
import 'package:flutter/material.dart';

import '../consts/colors.dart';

class StrugglesSelectionPage extends StatefulWidget {
  const StrugglesSelectionPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StrugglesSelectionPageState createState() => _StrugglesSelectionPageState();
}

class _StrugglesSelectionPageState extends State<StrugglesSelectionPage> {
  final List<String> struggles = [
    "Alcohol",
    "Marijuana",
    "Cocaine",
    "Prescription Drugs",
    "Tobacco and nicotine",
    "Pornographic content"
  ];

  final Map<String, bool> selectedStruggles = {};

  @override
  void initState() {
    super.initState();
    for (var struggle in struggles) {
      selectedStruggles[struggle] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFDCD9EC),
      ),
      backgroundColor: const Color(0xFFDCD9EC),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            const Text(
              "I'm struggling with...",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: "Fatone",
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 30),
            ...struggles.map((struggle) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xFF28E07E), width: 2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: CheckboxListTile(
                    title: Text(
                      struggle,
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: "Baloo",
                      ),
                    ),
                    value: selectedStruggles[struggle],
                    onChanged: (bool? value) {
                      setState(() {
                        selectedStruggles[struggle] = value!;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.trailing,
                    activeColor: const Color(0xFF28E07E),
                  ),
                ),
              );
            }),
            const SizedBox(height: 10),
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
            
            
          ],
        ),
      ),
    );
  }
}
