import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_purple/Screens/Admin/admin_home/admin_home_screen.dart';
import 'package:flutter_login_purple/Screens/Admin/admin_login/components/background.dart';
import 'package:flutter_login_purple/Screens/Student/Home/home_screen.dart';
import 'package:flutter_login_purple/Screens/Student/Signup/signup_screen.dart';
import 'package:flutter_login_purple/components/already_have_an_account_acheck.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../admin_signup/signup_screen2.dart';


class Body extends StatefulWidget {
  Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String _email;
  String _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  get app => null;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(

      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height:40),
              Container(height: 290,
                width: 290,
                child:
                Lottie.asset('assets/images/2.json'),
              ),
              //Email
              Container(
                height: size.height * 0.08,
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.grey[500].withOpacity(0.5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  onSaved: (value){
                    _email = value;
                  },

                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.email_outlined, color: Colors.white, size: 20,) ,
                      hintText: "Enter Your Email",
                      hintStyle: TextStyle(fontSize: 13, color: Colors.white, height: 1.5, fontFamily: "NotoSerif-Bold")
                  ),

                  validator: (value) => value.isEmpty ? 'Enter Email' : null,

                ),
              ),
              SizedBox(height: 6,),
              //Password
              Container(
                height: size.height * 0.08,
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.grey[500].withOpacity(0.5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextFormField(
                  validator: (value) => value.length < 6 ? 'Enter Valid Password' : null,
                  onSaved: (input) => _password = input,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.lock_outline, color: Colors.white, size: 20,) ,
                      hintText: "Enter Password",
                      hintStyle: TextStyle(fontSize: 13, color: Colors.white, height: 1.5, fontFamily: "NotoSerif-Bold")
                  ),
                  obscureText: true,
                ),
              ),
              SizedBox(height: 13,),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: size.width * 0.5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: RaisedButton(

                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    color: Colors.indigo[400],

                    child: Text("LOGIN", style: TextStyle(color: Colors.white,fontFamily: "NotoSerif-Bold"),),
                    onPressed: (){
                      signIn();
                    },
                  ),
                ),
              ),
              SizedBox(height: 8,),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder:
                          (context) => signup_screen2())
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  void signIn() async{
    var email1;
    var password;

    FirebaseDatabase database = new FirebaseDatabase(app: app);
    var _messagesRef = database.reference().child("Admins");
    database.reference().once().then((DataSnapshot snapshot) {
      email1 = snapshot.value["Email"].toString();
      password = snapshot.value["Password"].toString();
    });
    final _formState = _formKey.currentState;
    if (_formState.validate()){
      _formState.save();
      try{
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context,
            MaterialPageRoute(builder:
                (context) => adminHomePage())
        );
      }on FirebaseAuthException catch(e){
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text('Please Enter Valid Email And Password')));
      }catch(e){
        print("error $e");
      }
    }
  }
}


