import 'package:flutter/material.dart';

class displayText extends StatefulWidget {
  final String chatText;
  const displayText({ Key? key, required this.chatText }) : super(key: key);

  @override
  _displayTextState createState() => _displayTextState();
}

class _displayTextState extends State<displayText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display Text'),
      ),
      body: Column(
        children: [
          Text(
            widget.chatText,
            style: TextStyle(
              fontSize: 30,
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              decoration: TextDecoration.underline,
              decorationColor: Colors.blue,
              decorationStyle: TextDecorationStyle.dashed,
            ),
          ),
        ],
      ),
    );
  }
}