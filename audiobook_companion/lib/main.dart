import 'package:kathak/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        brightness: Brightness.light,

        primaryColor: Colors.teal[200],
        primarySwatch: Colors.lightBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,

        fontFamily:  GoogleFonts.roboto().fontFamily,
      ),
      home: const WelcomeScreen(),
    );
  }
}

