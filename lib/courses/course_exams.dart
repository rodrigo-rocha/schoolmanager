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
          return Card(
            color: Colors.transparent,
            shape: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 0.5,
                  color: Colors.grey,
                )),
            child: ListTile(
                title: Text(courseList[t_idx].exams[index].name, style: TextStyle(fontSize: 20)),
                subtitle: Text(courseList[t_idx].exams[index].value),
                trailing: Icon(Icons.attach_file, color: Colors.blue),
                //leading: Icon(Icons.category, color: Colors.blue),
                onTap: () {
                  //t_idx = index;
                  //Navigator.push(context, new MaterialPageRoute(
                  //    builder: (context) => new CourseInfo())
                  //);
                }
            ),
            elevation: 0.0,
          );
        },
      ),
    );
  }

}