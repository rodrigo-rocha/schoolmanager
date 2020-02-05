import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/login/auth_functions.dart';
import 'package:flutter_app_ihc/functions/functions.dart';

TextEditingController emailController = new TextEditingController(text: "admin@admin.sm.pt");
TextEditingController passwordController = new TextEditingController(text: "*******");

final FocusNode _emailFocus = FocusNode();
final FocusNode _passFocus = FocusNode();

class Login extends StatefulWidget {

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
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
                    AuthFunctions.credWidget("E-Mail", false, Icons.mail_outline, emailController, _emailFocus, _passFocus, context),
                    SizedBox(height: 15),
                    AuthFunctions.credWidget("Password", true, Icons.lock_outline, passwordController, _passFocus, _passFocus, context),
                  ],
                )
            ),

            SizedBox(height: 15),
            forgotPassword(),
            SizedBox(height: 15),
            loginButton("LOGIN", '/menu'),
            SizedBox(height: 15),
            AuthFunctions.createAccount(context)
          ],
        ),
      ),
    );
  }

  Widget forgotPassword() {
    return Container(
      padding: EdgeInsets.only(right: 20.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed('/forget_password');
        },
        child: Text('Forgot Password',
            textAlign: TextAlign.end,
            style: TextStyle(
                fontWeight: FontWeight.bold
            )
        ),
      ),
    );
  }

  Widget loginButton(String text, String path) {

    return Padding(
      padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: () {
          if(_formKey.currentState.validate()) {
            Navigator.of(context).pushReplacementNamed(path);
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
}