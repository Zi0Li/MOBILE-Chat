import 'package:chat2/text_composer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreenPage extends StatefulWidget {
  const ChatScreenPage({super.key});

  @override
  State<ChatScreenPage> createState() => _ChatScreenPageState();
}

class _ChatScreenPageState extends State<ChatScreenPage> {
  void _sendMessage(String text) {
    FirebaseFirestore.instance.collection('message').add(
      {'text': text},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Olá'),
      ),
      body: TextComposer(
        sendMessage: _sendMessage,
      ),
    );
  }
}
