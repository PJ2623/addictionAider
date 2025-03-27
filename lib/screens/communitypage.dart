import 'package:addiction_aider/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDCD9EC),
      body: Column(
        children: [
          const Text(
            'Community',
            style: TextStyle(
              fontSize: 50,
              fontFamily: "Fatone",
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                _buildCommunityCard(
                  username: "her_excellency",
                  type: "STORY",
                  content:
                      "I was lost in my addiction, every day felt like a battle I couldn’t win. It controlled my life, took everything from me everything from my family and all that I loved. I was a slave to my addiction, and I didn’t know how to break free.",
                ),
                _buildCommunityCard(
                  username: "Sara_Jones",
                  type: "ARTICLE",
                  content:
                      "I knew I had to stop, but I just couldn't! I knew I had to stop when I woke up naked in the street...",
                ),
                _buildCommunityCard(
                  username: "CatMania",
                  type: "ARTICLE",
                  content:
                      "He woke up every morning craving the escape, drowning in a haze of temporary relief. Friends turned away...",
                ),
                _buildCommunityCard(
                  username: "John Angula",
                  type: "STORY",
                  content:
                      "I remember the first time I encountered pornography! I was just a teenager, unsure of my own identity...",
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFDCD9EC),
        onPressed: () {},
        child: const Icon(LucideIcons.plus, color: Colors.black),
      ),
    );
  }

  Widget _buildCommunityCard({
    required String username,
    required String type,
    required String content,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: Color(0xFF28E07E)),
        ),
        color: const Color(0xFFDCD9EC),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  username,
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: "Baloo",
                    color: Colors.black,
                  ),
                ),
              ),
              Center(
                child: Text(
                  type,
                  style: const TextStyle(
                    fontFamily: "Fatone",
                    fontSize: 14,
                    color: Colors.green,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Center(
                child: Text(
                  content,
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14, 
                  height: 1,
                  fontFamily: "Baloo",
                  color: Colors.black),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                                  color: mainColor,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: const Color(0xFF28E07E),
                                  ),
                                ),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          "READ MORE",
                          style: TextStyle(
                            fontFamily: "Fatone",
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
