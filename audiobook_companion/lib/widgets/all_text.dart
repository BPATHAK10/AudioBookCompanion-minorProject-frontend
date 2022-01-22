import 'package:audiobook_companion/boxes/boxes.dart';
import 'package:audiobook_companion/screens/add_or_edit_text_page.dart';
import 'package:audiobook_companion/screens/text_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import '../models/paragraph_text_model.dart';
import '../screens/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_theme.dart';

class AllTexts extends StatefulWidget {
  const AllTexts({Key? key}) : super(key: key);

  @override
  _AllTextsState createState() => _AllTextsState();
}

class _AllTextsState extends State<AllTexts> {

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  void deleteParagraphText(ParagraphText p){
    p.delete();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 10),
          child: Row(
            children: [
              Text(
                'Sample Text',
                style: MyTheme.heading2,
              ),
            ],
          ),
        ),
        ValueListenableBuilder<Box<ParagraphText>>(
          valueListenable: Boxes.getTexts().listenable(), 
          builder: (context,box,_){
            if (box.isEmpty){
              return Container(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Text(
                      'No Texts',
                      style: MyTheme.heading2,
                    ),
                  ],
                ),
              );}
              else{
                final texts = box.values.toList().cast<ParagraphText>();
                // for (var i = 0; i < texts.length; i++) {
                //   print(texts[i].title);  
                //   print(texts[i].content);
                // }
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: texts.length,
                  itemBuilder: (context,index){
                    return ListTile(
                      title: Text(texts[index].title),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min, 
                        children: [
                          IconButton(
                            onPressed: (){
                              print('edit');
                              Navigator.push(context, 
                              MaterialPageRoute(builder: (context) => addOrEditTextScreen(paragraphText: texts[index], isEdit: true,)));
                          
                            },
                            icon: Icon(Icons.edit)),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: (){
                              deleteParagraphText(texts[index]);
                              print("deletes this box with title : ${texts[index].title}");
                            },
                          ),
                        ],
                      ),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => displayText(
                              paragraphText: texts[index],
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              }
            }
        )
      ],
        // ListView.builder(
        //     shrinkWrap: true,
        //     physics: ScrollPhysics(),
        //     itemCount: allTexts.length,
        //     itemBuilder: (context, int index) {
        //       final allText = allTexts[index];
        //       return ListTile(
        //         title: Text(allText.title),
        //         onTap: () {
        //           Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                   builder: (context) =>
        //                       displayText(paragraphText: allText)));
        //           // print('tapped');
        //         },
        //       );
        //     })
    
    );
  }
}

