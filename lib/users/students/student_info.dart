import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/functions/functions.dart';

class StudentInfo extends StatefulWidget {

  @override
  StudentInfoState createState() => StudentInfoState();
}

class StudentInfoState extends State<StudentInfo> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement Notes build
    return Scaffold(
      //appBar: Functions.appBar("Information", Icons.add, context),
      drawer: Functions.sideBar(context),
      //bottomNavigationBar: Functions.navBar(context),

      body: ListView(
        children: <Widget>[
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage('http://templates.scriptsbundle.com/opportunities-v3/demo/images/users/3.jpg'),
                radius: 70.0,
              ),
              SizedBox(width: 30),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Maria Silva", textAlign: TextAlign.left,style: TextStyle(fontSize: 25)),
                  Text("mariasilva@sm.com"),
                ],
              )
            ],
          ),
          _infoS('Title Here', 'Info here'),
          _infoS('Title Here', 'Info here'),
          _infoS('Title Here', 'Info here'),
          _infoS('Title Here', 'Info here'),


        ],
      ),

    );
  }

  Widget _infoField(String title, String info) {
    return new ListTile(

      title: Text(title),
      subtitle: Text(info),

    );
  }

  Widget _infoS(String i, String sub) {
    return Card(
      color: Colors.transparent,
      shape: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 0.5,
            color: Colors.grey,
          )),
      child: ListTile(
          title: Text(i.toString()),
          subtitle: Text(sub),
          trailing: Icon(Icons.info_outline),
    ),
    elevation: 0.0,
    );
  }
}