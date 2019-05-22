import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/functions/functions.dart';
import 'package:flutter_app_ihc/courses/finished/finished_courses.dart';
import 'package:flutter_app_ihc/courses/current/current_courses.dart';


class CourseDetails extends StatefulWidget {

  @override
  CourseDetailsState createState() => CourseDetailsState();
}

double mean;
String meanString = "";

class CourseDetailsState extends State<CourseDetails> {

  @override
  Widget build(BuildContext context) {

    int sum = 0;

    try {
      for(int i = 0; i < finishedCoursesList.length; i++) {
        sum += int.parse(finishedCoursesList[i].grade);
      }

      mean = sum/finishedCoursesList.length;
      meanString = mean.toStringAsFixed(2);
    } catch (e) {
      meanString = "Cannot calculate mean.";
    }

    // TODO: implement build
    return Scaffold(
      body: ListView(
        children: <Widget>[
          infoTile(meanString, 'Mean of finished courses'),
          infoTile(courseList.length.toString(), 'Number of current courses'),
          infoTile(finishedCoursesList.length.toString(), 'Number of finished courses'),
        ],
      ),
    );
  }

  Widget infoTile(String title, String subtitle) {
    return Card(
      color: Colors.transparent,
      shape: UnderlineInputBorder(
        borderSide: BorderSide(
          width: 0.5,
          color: Colors.grey,
        )
      ),
      child: ListTile(
        title: Text(title, style: TextStyle(fontSize: 20)),
        subtitle: Text(subtitle),
      ),
      elevation: 0.0,
    );
  }
}