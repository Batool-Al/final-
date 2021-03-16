import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_purple/Screens/Signup/components/or_divider.dart';
import 'package:flutter_login_purple/components/rounded_input_field.dart';
import 'package:flutter_login_purple/components/rounded_small_input_field.dart';
import 'package:firebase_database/firebase_database.dart';


class Body extends StatefulWidget {
  Body({this.app});
  final FirebaseApp app;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  final _formKey = GlobalKey<FormState>();
  final listOfPets = ["IT", "Buseniss", "English"];
  String dropdownValue = 'Cats';
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final referenceDatase = FirebaseDatabase.instance;





  @override
  Widget build(BuildContext context) {
    final dbRef = FirebaseDatabase.instance.reference();

    final userEmail = "Users";
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 100),
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
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Enter Email",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter Email';
                }
                return null;
              },
            ),
            SizedBox(height: 20),

            SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: passwordController,
              decoration: InputDecoration(
                labelText: "Enter Password",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please Paswword';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            RaisedButton(
              color: Colors.lightBlue,
              onPressed: () {
                dbRef.child("Users").push().child(userEmail).set(emailController.text).asStream();
                dbRef.child("Users").push().child(userEmail).set(passwordController.text).asStream();

              },
              child: Text('Submit'),
            ),

            OrDivider(),
          ],
        ),
      ),

    );
  }
  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
    emailController.dispose();
  }
}



class drop extends StatefulWidget {
  @override
  _dropState createState() => _dropState();
}

class _dropState extends State<drop> {
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