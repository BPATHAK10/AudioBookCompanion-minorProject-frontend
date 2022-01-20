import 'package:audiobook_companion/screens/text_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../models/paragraph_text_model.dart';
import '../screens/screen.dart';

import '../app_theme.dart';

class RecentTexts extends StatelessWidget {
  const RecentTexts({
    Key ?key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 30),
          child: Row(
            children: [
              Text(
                'Your Text',
                style: MyTheme.heading2,
              ),
              Spacer(),
              Icon(
                Icons.search,
                color: MyTheme.kPrimaryColor,
              )
            ],
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: recentTexts.length,
            itemBuilder: (context, int index) {
              final recentText = recentTexts[index];
              return ListTile(
                title: Text(recentText.title),
                onTap: (){
                  // print("tapped arko");
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => displayText(paragraphText: recentText,)
                    ),
                  );
                },
              );
              // Container(
              //     margin: const EdgeInsets.only(top: 20),
              //     child: Row(
              //       children: [
              //         CircleAvatar(
              //           radius: 28,
              //           backgroundImage: AssetImage(recentChat.avatar),
              //         ),
              //         SizedBox(
              //           width: 20,
              //         ),
              //         GestureDetector(
              //           onTap: () {
              //             ;
              //           },
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Text(
              //                 recentChat.text_title.name,
              //                 style: MyTheme.heading2.copyWith(
              //                   fontSize: 16,
              //                 ),
              //               ),
              //               Text(
              //                 recentChat.text,
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
