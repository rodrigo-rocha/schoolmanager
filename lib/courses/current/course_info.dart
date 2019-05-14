import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/functions/functions.dart';
import 'package:flutter_app_ihc/courses/current/current_courses.dart';
import 'package:flutter_app_ihc/classes/Course.dart';
import 'package:flutter_app_ihc/courses/finished/finished_courses.dart';

class CourseInfo extends StatefulWidget {

  @override
  CourseInfoState createState() => CourseInfoState();
}

class CourseInfoState extends State<CourseInfo> {

  void choiceActions(String choice) {
    if(choice == 'Edit') {
      Navigator.of(context).pushNamed('/course_edit');
    } else if(choice == 'Delete') {
      courseList.removeAt(t_idx);
      Navigator.of(context).pushNamed('/courses_tab_controller');
    } else {
      print(t_idx);
      finishedCoursesList.add(new Course(courseList[t_idx].name, courseList[t_idx].code, courseList[t_idx].department, courseList[t_idx].coordinator,  '16', []));
      courseList.removeAt(t_idx);
      Navigator.of(context).pushNamed('/courses_tab_controller');
    }
  }

  Widget popUpButton(){
    return PopupMenuButton<String> (
      onSelected: choiceActions,
      itemBuilder: (BuildContext context) {
        return ['Edit','Delete','Send to finished courses'].map((String choice) {
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
    print(t_idx);

    // TODO: implement Notes build
    return Scaffold(
      appBar: Functions.appBar("Information", Icons.add, popUpButton()),

      body: ListView(
        children: <Widget>[
          _infoExams(traillingAction(Icons.keyboard_arrow_right, "Exams information", () { Navigator.of(context).pushNamed('/course_exams'); } )),
          Container(height: 10, color: Colors.grey[200]),
          _infoT(courseList[t_idx].name, 'Name', traillingAction(Icons.text_fields, "Send Email", () {print("this");} )),
          _infoT(courseList[t_idx].code, 'Code', traillingAction(Icons.code, "Call", () {print("this");})),
          _infoT(courseList[t_idx].department, 'Department', traillingAction(Icons.place, "Locate", () {print("this");})),
          _infoT(courseList[t_idx].coordinator, 'Coordinator', traillingAction(Icons.account_circle, "Information", () {print("this");} )),


        ],
      ),

    );
  }

  Widget _infoExams(Widget traillingAction) {
    return Card(
      color: Colors.transparent,
      child: ListTile(
        title: Text('Exam Information'),
        trailing: traillingAction,
      ),
      elevation: 0.0,
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