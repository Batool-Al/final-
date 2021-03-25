
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_purple/Screens/Admin/admin_login/components/background.dart';
import 'package:flutter_login_purple/Screens/Student/Home/home_screen.dart';
import 'package:flutter_login_purple/Screens/Student/Signup/signup_screen.dart';
import 'package:flutter_login_purple/components/already_have_an_account_acheck.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';


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
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String Email = "Enter Your Email";

  void clearTextInput(){
    emailController.clear();
    passwordController.clear();
  }

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
                Lottie.asset('assets/images/1.json'),
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
                  controller: emailController,
                  onSaved: (value){
                    _email = value;
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: Email,
                      hintStyle: TextStyle(fontSize: 13, color: Colors.white, height: 1.5, fontFamily: "NotoSerif-Bold"),
                      prefixIcon: Icon(Icons.email_outlined, color: Colors.white, size: 20,) ,
                      labelStyle: TextStyle(color: Colors.white)
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
                  controller: passwordController,
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
                      clearTextInput();
                      },
                  ),
                ),
              ),
              SizedBox(height: 8,),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder:
                          (context) => SignUpScreen())
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
    final _formState = _formKey.currentState;
    if (_formState.validate() ){
      _formState.save();
      try{
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context,
            MaterialPageRoute(builder:
                (context) => studentHomePage())
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


