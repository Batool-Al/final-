import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_purple/Screens/Student/Home/home_screen.dart';
import 'package:flutter_login_purple/Screens/Student/Login/components/background.dart';
import 'package:flutter_login_purple/Screens/Student/Signup/signup_screen.dart';
import 'package:flutter_login_purple/components/already_have_an_account_acheck.dart';
import 'package:flutter_login_purple/components/rounded_button.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';




// ignore: must_be_immutable
class Body extends StatelessWidget {
   Body({
    Key key,
  }) : super(key: key);

  String _email;
  String _password;


  Future<void> _login() async{
    try{
      UserCredential _userCredential = await FirebaseAuth
          .instance
          .signInWithEmailAndPassword(email: _email, password: _password);
    } on FirebaseAuthException catch(e){
      print("error $e");
    }catch(e){
      print("error $e");
    }
  }

   final emailController = TextEditingController();
   final passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(

      child: SingleChildScrollView(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height:40),
            Container(height: 290,
              width: 290,
              child:
              Lottie.asset('assets/images/1.json'),
            ),
            Container(
              height: size.height * 0.08,
              width: size.width * 0.8,
              decoration: BoxDecoration(
                color: Colors.grey[500].withOpacity(0.5),
                borderRadius: BorderRadius.circular(16),
              ),
              child: TextFormField(
                onFieldSubmitted: (value){
                  _email = value;
                },
                controller: emailController,
                validator: (value) => value.isEmpty ? 'Enter Email' : null,

              ),
            ),
            Container(
              height: size.height * 0.08,
              width: size.width * 0.8,
              decoration: BoxDecoration(
                color: Colors.grey[500].withOpacity(0.5),
                borderRadius: BorderRadius.circular(16),
              ),
              child: TextFormField(
                onFieldSubmitted: (value){
                  _password = value;
                },
                controller: passwordController,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: RoundedButton(
                text: "LOGIN",
                press: () {
                  _login();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return studentHomePage();
                      },
                    ),
                  );
                },
              ),
            ),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
   @override
   void dispose() {
     passwordController.dispose();
     emailController.dispose();
   }
}
