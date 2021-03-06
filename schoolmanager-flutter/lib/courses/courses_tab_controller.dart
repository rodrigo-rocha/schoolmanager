import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/courses/current/current_courses.dart';
import 'package:flutter_app_ihc/courses/finished/finished_courses.dart';
import 'package:flutter_app_ihc/main.dart';
import 'package:flutter_app_ihc/courses/course_details.dart';
import 'package:flutter_app_ihc/functions/functions.dart';

class CoursesTabController extends StatefulWidget {
  @override
  CoursesTabControllerState createState() => new CoursesTabControllerState();
}

class CoursesTabControllerState extends State<CoursesTabController> {

  void choiceActions(String choice) {
    if(choice == 'Add course') {
      Navigator.of(context).pushNamed('/course_add');
    } else if(choice == 'Add finished course') {
      Navigator.of(context).pushNamed('/finished_course_add');
    }
  }

  Widget popUpButton(){
    return PopupMenuButton<String> (
      onSelected: choiceActions,
      itemBuilder: (BuildContext context) {
        return ['Add course', 'Add finished course'].map((String choice) {
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
    return new DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: Functions.sideBar(context),
        appBar: AppBar(
          actions: <Widget>[
            popUpButton()
          ],
          centerTitle: true,
          title: Text('Courses', textAlign: TextAlign.left ,
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.blue,
            ),
          ),
          elevation: 0.5,
          iconTheme: IconThemeData(
            color: Colors.blue,
          ),
          backgroundColor: Colors.white,
          bottom: TabBar(
            indicatorColor: Colors.blue,
            labelColor: Colors.blue,
            tabs: [
              Tab(child: Text("Current", style: TextStyle(fontSize: 21.0, color: Colors.blue))),
              Tab(child: Text("Finished", style: TextStyle(fontSize: 21.0, color: Colors.blue))),
              Tab(child: Text("Info", style: TextStyle(fontSize: 21.0, color: Colors.blue))),
            ],
          ),
          //title: Text('Notes'),
        ),
        body: TabBarView(
          children: [
            new CoursesList(),
            new FinishedCoursesList(),
            new CourseDetails(),
          ],
        ),
      ),
    );
  }

}