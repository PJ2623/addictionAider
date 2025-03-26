import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class MainHomeManger extends StatefulWidget {
  const MainHomeManger({super.key});

  @override
  State<MainHomeManger> createState() => _MainHomeMangerState();
}

class _MainHomeMangerState extends State<MainHomeManger> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: GNav(
        gap: 8,
        activeColor: Colors.white,
        iconSize: 24,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        duration: const Duration(milliseconds: 800),
        tabBackgroundColor: Colors.grey,
        tabs: const [
          GButton(
            icon: LucideIcons.usersRound,
            text: 'Dashboard',
          ),
          GButton(
            icon: LucideIcons.botMessageSquare,
            text: 'AI ChatBot',
          ),
          GButton(
            icon: Icons.bookmark,
            text: 'Home',
          ),
          GButton(
            icon: Icons.person,
            text: 'Chats',
          ),
          GButton(
            icon: Icons.person,
            text: 'Notes',
          ),
        ],
        selectedIndex: 0,
        onTabChange: (index) {
          setState(() {});
        },
      ),
      body: const Center(
        child: Column(
          children: [

          ],
        )
      ),
    );
  }
}