import 'package:chat2/text_composer.dart';
import 'package:flutter/material.dart';

class ChatScreenPage extends StatefulWidget {
  const ChatScreenPage({super.key});

  @override
  State<ChatScreenPage> createState() => _ChatScreenPageState();
}

class _ChatScreenPageState extends State<ChatScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Olá'),
      ),
      body: TextComposer(),
    );
  }
}
