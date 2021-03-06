import 'package:flutter/cupertino.dart';
import 'package:kathak/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:kathak/utils/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kathak',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // bottomSheetTheme: BottomSheetThemeData(
        //     backgroundColor: Colors.black.withOpacity(1)),
        // primarySwatch: Colors.red,
      ),
      home: WelcomeScreen(),
    );
  }
}

