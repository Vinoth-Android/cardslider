import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  @override
  _ChatBotScreenState createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  List<Map<String, dynamic>> messages = [];
  final TextEditingController messageController = TextEditingController();
  ScrollController _scrollController = ScrollController();
  bool isReceiveMode = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  // Function to send a message
  void sendMessage() {
    String message = messageController.text.trim();
    if (message.isNotEmpty) {
      DateTime now = DateTime.now();

      setState(() {
        messages.add({
          "message": message,
          "isSent": !isReceiveMode,
          "time": now,
          "date": now,
        });
      });

      messageController.clear();

      // Scroll to the latest message after sending
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  // Function to format the time display (12:30 PM, Yesterday, or actual date)
  String formatMessageTime(DateTime time) {
    DateTime now = DateTime.now();
    DateTime yesterday = now.subtract(const Duration(days: 1));

    if (time.year == now.year &&
        time.month == now.month &&
        time.day == now.day) {
      return DateFormat.jm().format(time); // Time format (e.g., 12:30 PM)
    } else if (time.year == yesterday.year &&
        time.month == yesterday.month &&
        time.day == yesterday.day) {
      return "Yesterday";
    } else {
      return DateFormat.yMMMd()
          .format(time); // Full date format (e.g., Sep 28, 2024)
    }
  }

  // Format the date for the header
  String formatDate(DateTime date) {
    DateTime today = DateTime.now();
    DateTime yesterday = today.subtract(const Duration(days: 1));

    if (DateFormat('yyyy-MM-dd').format(date) ==
        DateFormat('yyyy-MM-dd').format(today)) {
      return "Today";
    } else if (DateFormat('yyyy-MM-dd').format(date) ==
        DateFormat('yyyy-MM-dd').format(yesterday)) {
      return "Yesterday";
    } else {
      return DateFormat('MMMM d').format(date); // Example: September 28
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat Bot"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back when pressed
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                // Display the date only once per day
                bool showDateHeader = index == 0 ||
                    DateFormat('yyyy-MM-dd').format(messages[index]['date']) !=
                        DateFormat('yyyy-MM-dd')
                            .format(messages[index - 1]['date']);

                return Column(
                  children: [
                    // Show the date header if it's the first message of the day
                    if (showDateHeader)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          formatDate(messages[index]['date']),
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                      ),

                    // Show the actual message (either sent or received)
                    messages[index]['isSent']
                        ? _sentMessage(messages[index]['message'],
                            formatMessageTime(messages[index]['time']))
                        : _receivedMessage(messages[index]['message'],
                            formatMessageTime(messages[index]['time'])),
                  ],
                );
              },
            ),
          ),
          _messageInputField(),
        ],
      ),
    );
  }

  // Message input layout
  Widget _messageInputField() {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          Checkbox(
            value: isReceiveMode,
            onChanged: (bool? value) {
              setState(() {
                isReceiveMode = value ?? false;
              });
            },
          ),
          Expanded(
            child: TextField(
              controller: messageController,
              decoration: const InputDecoration(
                hintText: "Type a message",
                fillColor: Colors.white,
                filled: true,
                border: InputBorder.none, // Remove the border
              ),
            ),
          ),
          IconButton(
            onPressed: sendMessage,
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }

  // Sent message layout
  Widget _sentMessage(String message, String time) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.teal[600],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              message,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(
              time,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  // Received message layout
  Widget _receivedMessage(String message, String time) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message,
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(
              time,
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: ChatBotScreen(),
  ));
}
