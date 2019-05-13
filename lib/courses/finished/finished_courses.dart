import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/classes/Course.dart';
import 'package:flutter_app_ihc/courses/finished/finished_courses_info.dart';

List<Course> finishedCoursesList = [
  new Course("Programming I", "12345", "DETI", "José Carlos","14", []),
  new Course("Programming II", "12345", "DETI", "José Carlos","12", []),
  new Course("Programming III", "12345", "DETI", "José Carlos","13", []),
  new Course("Calculus I", "12346", "Mathematics", "Maria Costa","11", []),
  new Course("Calculus II", "12346", "Mathematics", "Maria Costa","16", []),
  new Course("Complexity and Algorithms", "12346", "DETI", "Alberto Costa","15", []),
  new Course("Compilers", "12346", "DETI", "Mario Figueira","12", []),
  new Course("Laborathory in Informatics", "12346", "DETI", "João Alves","14", []),
];

int finished_index;

class FinishedCoursesList extends StatefulWidget {
  @override
  FinishedCoursesListState createState() => FinishedCoursesListState();
}

class FinishedCoursesListState extends State<FinishedCoursesList> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: new Container(
        child: new Center(
          child: ListView.builder(
            itemCount: finishedCoursesList.length,
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
                  title: Text(finishedCoursesList[index].name, style: TextStyle(fontSize: 20)),
                  subtitle: Text(finishedCoursesList[index].department),
                  trailing: Text(finishedCoursesList[index].grade, style: TextStyle(fontSize: 25),),
                  leading: Icon(Icons.category, color: Colors.blue),
                  onTap: () {
                    finished_index = index;
                    Navigator.push(context, new MaterialPageRoute(
                        builder: (context) => new FinishedCoursesInfo())
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