import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_purple/Screens/Student/Home/home_screen.dart';
import 'package:flutter_login_purple/Screens/Student/Signup/components/or_divider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_login_purple/Screens/Student/Signup/components/background.dart';


class Body extends StatefulWidget {
  Body({this.app});
  final FirebaseApp app;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // SignUP
  String _email;
  String _password;
  String _currentStateSelected;

  Future<void> _createUser() async{
    try{
      UserCredential _userCredential = await FirebaseAuth
          .instance
          .createUserWithEmailAndPassword(email: _email, password: _password);
    } on FirebaseAuthException catch(e){
      print("error $e");
    }catch(e){
      print("error $e");
    }
  }

  final _formKey = GlobalKey<FormState>();

  final List<String> majors = ['IT', 'Business', 'English'];
  String dropdownValue = 'IT';

  // Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final idController = TextEditingController();
  final firstNameController = TextEditingController();
  final secondNameController = TextEditingController();
  final majorController = TextEditingController();
  /// Clear Method

  void clearTextInput(){
    emailController.clear();
    passwordController.clear();
    idController.clear();
    firstNameController.clear();
    secondNameController.clear();
  }

  @override
  Widget build(BuildContext context) {

    final dbRef = FirebaseDatabase.instance.reference();
    final userEmail = "StudentInfo";
    Size size = MediaQuery.of(context).size;

    return Background(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 100),
              /// First Name and Second Name
              Row(
                children: [
                  SizedBox(width: 33,),
                  Container(
                    height: size.height * 0.08,
                    width: size.width * 0.4,
                    decoration: BoxDecoration(
                      color: Colors.grey[500].withOpacity(0.5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: TextFormField(
                      controller: firstNameController,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.perm_identity, color: Colors.white, size: 20,),
                          labelText: "First Name",
                          labelStyle: TextStyle(color: Colors.white, fontSize: 13)
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter Valid Name';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 2,),
                  Container(
                    height: size.height * 0.08,
                    width: size.width * 0.4,
                    decoration: BoxDecoration(
                      color: Colors.grey[500].withOpacity(0.5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: TextFormField(
                      controller: secondNameController,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.perm_identity, color: Colors.white, size: 20,),
                          labelText: "Second Name",
                          labelStyle: TextStyle(color: Colors.white, fontSize: 13)
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter Valid Name';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6,),
              /// ID
              Container(
                height: size.height * 0.08,
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.grey[500].withOpacity(0.5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextFormField(
                  controller: idController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.perm_identity, color: Colors.white, size: 20,),
                      labelText: "User ID",
                      labelStyle: TextStyle(color: Colors.white)
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) => value.isEmpty ? 'Enter Valid ID' : null,
                ),
              ),
              SizedBox(height: 6,),
              /// Major
              Container(
                height: size.height * 0.08,
                width: size.width * 0.4,
                decoration: BoxDecoration(
                  color: Colors.grey[500].withOpacity(0.5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: DropdownButtonFormField(
                 icon: Icon(Icons.arrow_downward) ,
                  items: ['IT', 'Business', 'English'].map((major) {
                    return DropdownMenuItem(
                      value: major,
                      child: Text('$major',),
                    );
                  }).toList(),
                  onChanged: (String stored){
                   setState(() {
                     this._currentStateSelected = stored;
                   });
                  },
                  value: _currentStateSelected,

                ),
              ),
              SizedBox(height: 6,),
              /// Email
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
                  onChanged: (value){
                  _email = value;
                  print("email: $_email");
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                    prefixIcon: Icon(Icons.email_outlined, color: Colors.white, size: 20,),
                    labelText: "Enter Email",
                    labelStyle: TextStyle(color: Colors.white)
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) => value.isEmpty ? 'Enter Email' : null,
                ),
              ),
              SizedBox(height: 6,),
              /// Password
              Container(
                height: size.height * 0.08,
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.grey[500].withOpacity(0.5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextFormField(
                  controller: passwordController,
                  autocorrect: true,
                  keyboardType: TextInputType.visiblePassword,
                  onChanged: (value) {
                    _password = value;
                    print("password is: $_password");
                  },
                  validator: (_password) => _password.length <6 ? 'Please Enter Valid Password' : null,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                    prefixIcon: Icon(Icons.lock_outline, color: Colors.white, size: 20,) ,
                    labelText: "Enter Password",
                      labelStyle: TextStyle(color: Colors.white)
                  ),
                  // The validator receives the text that the user has entered.
                ),
              ),
              SizedBox(height: size.height * 0.08,),
              // Button
              Container(
                 margin: EdgeInsets.symmetric(vertical: 10),
                 width: size.width * 0.5,
                 child: ClipRRect(
                     borderRadius: BorderRadius.circular(29),
                     child: RaisedButton(
                       padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                       color: Colors.lightBlue,
                       onPressed: () {
                         if (_formKey.currentState.validate()) {
                           dbRef.child("Users").push().child(userEmail).set({
                             "email": emailController.text,
                             "password": passwordController.text,
                             "First Name": firstNameController.text,
                             "Second Name": secondNameController.text,
                             "Email": emailController.text,
                             "password": passwordController.text,
                             "ID": idController.text,
                           }).then((_) {
                             Scaffold.of(context).showSnackBar(
                                 SnackBar(content: Text('Successfully Added')));
                             emailController.clear();
                             passwordController.clear();
                           }).catchError((onError) {
                             Scaffold.of(context)
                                 .showSnackBar(SnackBar(content: Text(onError)));
                           }).asStream();
                           _createUser();
                           clearTextInput();
                           Navigator.push(
                             context,
                             MaterialPageRoute(
                               builder: (context) {
                                 return studentHomePage();
                               },
                             ),
                           );
                         }
                       },
                       child: Text(
                        "SIGNUP",
                       style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
              OrDivider(),
            ],
          ),
        ),

      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    secondNameController.dispose();
    idController.dispose();
    passwordController.dispose();
    emailController.dispose();
  }
}
class Drop extends StatefulWidget {
  @override
  _DropState createState() => _DropState();
}

class _DropState extends State<Drop> {
  String currentItemSelected ;
  String nameCity = "";
  List listItem = ["ITC", "Business", "English Literature"];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[500].withOpacity(0.5),
              borderRadius: BorderRadius.circular(16),
            ),
            height: size.height * 0.08,
            width: size.width * 0.8,
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: DropdownButton(
              hint: Center(
                child:
                Text("Select Major:",
                  style: TextStyle(fontSize: 15, color: Colors.white, height: 1.5,fontFamily: "NotoSerif-Bold" ),
                ),
              ),
              isExpanded: true ,
              icon: Center(
                  child:
                  Icon(Icons.arrow_drop_down_circle_outlined, color: Colors.white, )),

              style: TextStyle(color: Colors.blueGrey, fontFamily: "NotoSerif-Bold" ),

              dropdownColor: Colors.red[50],
              items: listItem.map((dropDownStringItem) {
                return DropdownMenuItem  (
                  value: dropDownStringItem,
                  child: Text(dropDownStringItem),
                );
              }).toList(),
              focusColor: Colors.grey.withOpacity(0.5),
              onChanged: ( var newValueSelected){
                setState(() {
                  this.currentItemSelected = newValueSelected;
                });
              },
              value: currentItemSelected,
            ),
          ),
        )


    );
  }
}