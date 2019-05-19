import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/login/auth_functions.dart';
import 'package:flutter_app_ihc/functions/functions.dart';

TextEditingController emailController = new TextEditingController();
final FocusNode _emailFocus = FocusNode();

class ForgetPassword extends StatefulWidget {

  @override
  ForgetPasswordState createState() => ForgetPasswordState();
}

class ForgetPasswordState extends State<ForgetPassword> {

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
            info(),

            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 15),
                  AuthFunctions.credWidget("E-Mail", false, Icons.mail_outline, emailController, _emailFocus, _emailFocus, context),
                ],
              ),
            ),
            SizedBox(height: 15),
            sendButton(),
            SizedBox(height: 15),
            AuthFunctions.goBack(context),
          ],
        ),
      ),
    );
  }

  Widget info() {
    return Container(
      padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
      child: Text(
        "An e-mail will be sent in order to recover the password.\nPlease insert the e-mail associated with the account.",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15.0,
        ),
      ),
    );
  }

  Widget sendButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            Navigator.of(context).pushNamed('/login');
          }
        },
        padding: EdgeInsets.all(12),
        color: Colors.blue,
        child: Text("SEND E-MAIL",
          style: TextStyle(
              fontSize: 15,
              color: Colors.white
          ),
        ),
      ),
    );
  }
}