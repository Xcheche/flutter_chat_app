import 'package:flutter/material.dart';

import 'chat_message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key})
      : super(key: key); // Add 'Key?' and use 'key' parameter

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];
  void _handleSubmitted(String text) {
    _textEditingController.clear();

    ChatMessage message = ChatMessage(
      text: text,
    );

    setState(() {
      _messages.insert(0, message);
    }); // Correct variable name (_textEditingController)
  }

  Widget _textComposerWidget() {
    return IconTheme(
      data: const IconThemeData(color: Colors.blue),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                decoration:
                    const InputDecoration.collapsed(hintText: 'Send a message'),
                controller:
                    _textEditingController, // Correct variable name (_textEditingController)
                onSubmitted: _handleSubmitted,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                onPressed: () {
                  _handleSubmitted(_textEditingController.text);
                },
                icon: const Icon(Icons.send),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Screen'),
      ),
      body: _textComposerWidget(),
    );
  }
}
