import 'package:addiction_aider/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:web_socket_channel/html.dart'; // Web-compatible WebSocket
import 'package:web_socket_channel/status.dart' as status;

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
  late HtmlWebSocketChannel _channel;
  final List<Map<String, dynamic>> _messages = [];
  bool _isConnected = false;
  bool _isConnecting = false;

  @override
  void initState() {
    super.initState();
    _initConnection();
  }

  Future<void> _initConnection() async {
    setState(() => _isConnecting = true);
    _messages.add({'text': 'Connecting to AI assistant...', 'isMe': false});
    await _connectToWebSocket();
  }

  Future<void> _connectToWebSocket() async {
    try {
      _channel = HtmlWebSocketChannel.connect(
        Uri.parse('ws://localhost:8000/api/v1/bot/ws'),
        protocols: ['chat'],
      );

      // Verify connection is established
      await _channel.ready.timeout(const Duration(seconds: 5));

      setState(() {
        _isConnected = true;
        _isConnecting = false;
        // Remove connecting message if still present
        if (_messages.isNotEmpty && _messages.first['text'].contains('Connecting')) {
          _messages.removeAt(0);
        }
      });

      _channel.stream.listen(
        (message) {
          setState(() => _messages.add({'text': message, 'isMe': false}));
        },
        onError: (error) {
          print('WebSocket error: $error');
          _handleConnectionError();
        },
        onDone: () {
          print('WebSocket connection closed');
          _handleConnectionError();
        },
      );
    } catch (e) {
      print('Connection error: $e');
      _handleConnectionError();
    }
  }

  void _handleConnectionError() {
    setState(() {
      _isConnected = false;
      _isConnecting = false;
      _messages.add({'text': 'Connection lost. Reconnecting in 5 seconds...', 'isMe': false});
    });
    Future.delayed(const Duration(seconds: 5), _connectToWebSocket);
  }

  void _sendMessage() {
    final message = _controller.text.trim();
    if (message.isEmpty) return;

    if (!_isConnected) {
      setState(() {
        _messages.add({'text': 'Not connected to server', 'isMe': false});
      });
      return;
    }

    setState(() {
      _messages.add({'text': message, 'isMe': true});
    });

    try {
      _channel.sink.add(message);
      _controller.clear();
    } catch (e) {
      setState(() {
        _messages.add({'text': 'Failed to send message', 'isMe': false});
      });
      _handleConnectionError();
    }
  }

  Widget _buildConnectionIndicator() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            _isConnected ? Icons.circle : Icons.circle_outlined,
            color: _isConnected ? Colors.green : Colors.orange,
            size: 12,
          ),
          const SizedBox(width: 6),
          Text(
            _isConnected 
              ? 'Connected' 
              : _isConnecting ? 'Connecting...' : 'Disconnected',
            style: TextStyle(
              color: _isConnected ? Colors.green : Colors.orange,
              fontFamily: "Baloo",
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _channel.sink.close(status.goingAway);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDCD9EC),
      body: Column(
        children: [
          const SizedBox(height: 16),
          const Text(
            'AI ChatBot',
            style: TextStyle(
              fontSize: 32,
              fontFamily: "Fatone",
              color: Colors.black,
            ),
          ),
          _buildConnectionIndicator(),
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
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: message['isMe'] 
                          ? secColor.withOpacity(0.2) 
                          : mainColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: message['isMe'] ? secColor : mainColor,
                        width: 1.5,
                      ),
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
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: "Baloo",
                    ),
                    onSubmitted: (_) => _sendMessage(),
                    decoration: InputDecoration(
                      hintText: "How are you feeling?",
                      hintStyle: const TextStyle(
                        color: Colors.black54,
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
                        horizontal: 16,
                        vertical: 14,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.7),
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