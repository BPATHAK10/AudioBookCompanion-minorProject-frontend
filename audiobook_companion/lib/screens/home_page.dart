import 'dart:io';
import 'package:audiobook_companion/models/paragraph_text_model.dart';
import 'package:audiobook_companion/screens/addText_page.dart';
import 'package:audiobook_companion/screens/text_page.dart';
import 'package:audiobook_companion/widgets/expandable_fab.dart';
import '../app_theme.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import 'package:file_picker/file_picker.dart';
import '../screens/screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  
  @override
  void initState() {
    super.initState();
  }
  
  static const _actionTitles = ['Add Text', 'Import'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: Icon(Icons.menu),
        // ),
        title: Text(
          'Audiobook Companion',
          style: MyTheme.kAppTitle,
        ),
        elevation: 0,
      ),
      backgroundColor: MyTheme.kPrimaryColor,
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: MainPage() 
           ),
          )
        ],
      ),
      floatingActionButton: ExpandableFab(
        distance: 80.0,
        children: [
          ActionButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => addTextScreen()
              ),
            ),
            // onPressed: () => _showAction(context, 0),
            icon: const Icon(Icons.text_fields_outlined),
          ),
          ActionButton(
            onPressed: () async{
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['txt'],
                );
          
                if (result != null) {
                  File file = File(result.files.single.path.toString());
                  final fileName = result.files.first.name.split('.')[0];
                
                  print(fileName);
                  final fileContents = file.readAsStringSync();

                  final paragraphText = ParagraphText(fileName, fileContents.toString());
                  paragraphText.addToAll();
                  print(fileContents.toString());

                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context)=> displayText(paragraphText: paragraphText))); 

                } else {
                    // User canceled the picker
                    return;
                }
            },
            icon: const Icon(Icons.upload_file),

            ),
            // onPressed: ()=> Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (_) => addTextScreen()
            //   ),
            // ),
            // onPressed: () => _showAction(context, 1),
        ],
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => addTextScreen()),
      //     );
      //   },
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(15),
      //   ),
      //   child: Icon(Icons.add),
      //   ),
      );
  }
}
