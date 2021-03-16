import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_purple/Screens/Signup/components/background.dart';
import 'package:flutter_login_purple/Screens/Signup/components/or_divider.dart';
import 'package:flutter_login_purple/Screens/admin_login/login_screen2.dart';
import 'package:flutter_login_purple/components/already_have_an_account_acheck.dart';
import 'package:flutter_login_purple/components/rounded_button.dart';
import 'package:flutter_login_purple/components/rounded_small_input_field.dart';
import 'package:flutter_login_purple/components/rounded_input_field.dart';
import 'package:flutter_login_purple/components/rounded_password_field.dart';


class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            SizedBox(height: 120),
            Row(
              children: [
                SizedBox(width: 33,),
                SmallTextInputField(
                  icon: Icons.account_circle_outlined,
                  hint: 'First Name',
                  inputType: TextInputType.name,
                  inputAction: TextInputAction.next,
                ),
                SmallTextInputField(
                  icon: Icons.account_circle_outlined,
                  hint: 'Last Name',
                  inputType: TextInputType.name,
                  inputAction: TextInputAction.next,
                ),
              ],
            ),
            TextInputField(
              icon: Icons.account_box_outlined,
              hint: "User ID",
              inputType: TextInputType.numberWithOptions(decimal: false, signed: false),
              inputAction: TextInputAction.next,
            ),
            TextInputField(
              icon: Icons.email_outlined,
              hint: 'Email',
              inputType: TextInputType.emailAddress,
              inputAction: TextInputAction.next,
            ),
            PasswordInput(
              icon: Icons.lock_outline,
              hint: "Password"
              ,inputAction: TextInputAction.next,
            ),
            PasswordInput(
              icon: Icons.lock_outline,
              hint: "Confirm Password"
              ,inputAction: TextInputAction.done,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedButton(
              text: "SIGNUP",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
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
            OrDivider(),
          ],
        ),
      ),
    );
  }
}
