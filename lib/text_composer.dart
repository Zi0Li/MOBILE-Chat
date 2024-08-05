import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TextComposer extends StatefulWidget {
  final Function({String text, XFile img}) sendMessage;
  TextComposer({required this.sendMessage, super.key});

  @override
  State<TextComposer> createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  TextEditingController _controller = TextEditingController();

  bool _isComposing = false;

  void _reset() {
    _controller.clear();
    setState(() {
      _isComposing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          IconButton(
            onPressed: () async {
              final XFile? imgFile = await ImagePicker().pickImage(source: ImageSource.camera);
              if (imgFile == null) return;
              widget.sendMessage(img: imgFile);
            },
            icon: Icon(Icons.photo_camera),
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration.collapsed(
                hintText: "Enviar uma mensagem",
              ),
              onChanged: (value) {
                setState(() {
                  _isComposing = value.isNotEmpty;
                });
              },
              onSubmitted: (value) {
                widget.sendMessage(text: _controller.text);
                _reset();
              },
            ),
          ),
          IconButton(
            onPressed: (_isComposing)
                ? () {
                    widget.sendMessage(text: _controller.text);
                    _reset();
                  }
                : null,
            icon: Icon(Icons.send),
          )
        ],
      ),
    );
  }
}
