import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/classes/Course.dart';
import 'package:flutter_app_ihc/classes/Exam.dart';
import 'package:flutter_app_ihc/courses/current/course_info.dart';

List<Course> courseList = [
  new Course("Human-Computer Interaction", "12345", "DETI", "Gonçalo Faria","",[new Exam('Mini-test 1', '20', '4.1.20', DateTime.parse("2019-02-19")),new Exam('Mini-test 2', '20', '4.1.15', DateTime.parse("2020-04-15"))]),
  new Course("Network Architecture", "12346", "DETI", "Mario Gomes","",[new Exam('Mini-test 1', '20', '4.1.20', DateTime.parse("2019-06-12"))]),
  new Course("Project in Informatic Engineering", "12346", "DETI", "Luis Fernandes","",[new Exam('Mini-test 1', '20', '4.1.20', DateTime.parse("2019-06-12")),new Exam('Mini-test 1', '20', '4.1.20', DateTime.parse("2019-06-12")),new Exam('Mini-test 1', '20', '4.1.20', DateTime.parse("2019-06-12"))]),
  new Course("Databases", "12346", "DETI", "Pedro Costa","",[new Exam('Mini-test 1', '20', '4.1.20', DateTime.parse("2019-06-12")),new Exam('Mini-test 1', '20', '4.1.20', DateTime.parse("2019-06-12"))]),
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
            physics: ScrollPhysics(parent: BouncingScrollPhysics()),
            itemCount: courseList.length,
            itemBuilder: (context, index) {
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
                        builder: (context) => new CourseInfo()
                      )
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