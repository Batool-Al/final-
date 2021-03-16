import 'package:flutter/material.dart';


class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don’t have an Account ? " : "Already have an Account ? ",
          style: TextStyle(color: Colors.blueGrey, fontFamily: "NotoSerif-Bold"),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Sign Up" : "Sign In",
            style: TextStyle(
              color: Colors.lightBlue[900],
              fontWeight: FontWeight.bold,
              fontSize: 17, fontFamily: "NotoSerif-Bold",
            ),
          ),
        ),
        SizedBox(height: 30)
      ],
    );
  }
}