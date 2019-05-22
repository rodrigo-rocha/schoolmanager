import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/functions/functions.dart';
import 'package:flutter_app_ihc/courses/finished/finished_courses.dart';
import 'package:flutter_app_ihc/courses/current/current_courses.dart';

class FinishedCoursesInfo extends StatefulWidget {
  @override
  FinishedCoursesInfoState createState() => FinishedCoursesInfoState();
}

class FinishedCoursesInfoState extends State<FinishedCoursesInfo> {

  void choiceActions(String choice) {
    if(choice == 'Edit') {
      Navigator.of(context).pushNamed('/finished_course_edit');
    } else if(choice == 'Delete') {
      print("This");
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
      drawer: Functions.sideBar(context),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 10),

          _infoC(finishedCoursesList[finished_index].name, 'Name', traillingAction(Icons.mail_outline, "Send Email", () {print("this");} )),
          _infoC(finishedCoursesList[finished_index].grade, 'Final Grade', traillingAction(Icons.description, "Information", () {print("this");})),
          _infoC(finishedCoursesList[finished_index].code, 'Code', traillingAction(Icons.phone, "Call", () {print("this");})),
          _infoC(finishedCoursesList[finished_index].department, 'Department', traillingAction(Icons.place, "Locate", () {print("this");})),
          //_infoC(finishedCoursesList[finished_index].coordinator, 'Coordinator', traillingAction(Icons.place, "Locate", () {print("this");} )),
        ],
      ),

    );
  }

  Widget _infoC(String title, String sub, Widget traillingAction) {
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
        width: 100,
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
}