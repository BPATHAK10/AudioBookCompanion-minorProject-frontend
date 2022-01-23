import 'package:flutter/material.dart';
import 'package:dummy/Screens/Welcome/welcome_screen.dart';
import 'package:dummy/constants.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audiobook Companion',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:AnimatedSplashScreen(
        splash: Image.asset(
          'assets/images/logo.png',
        ),
          nextScreen: WelcomeScreen(),
          splashTransition:SplashTransition.fadeTransition,
          backgroundColor: Colors.white60,
          duration: 3000,
      ) 
    
    );
  }
}

