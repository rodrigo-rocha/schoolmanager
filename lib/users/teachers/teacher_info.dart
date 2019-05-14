import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/functions/functions.dart';
import 'package:flutter_app_ihc/users/teachers/teacher_list.dart';
import 'package:flutter_app_ihc/users/teachers/teacher_edit.dart';

class TeacherInfo extends StatefulWidget {

  @override
  TeacherInfoState createState() => TeacherInfoState();
}

class TeacherInfoState extends State<TeacherInfo> {

  void choiceActions(String choice) {
    if(choice == 'Edit') {
      Navigator.pushNamed(context, '/teacher_edit');
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

    // TODO: implement Notes build
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
          _infoT(teachersList[t_idx].email, 'E-Mail', traillingAction(Icons.mail_outline, "Send Email", () {print("this");} )),
          _infoT(teachersList[t_idx].phone, 'Phone', traillingAction(Icons.phone, "Call", () {print("this");})),
          _infoT(teachersList[t_idx].courses, 'Courses', traillingAction(Icons.description, "Information", () {print("this");})),
          _infoT(teachersList[t_idx].department, 'Department', traillingAction(Icons.place, "Locate", () {print("this");})),
          _infoT(teachersList[t_idx].office, 'Office', traillingAction(Icons.place, "Locate", () {print("this");} )),
        ],
      ),

    );
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
              child: new Text("Go Back", style: TextStyle(fontSize: 17)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}