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
               tabBackgroundColor: Colors.white,
               backgroundColor: Colors.transparent, // Transparent to match container color
               tabs: const [
          GButton(
            icon: LucideIcons.usersRound,
            text: 'Dashboard',
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
               selectedIndex: 0,
               onTabChange: (index) {
          setState(() {});
               },
             ),
           ),
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