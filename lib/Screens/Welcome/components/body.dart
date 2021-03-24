import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_purple/Screens/Student/Login/login_screen.dart';
import 'package:flutter_login_purple/Screens/Welcome/components/background.dart';
import 'package:flutter_login_purple/Screens/Admin/admin_login/login_screen2.dart';
import 'package:flutter_login_purple/components/rounded_button.dart';
import 'package:flutter_login_purple/constants.dart';
import 'package:lottie/lottie.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This size provide us total height and width of our screen
    return SingleChildScrollView(
      child: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 45 ,),
              Container(
                width: 350,
                child: Lottie.asset('assets/images/5.json'),
              ),
              SizedBox(height: 30,),
              Container(
                  alignment: AlignmentDirectional.topStart,
                  margin: EdgeInsets.only(left: 30),
                  child:
                  Text("Choose what you are: ", style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontFamily: "NotoSerif-Bold" ),
                  )
              ),
              SizedBox(height: 25,),
              RoundedButton(
                text: "Admin",
                color: kPrimaryColor,
                textColor: Colors.white,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return login_screen2();
                      },
                    ),
                  );
                },
              ),
              RoundedButton(
                text: "Student",
                color: kPrimaryColor,
                textColor: Colors.white,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}