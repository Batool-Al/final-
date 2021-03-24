import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_purple/Screens/Start/start.dart';
import 'package:flutter_login_purple/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.indigo[50],
      ),
      home: StartScreen(),
    );


  }
}
class streamBuilder extends StatelessWidget {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
      builder: (context, snapshot){
          if(snapshot.hasError){
            return Scaffold(
              body: Center(
                child: Text("Error: ${snapshot.error}"),
              ),
            );
          }
          if(snapshot.connectionState == ConnectionState.done){
            return StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot){
                  if(snapshot.connectionState == ConnectionState.active){
                    User user = snapshot.data;
                  }
                  return StartScreen();
                }
                );
          }
          return Scaffold(
            body: Center(
              child: Text("checking"),
            ),
          );
      },
    );
  }
}

