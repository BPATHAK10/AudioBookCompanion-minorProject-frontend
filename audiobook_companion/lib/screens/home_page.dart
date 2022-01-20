import 'package:audiobook_companion/screens/addText_page.dart';
import 'package:audiobook_companion/widgets/expandable_fab.dart';
import '../app_theme.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
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
            onPressed: ()=> Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => addTextScreen()
              ),
            ),
            // onPressed: () => _showAction(context, 1),
            icon: const Icon(Icons.upload_file),
          ),
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
