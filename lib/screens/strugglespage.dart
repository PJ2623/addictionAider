import 'package:addiction_aider/screens/mainhomepage.dart';
import 'package:flutter/material.dart';

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
      backgroundColor: const Color(0xFFDCD9EC),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 80),
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
                padding: const EdgeInsets.only(bottom: 15),
                child: Container(
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xFF28E07E), width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CheckboxListTile(
                    title: Text(
                      struggle,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
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
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF28E07E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainHomeManger()));
                },
                child: const Text(
                  "CONTINUE",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: "Baloo",
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
