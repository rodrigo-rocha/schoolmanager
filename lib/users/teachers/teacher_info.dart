import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/functions/functions.dart';
import 'package:flutter_app_ihc/users/teachers/teacher_list.dart';
import 'package:url_launcher/url_launcher.dart';

TextEditingController subjectController = new TextEditingController();
TextEditingController bodyController = new TextEditingController();

class TeacherInfo extends StatefulWidget {

  @override
  TeacherInfoState createState() => TeacherInfoState();
}

int edit_cont;

class TeacherInfoState extends State<TeacherInfo> {

  void choiceActions(String choice) {
    if(choice == 'Edit') {
      edit_cont = t_idx;
      Navigator.pushReplacementNamed(context, '/teacher_edit');
    } else if(choice == 'Delete') {
      _showDialog();
    }
  }

  Widget popUpButton(){
    return PopupMenuButton<String> (
      onSelected: choiceActions,
      itemBuilder: (BuildContext context) {
        return ['Edit', 'Delete'].map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: Functions.appBar("Information", Icons.add, popUpButton()),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(teachersList[t_idx].photo),
                radius: 70.0,
              ),
              SizedBox(width: 30),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(teachersList[t_idx].name, textAlign: TextAlign.left,style: TextStyle(fontSize: 25)),
                  Text(teachersList[t_idx].email),

                ],
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              miniIcons("Schedule", Icons.calendar_today, () => Navigator.of(context).pushNamed('/week_schedule'), Colors.blue),
              miniIcons("Shared Docs", Icons.folder_shared, () => Navigator.of(context).pushNamed('/shared_docs'), Colors.blue),
              availIcon(new Random().nextInt(10)),
            ],
          ),
          _infoT(teachersList[t_idx].email, 'E-Mail', traillingAction(Icons.mail_outline, "Send Email", () { _showMailDialogue(); } )),
          _infoT(teachersList[t_idx].phone, 'Phone', traillingAction(Icons.phone, "Call", () { _openWith('tel:${teachersList[t_idx].phone}'); })),
          _infoT(teachersList[t_idx].courses, 'Courses', traillingAction(Icons.description, "Information", () { _googleSearch(teachersList[t_idx].courses); })),
          _infoT(teachersList[t_idx].department, 'Department', traillingAction(Icons.place, "Locate", () { Functions.showLocation(context,'assets/images/dept_location.png'); })),
          _infoT(teachersList[t_idx].office, 'Office', traillingAction(Icons.place, "Locate", () { Functions.showLocation(context,'assets/images/location.png'); } )),
        ],
      ),

    );
  }

  Widget miniIcons(String label, IconData icon, action(), Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        IconButton(icon: Icon(icon), color: color, onPressed: () { action(); },),
        Text(label, style: TextStyle(color: color),),
      ],
    );
  }

  Widget availIcon(int avail) {
    if(avail%2 == 0) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.fiber_smart_record, color: Colors.green),
          Text("Not at class", style: TextStyle(color: Colors.green),),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.fiber_smart_record, color: Colors.red),
          Text("At class", style: TextStyle(color: Colors.red),),
        ],
      );
    }

  }

  Widget _infoT(String title, String sub, Widget traillingAction) {
    return Card(
      color: Colors.transparent,
      shape: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 0.5,
            color: Colors.grey,
          )),
      child: ListTile(
        title: Text(title),
        subtitle: Text(sub),
        trailing: traillingAction,
      ),
      elevation: 0.0,
    );
  }

  Widget traillingAction(IconData icon, String text, actions()) {
    return GestureDetector(
      child: Container(
        width: 70,
        child: Column(
            children: <Widget>[
              Icon(icon, color: Colors.blue,),
              Text(text, style: TextStyle(color: Colors.blue),),
            ]
        ),
      ),
      onTap: () {
        actions();
      },
    );
  }



  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Delete ${teachersList[t_idx].name}"),
          content: new Text("Are you sure you want to delete ${teachersList[t_idx].name}?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Delete", style: TextStyle(color: Colors.red, fontSize: 17)),
              onPressed: () {
                teachersList.removeAt(t_idx);
                Navigator.pushNamed(context, '/user_tab_controller');
              },
            ),
            new FlatButton(
              child: new Text("Close", style: TextStyle(fontSize: 17)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void confirmationEmail() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Email sent"),
          content: new Text("Email send to ${teachersList[t_idx].email}."),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Close", style: TextStyle(fontSize: 17)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showMailDialogue() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return ListView(
          children: <Widget>[
            AlertDialog(
              title: Column(children: <Widget>[Text("Destination: ", style: TextStyle(fontWeight: FontWeight.bold)), new Text("${teachersList[t_idx].email}"),],),
              content: Column(
              children: <Widget>[
                TextField(
                  controller: subjectController,
                  decoration: InputDecoration(
                    hintText: "Subject",
                  ),
                ),
                TextField(
                  controller: bodyController,
                  maxLines: 15,
                  decoration: InputDecoration(
                    hintText: "Message",
                  ),
                ),
              ],
            ),

            //new Text("Are you sure you want to delete ${teachersList[t_idx].name}?"),
            actions: <Widget>[
            // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Close", style: TextStyle(fontSize: 17)),
                onPressed: () {
                //teachersList.removeAt(t_idx);
                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(
                child: new Text("Send", style: TextStyle(color: Colors.green, fontSize: 17)),
                onPressed: () {
                  Navigator.of(context).pop();
                  confirmationEmail();
                  },
                ),
              ],
            )
          ],
        );
      },
    );
  }

  _openWith(String url) async{
    //const url = urlProp;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _googleSearch(String query) async {
    String url = 'https://www.google.com/search?q=$query';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}