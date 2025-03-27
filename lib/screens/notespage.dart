import 'package:flutter/material.dart';

class Notespage extends StatelessWidget {
  const Notespage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> notes = [
      {
        'title': 'Feeling Anxious Today',
        'summary':
            'I woke up with a heavy chest, feeling like something is off...'
      },
      {
        'title': 'Urge to Relapse',
        'summary':
            'It was a tough day, the temptation was strong but I reminded myself...'
      },
      {
        'title': 'A Moment of Gratitude',
        'summary': 'Despite everything, today I found peace in small moments...'
      },
      {
        'title': 'Struggling with Loneliness',
        'summary': 'I miss the old times, but I know I am on the right path...'
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFDCD9EC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF28E07E),
        title: const Text(
          'My Notes',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: "Fatone",
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFF28E07E)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notes[index]['title']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontFamily: "Fatone",
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      notes[index]['summary']!,
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        'Read More',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF28E07E),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF28E07E),
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
