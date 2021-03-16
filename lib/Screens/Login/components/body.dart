import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_purple/Screens/Login/components/background.dart';
import 'package:flutter_login_purple/Screens/Signup/signup_screen.dart';
import 'package:flutter_login_purple/components/already_have_an_account_acheck.dart';
import 'package:flutter_login_purple/components/rounded_button.dart';
import 'package:flutter_login_purple/components/rounded_input_field.dart';
import 'package:flutter_login_purple/components/rounded_password_field.dart';
import 'package:lottie/lottie.dart';




class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

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
            TextInputField(
              icon: Icons.email_outlined,
              hint: 'Email',
              inputType: TextInputType.emailAddress,
              inputAction: TextInputAction.next,
            ),
            Container(
              child: PasswordInput(
                icon: Icons.lock,
                hint: "Password",
                inputAction: TextInputAction.done,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: RoundedButton(
                text: "LOGIN",
                press: () {},
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
}
