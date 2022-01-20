import '../widgets/widgets.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    Key ?key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
         RecentTexts(), 
          SizedBox(
            height: 20,
          ),
          AllTexts(),
        ],
      ),
    );
  }
}
