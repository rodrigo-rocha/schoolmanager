import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/classes/Course.dart';
import 'package:flutter_app_ihc/classes/Exam.dart';
import 'package:flutter_app_ihc/courses/current/course_info.dart';

List<Course> courseList = [
  new Course("Human-Computer Interaction", "12345", "DETI", "Gonçalo Faria","",[new Exam('Mini-test 1', '20', '4.1.20', DateTime.now()),new Exam('Mini-test 2', '20', '4.1.15', DateTime.now())]),
  new Course("Network Architecture", "12346", "DETI", "Mario Gomes","",[]),
  new Course("Project in Informatic Engineering", "12346", "DETI", "Luis Fernandes","",[]),
  new Course("Databases", "12346", "DETI", "Pedro Costa","",[]),
];

int t_idx;

class CoursesList extends StatefulWidget {
  @override
  CoursesListState createState() => CoursesListState();
}

class CoursesListState extends State<CoursesList> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: new Container(
        child: new Center(
          child: ListView.builder(
              itemCount: courseList.length,
              itemBuilder: (context, index) {
                //return _teacher(teachersList[index].name, teachersList[index].email, teachersList[index].photo);
                return Card(
                  color: Colors.transparent,
                  shape: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.5,
                        color: Colors.grey,
                      )),
                  child: ListTile(
                    title: Text(courseList[index].name, style: TextStyle(fontSize: 20)),
                    subtitle: Text(courseList[index].department),
                    trailing: Icon(Icons.info_outline, color: Colors.blue,),
                    leading: Icon(Icons.category, color: Colors.blue),
                    onTap: () {
                      t_idx = index;
                      Navigator.push(context, new MaterialPageRoute(
                          builder: (context) => new CourseInfo())
                      );
                    }
                  ),
                  elevation: 0.0,
                );
              }
          ),
        ),
      ),
    );
  }
}