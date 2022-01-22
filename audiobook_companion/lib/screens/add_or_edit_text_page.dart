import 'package:audiobook_companion/boxes/boxes.dart';
import 'package:audiobook_companion/models/paragraph_text_model.dart';
import 'package:audiobook_companion/screens/home_page.dart';
import 'package:audiobook_companion/widgets/form.dart';
import 'package:flutter/material.dart';

class addOrEditTextScreen extends StatefulWidget {
  final ParagraphText? paragraphText;
  final bool isEdit;
  const addOrEditTextScreen({ Key? key ,this.paragraphText, required this.isEdit}) : super(key: key);

  @override
  _addOrEditTextScreenState createState() => _addOrEditTextScreenState();
}

class _addOrEditTextScreenState extends State<addOrEditTextScreen> {
  late String title;
  late String content;

  @override
  void initState(){
    super.initState();

    print("data transferred are \n ${widget.paragraphText?.title} and ${widget.paragraphText?.content} \n ${widget.isEdit}");

    title = widget.paragraphText?.title ?? "";
    content = widget.paragraphText?.content ?? "";

    print("the title and content are \n $title and $content");

  }

  void addParagraphText(String title,String content){
    final paragraphText = ParagraphText(title: title,content: content);

    final box = Boxes.getTexts();
    box.add(paragraphText);

    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  void editParagraphText(ParagraphText? p,String title, String content) {
    print("inside edit the paragraph text with title $title and content $content and p.title ${p?.title} and p.content ${p?.content}");
    p?.title = title;
    p?.content = content;

    p?.save();

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text('Add Text'),
       ),
       floatingActionButton: FloatingActionButton(
         onPressed: () {
           print("play");
         },
         child: Icon(Icons.play_circle_fill),
       ),
       body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          // MyForm( isEditing: widget.isEdit,),
          TextFormField(
            initialValue: title,
              onChanged: (value) {
                setState(() {
                  title = value;
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
              initialValue: content,
              onChanged: (value) {
                setState(() {
                  content = value;
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
                if (widget.isEdit) {
                  editParagraphText(widget.paragraphText, title, content);
                } else {
                  addParagraphText(title,content);
                }
                // addParagraphText(widget.paragraphText!.title,widget.paragraphText!.content);
              },
              child: Text('Save'),
            ),
          ),
        ],
         ),
     );
  }
}