import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/functions/functions.dart';

class StudentEdit extends StatefulWidget {
  @override
  StudentEditState createState() => StudentEditState();
}

class StudentEditState extends State<StudentEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Functions.appBar("Edit Teacher", Icons.add, SizedBox()),
      drawer: Functions.sideBar(context),
      //bottomNavigationBar: Functions.navBar(context),
      body: new Container(
        child: new Center(
          child: new RefreshIndicator(
            child: new ListView(
              children: <Widget>[
                Hero(
                  tag: 'hero',
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 48.0,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
                SizedBox(height: 48.0),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/teachers');
                    },
                    padding: EdgeInsets.all(12),
                    color: Colors.lightBlueAccent,
                    child:
                        Text('Log In', style: TextStyle(color: Colors.white)),
                  ),
                ),
                FlatButton(
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(color: Colors.black54),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            onRefresh: () {
              // TODO: Make more robust refresh
              _refreshPage();
            },
          ),
        ),
      ),
    );
  }

  Future<void> _refreshPage() async {
    Navigator.of(context).pushNamed('/teachers');
  }
}
