import 'package:kathak/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:kathak/utils/session_data.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key,}): super(key:key);
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String username = '';
  String password = '';
  late Session session;

  @override
  void initState() {
    super.initState();
    session = Session();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding:const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              top: 60.0),
            child: Center(
              child: Container(
                  width: 200,
                  height: 150,
                  child: Image.asset('assets/images/logo.png')),
            ),
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              250.0,
              20.0,
              250.0,
              20.0,
            ),
            child: TextField(
              onChanged: (value) {
                username = value;
              },
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration:const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                  hintText: 'Enter username'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 250.0, right: 250.0),
            child: TextField(
              onChanged: (value) {
                password = value;
              },
              obscureText: true,
              decoration:const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'Enter password',
              ),
              cursorColor: Theme.of(context).primaryColor,
              cursorRadius: const Radius.circular(8.0),
              cursorWidth: 4.0,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            height: 50,
            width: 100,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
              onPressed: ()async {
                if (username.isEmpty || password.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Please fill out all fields',
                      ),
                    ),
                  );
                  return;
                }

                final bool checkError = await session.addUser(username,password);
                if (checkError){
                  ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Username already Exists',
                    ),
                  ),
                  );
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Successfully created account'),
                    ),
                  );
                  Navigator.pushReplacement(
                    context,
                    CupertinoPageRoute(builder: (context) => LoginScreen())
                  );
                }
              },   // Navigator.pop(context);
              child:const Text(
                'Register',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
            },
            child: const Text(
              'Already a member? Login',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}