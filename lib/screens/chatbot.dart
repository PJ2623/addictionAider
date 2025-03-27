import 'package:addiction_aider/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatBotApp extends StatelessWidget {
  const ChatBotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  late WebSocketChannel _channel;
  final List<Map<String, dynamic>> _messages = [
    {
      'text': 'Hello! How can I help you today?',
      'isMe': false,
    },
  ];

  @override
  void initState() {
    super.initState();
    _connectToWebSocket();
  }

  void _connectToWebSocket() {
    // Replace with your actual WebSocket URL
    _channel = WebSocketChannel.connect(
      Uri.parse('ws://192.168.64.1/api/v1/chat/ws'),
    );

    _channel.stream.listen(
      (message) {
        setState(() {
          _messages.add({
            'text': message,
            'isMe': false,
          });
        });
      },
      onError: (error) {
        print('WebSocket error: $error');
        // Add error message to chat
        setState(() {
          _messages.add({
            'text': 'Connection error. Trying to reconnect...',
            'isMe': false,
          });
        });
        // Try to reconnect after 5 seconds
        Future.delayed(const Duration(seconds: 5), _connectToWebSocket);
      },
      onDone: () {
        print('WebSocket connection closed');
        // Add connection closed message to chat
        setState(() {
          _messages.add({
            'text': 'Connection lost. Trying to reconnect...',
            'isMe': false,
          });
        });
        // Try to reconnect after 5 seconds
        Future.delayed(const Duration(seconds: 5), _connectToWebSocket);
      },
    );
  }

  void _sendMessage() {
    if (_controller.text.trim().isNotEmpty) {
      final message = _controller.text;
      setState(() {
        _messages.add({
          'text': message,
          'isMe': true,
        });
      });
      
      // Send message through WebSocket
      _channel.sink.add(message);
      _controller.clear();
    }
  }

  @override
  void dispose() {
    _channel.sink.close();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDCD9EC),
      body: Column(
        children: [
          const Text(
            'AI ChatBot',
            style: TextStyle(
              fontSize: 50,
              fontFamily: "Fatone",
              color: Colors.black,
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              reverse: false,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Align(
                  alignment: message['isMe']
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      border: message['isMe']
                          ? Border.all(color: secColor, width: 2)
                          : Border.all(color: mainColor),
                    ),
                    child: Text(
                      message['text'],
                      style: TextStyle(
                        fontFamily: "Baloo",
                        color: message['isMe'] ? blackColor : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 120, // 5 lines * 24px line height approx
                    ),
                    child: TextField(
                      controller: _controller,
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: "Baloo",
                      ),
                      maxLines: null, // Allows unlimited lines
                      keyboardType: TextInputType.multiline,
                      onSubmitted: (_) => _sendMessage(),
                      decoration: InputDecoration(
                        hintText: "How are you feeling?",
                        hintStyle: const TextStyle(
                          color: Colors.black,
                          fontFamily: "Baloo",
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: secColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: secColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: secColor),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 14),
                        filled: true,
                        fillColor: Colors.transparent,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: _sendMessage,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: secColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      LucideIcons.send,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}