import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/functions/functions.dart';
import 'package:flutter_app_ihc/courses/current/current_courses.dart';
import 'package:flutter_app_ihc/classes/Course.dart';
import 'package:flutter_app_ihc/courses/finished/finished_courses.dart';

class CourseExams extends StatefulWidget {

  @override
  CourseExamsState createState() => CourseExamsState();
}

class CourseExamsState extends State<CourseExams> {

  void choiceActions(String choice) {
    if(choice == 'Edit') {
      Navigator.of(context).pushNamed('/course_edit');
    } else if(choice == 'Delete') {
      courseList.removeAt(t_idx);
      Navigator.of(context).pushNamed('/courses_tab_controller');
    } else {
      //print(t_idx);
      finishedCoursesList.add(new Course(courseList[t_idx].name, courseList[t_idx].code, courseList[t_idx].department, courseList[t_idx].coordinator,  '16',[]));
      courseList.removeAt(t_idx);
      Navigator.of(context).pushNamed('/courses_tab_controller');
    }
  }

  Widget popUpButton(){
    return PopupMenuButton<String> (
      onSelected: choiceActions,
      itemBuilder: (BuildContext context) {
        return ['Add exam','Delete','Send to finished courses'].map((String choice) {
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
    //print(t_idx);
    //print('~~~~~~ ${courseList[t_idx].exams.length}');
    // TODO: implement Notes build
    return Scaffold(
      appBar: Functions.appBar("Exams", Icons.add, popUpButton()),
      body: ListView.builder(
        //itemCount: courseList[t_idx].exams.length,
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          //print('----${courseList[t_idx].exams.length}');
          /*if(courseList[t_idx].exams.length == 0) {
            print("NO EXAMS");
          } else {
            print(courseList[t_idx].exams[index].name.toString());
            print(courseList[t_idx].exams[index].value);
            print(courseList[t_idx].exams[index].room);
            print(courseList[t_idx].exams[index].day);
            //_infoE(courseList[t_idx].exams[index].name, courseList[t_idx].exams[index].day.toString(), Icons.map);
          */
          ListTile(
          title: Text("ABCD"),
          subtitle: Text("aa"),
          //trailing: Icon("ASA")
          );
          //ListTile(
           //   title: Text(courseList[t_idx].exams[index].name),
             // subtitle: Text(courseList[t_idx].exams[index].day.toString()),
              //trailing: Icon(Icons.settings),
            //);

        },
      ),
    );
  }

  Widget _infoE(String title, String sub, IconData icon) {
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
        //trailing: traillingAction,
        trailing: Icon(icon),
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

}