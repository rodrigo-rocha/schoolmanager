import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/courses/current/current_courses.dart';
import 'package:flutter_app_ihc/courses/finished/finished_courses.dart';
import 'package:flutter_app_ihc/main.dart';

class CoursesTabController extends StatefulWidget {
  @override
  CoursesTabControllerState createState() => new CoursesTabControllerState();
}

class CoursesTabControllerState extends State<CoursesTabController> {

  void choiceActions(String choice) {
    if(choice == 'Add course') {
      Navigator.of(context).pushNamed('/course_add');
    }
  }

  Widget popUpButton(){
    return PopupMenuButton<String> (
      onSelected: choiceActions,
      itemBuilder: (BuildContext context) {
        return ['Add course', 'Delete course'].map((String choice) {
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
      length: 2,
      child: Scaffold(
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
          elevation: 0.5, // 2
          leading: IconButton(icon:Icon(Icons.arrow_back),
            onPressed:() => Navigator.pop(context, false),
          ),
          iconTheme: IconThemeData(
            color: Colors.blue,
          ),
          backgroundColor: Colors.white,
          bottom: TabBar(
            indicatorColor: Colors.blue,
            labelColor: Colors.blue,
            tabs: [
              Tab(child: Text("Current Courses", style: TextStyle(fontSize: 22.0, color: Colors.blue))),
              Tab(child: Text("Finished Courses", style: TextStyle(fontSize: 22.0, color: Colors.blue))),
            ],
          ),
          //title: Text('Notes'),
        ),
        body: TabBarView(
          children: [
            new CoursesList(),
            new FinishedCoursesList(),
          ],
        ),
      ),
    );
  }

}