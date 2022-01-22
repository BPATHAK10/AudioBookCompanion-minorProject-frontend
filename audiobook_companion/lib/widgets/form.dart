import 'package:audiobook_companion/boxes/boxes.dart';
import 'package:audiobook_companion/models/paragraph_text_model.dart';
import 'package:audiobook_companion/screens/home_page.dart';
import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  String title = '';
  String content = '';
  final bool isEditing;

  MyForm({Key? key,required this.isEditing})
      : super(key: key);

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {

  void addParagraphText(String title, String content) {
    final paragraphText = ParagraphText(title: title, content: content);

    final box = Boxes.getTexts();
    box.add(paragraphText);

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  void editParagraphText(ParagraphText p,String title, String content) {

    final box = Boxes.getTexts();
    // box.update(paragraphText);

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextFormField(
        onChanged: (value) {
          setState(() {
            widget.title = value;
          });
        },
        decoration: InputDecoration(
          labelText: 'Enter Title',
          contentPadding: EdgeInsets.all(10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          labelStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      SizedBox(
        height: 30,
      ),
      SizedBox(
        child: TextFormField(
          onChanged: (value) {
            setState(() {
              widget.content = value;
            });
          },
          minLines: 8,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            alignLabelWithHint: true,
            labelText: 'Enter text',
            labelStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      SizedBox(
        child: ElevatedButton(
          onPressed: () {
            // print("save pressed and title is $title and content is $content");
            if (widget.isEditing){
                // editParagraphText( widget.title, widget.content);
            }
            else{
              addParagraphText(widget.title, widget.content);
            }
          },
          child: Text('Save'),
        ),
      ),
    ]);
  }
}
