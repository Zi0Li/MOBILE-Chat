import 'package:flutter/material.dart';

class TextComposer extends StatefulWidget {
  const TextComposer({super.key});

  @override
  State<TextComposer> createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  bool _isComposing = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.photo_camera),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration.collapsed(
                hintText: "Enviar uma mensagem",
              ),
              onChanged: (value) {
                setState(() {
                  _isComposing = value.isNotEmpty;
                });
              },
              onSubmitted: (value) {},
            ),
          ),
          IconButton(
            onPressed: (_isComposing) ? () {} : null,
            icon: Icon(Icons.send),
          )
        ],
      ),
    );
  }
}
