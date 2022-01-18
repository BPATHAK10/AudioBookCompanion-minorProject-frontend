import 'package:audiobook_companion/screens/addTextscreen.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // int _selectedIndex = 0;
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  // final List<Widget> _widgetOptions = <Widget>[
  //   MainPage(),
  //  Container(
  //     child: Text(
  //       'Index 1: Recents',
  //       style: optionStyle,
  //     ),
  //   ),
  //   Container(
  //     child: Text(
  //       'Index 2: Info',
  //       style: optionStyle,
  //     ),
  //   ),
  // ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Audio Companion"),
      ),
      body: Center(
      child:const Text("Audio Companion", style: TextStyle(fontSize: 40),),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => addTextScreen()),
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       title: Text("Home"),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.history),
      //       title: Text("Recents"),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.info_outline_rounded),
      //       title: Text("Info"),
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.amber[800],
      //   onTap: _onItemTapped,
      // ),
    );
  }
}