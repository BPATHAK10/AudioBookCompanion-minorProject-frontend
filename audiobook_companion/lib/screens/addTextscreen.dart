import 'package:flutter/material.dart';

class addTextScreen extends StatefulWidget {
  const addTextScreen({ Key? key }) : super(key: key);

  @override
  _addTextScreenState createState() => _addTextScreenState();
}

class _addTextScreenState extends State<addTextScreen> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text('Add Text'),
       ),
       body: Column(
        children: [
          SizedBox(
            child: TextFormField(
              minLines: 8,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                alignLabelWithHint: true,
                labelText: 'Enter text',
                labelStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
         ),
     );
  }
}
 