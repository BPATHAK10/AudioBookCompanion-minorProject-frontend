import 'package:audiobook_companion/models/paragraph_text_model.dart';
import 'package:flutter/material.dart';

class displayText extends StatefulWidget {
  final ParagraphText paragraphText;
  const displayText({Key? key, required this.paragraphText}) : super(key: key);

  @override
  _displayTextState createState() => _displayTextState();
}

class _displayTextState extends State<displayText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.paragraphText.title),
      ),
      body: Column(
        children: [
          Text(
            widget.paragraphText.title,
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
          SizedBox(
            height: 20,
          ),
          Text(
            widget.paragraphText.content,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
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
