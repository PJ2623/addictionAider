import 'package:addiction_aider/screens/chatbot.dart';
import 'package:addiction_aider/screens/chatspage.dart';
import 'package:addiction_aider/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'communitypage.dart';

class MainHomeManger extends StatefulWidget {
  const MainHomeManger({super.key});

  @override
  State<MainHomeManger> createState() => _MainHomeMangerState();
}

class _MainHomeMangerState extends State<MainHomeManger> {
  int _selectedIndex = 0;

  // List of pages (Replace these with your actual pages)
  final List<Widget> _pages = [
    const CommunityPage(),
    const ChatBotApp(),
    const Homepage(),
    const Chatspage(),
    const NotesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDCD9EC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF28E07E),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(LucideIcons.menu, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(LucideIcons.bell, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: const Color(0xFF28E07E),
          ),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
          child: GNav(
            gap: 8,
            activeColor: Colors.black,
            iconSize: 30,
            color: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            duration: const Duration(milliseconds: 800),
            tabBackgroundColor: const Color(0xFFDCD9EC),
            backgroundColor: Colors.transparent,
            tabs: const [
              GButton(
                icon: LucideIcons.usersRound,
                text: 'Community',
                textStyle: TextStyle(
                  fontFamily: 'Baloo',
                  fontWeight: FontWeight.bold,
                ),
              ),
              GButton(
                icon: LucideIcons.botMessageSquare,
                text: 'AI ChatBot',
                textStyle: TextStyle(
                  fontFamily: 'Baloo',
                  fontWeight: FontWeight.bold,
                ),
              ),
              GButton(
                icon: LucideIcons.house,
                text: 'Home',
                textStyle: TextStyle(
                  fontFamily: 'Baloo',
                  fontWeight: FontWeight.bold,
                ),
              ),
              GButton(
                icon: LucideIcons.messageCircle,
                text: 'Chats',
                textStyle: TextStyle(
                  fontFamily: 'Baloo',
                  fontWeight: FontWeight.bold,
                ),
              ),
              GButton(
                icon: LucideIcons.notebookPen,
                text: 'Notes',
                textStyle: TextStyle(
                  fontFamily: 'Baloo',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
      body: _pages[_selectedIndex], // Display selected page
    );
  }
}

class AIChatBotPage extends StatelessWidget {
  const AIChatBotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("AI ChatBot Page"));
  }
}

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Chats Page"));
  }
}

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Notes Page"));
  }
}
