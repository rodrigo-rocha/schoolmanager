import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/functions/functions.dart';
import 'package:flutter_app_ihc/login/auth_functions.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

TextEditingController nameController = new TextEditingController();
TextEditingController newPassController = new TextEditingController();
TextEditingController emailController = new TextEditingController();
TextEditingController passwordController = new TextEditingController();

final FocusNode _emailFocus = FocusNode();
final FocusNode _nameFocus = FocusNode();
final FocusNode _passFocus = FocusNode();
final FocusNode _newPassFocus = FocusNode();

class Signup extends StatefulWidget {

  @override
  SignupState createState() => SignupState();
}

class SignupState extends State<Signup> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).detach();
        },
        child:
        ListView(
          children: <Widget>[
            SizedBox(height: 20),
            Functions.showLogo(),
            SizedBox(height: 40),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  AuthFunctions.credWidget("Name", false, Icons.account_circle, nameController, _nameFocus, _emailFocus, context),
                  SizedBox(height: 15),
                  AuthFunctions.credWidget("E-Mail", false, Icons.mail_outline, emailController, _emailFocus, _passFocus, context),
                  SizedBox(height: 15),
                  AuthFunctions.credWidget("Password", true, Icons.lock_outline, passwordController, _passFocus, _newPassFocus, context),
                  SizedBox(height: 15),
                  AuthFunctions.credWidget("Repeat Password", true, Icons.lock_outline, newPassController, _newPassFocus, _newPassFocus, context),
                ],
              ),
            ),
            SizedBox(height: 15),
            signupButton("SIGNUP", '/main_menu'),
            SizedBox(height: 15),
            AuthFunctions.goBack(context),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  Widget signupButton(String text, String path) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            if(passwordController.text != newPassController.text) {
              newPassController.text = '';
              passwordController.text = '';
              displayError();
            } else {
              Navigator.of(context).pushNamed('/login');
            }
          }

        },
        padding: EdgeInsets.all(12),
        color: Colors.blue,
        child: Text(text,
          style: TextStyle(
              fontSize: 15,
              color: Colors.white
          ),
        ),
      ),
    );
  }

  void displayError() {
    Alert(
      context: context,
      type: AlertType.error,
      title: "DIFFERENT PASSWORDS",
      desc: "Please enter the same password in both fields.",
      buttons: [
        DialogButton(
          child: Text(
            "CLOSE",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pop(context);
            FocusScope.of(context).requestFocus(_passFocus);
          }
        ),
      ],
    ).show();
  }
}