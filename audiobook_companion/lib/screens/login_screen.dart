import 'package:flutter/cupertino.dart';
import 'package:kathak/screens/home_screen.dart';
import 'package:kathak/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:kathak/utils/session_data.dart';
// import 'package:dummy/utils/paragraph_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key,}): super(key:key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
            padding: const EdgeInsets.only(
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
            padding:const EdgeInsets.fromLTRB(
              250.0,
              20.0,
              250.0,
              20.0,
            ),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                username = value;
              },
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
                hintText: 'Enter username',
              ),
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
              decoration: const InputDecoration(
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
            height: 50,
            width: 100,
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
              onPressed: () async{
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
                final bool checkError = await session.setUser(username, password);
                if (checkError){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Invalid Username of Password',
                      ),
                    ),
                   );
                }
                else{
                  Navigator.pushReplacement(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => HomeScreen(session: session,),
                    ),
                  );
                } 
              },
              child: const Text(
                'Login',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          const SizedBox(height:20),
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Nope',
                  ),
                ),
              );
            },
            child: const Text(
              'Forgot Password',
              style: TextStyle(color: Colors.blue, fontSize: 15),
            ),
          ),
          const SizedBox(height:30),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                CupertinoPageRoute(
                    builder: (context) => RegisterScreen(),
                ),
              );
            },
            child: const Text(
              'New user? Create an account',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}