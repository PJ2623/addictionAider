import 'package:flutter/material.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDCD9EC),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Community',
              style: TextStyle(
                fontSize: 40,
                fontFamily: "Fatone",
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                _buildCommunityCard(
                  username: "her_excellency",
                  type: "STORY",
                  content:
                      "I was lost in my addiction, every day felt like a battle I couldn’t win. It controlled my life, took everything from me...",
                ),
                _buildCommunityCard(
                  username: "Sara Jones",
                  type: "STORY",
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
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }

  Widget _buildCommunityCard({
    required String username,
    required String type,
    required String content,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: Color(0xFF28E07E)),
        ),
        color: const Color(0xFFDCD9EC),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                username,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              Text(
                type,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                content,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 14, color: Colors.black),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "READ MORE",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black,
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
