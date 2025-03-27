import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDCD9EC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF28E07E),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Sober Acts',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: "Fatone",
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                Align(
                  alignment: Alignment.centerRight,
                  child: MessageBubble(
                      text: 'How are you guys today?', isSent: true),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: MessageBubble(
                    text: '@pohamba’schild\nWe are good and you',
                    isSent: false,
                    isTagged: true,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: MessageBubble(
                    text: '@daggawarrior\nYeah, FR',
                    isSent: false,
                    isTagged: true,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: MessageBubble(
                    text: '@daggawarrior\nYeah, FR\nHow are you guys today?',
                    isSent: true,
                    isTagged: true,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Type Something",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Color(0xFF28E07E)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Color(0xFF28E07E)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Color(0xFF28E07E)),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 14),
                      filled: true,
                      fillColor: Colors.transparent,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                FloatingActionButton(
                  backgroundColor: const Color(0xFF28E07E),
                  onPressed: () {},
                  child: const Icon(Icons.send, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String text;
  final bool isSent;
  final bool isTagged;

  const MessageBubble({
    required this.text,
    required this.isSent,
    this.isTagged = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> lines = text.split('\n');
    String username = lines.first;
    String message = lines.sublist(1).join('\n');

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isSent ? Colors.transparent : Colors.transparent,
        border: Border.all(color: const Color(0xFF28E07E)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            username,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
          ),
          Text(
            message,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
