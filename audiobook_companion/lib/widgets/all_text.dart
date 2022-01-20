import 'package:audiobook_companion/screens/text_page.dart';

import '../models/paragraph_text_model.dart';
import '../screens/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_theme.dart';

class AllTexts extends StatelessWidget {
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
        ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: allTexts.length,
            itemBuilder: (context, int index) {
              final allText = allTexts[index];
              return ListTile(
                title: Text(allText.title),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => displayText(paragraphText:allText)));
                  // print('tapped');
                },
              );
              // Container(

        
              //     margin: const EdgeInsets.only(top: 20),
              //     child: Row(
              //       children: [
              //         SizedBox(
              //           width: 20,
              //         ),
              //         GestureDetector(
              //           onTap: () {
              //             print('tapped');
                      
              //           },
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Text(
              //                 allChat.text_title.name,
              //                 style: MyTheme.heading2.copyWith(
              //                   fontSize: 16,
              //                 ),
              //               ),
              //               Text(
              //                 allChat.text,
              //                 style: MyTheme.bodyText1,
              //               ),
              //             ],
              //           ),
              //         ),
              //         Spacer(),
        
              //       ],
              //     ));
            })
      ],
    );
  }
}
