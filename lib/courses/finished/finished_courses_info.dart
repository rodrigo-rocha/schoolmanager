import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/functions/functions.dart';
import 'package:flutter_app_ihc/courses/finished/finished_courses.dart';
import 'package:flutter_app_ihc/courses/current/current_courses.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'dart:io';
import 'package:document_chooser/document_chooser.dart';
import 'package:image_picker/image_picker.dart';

class FinishedCoursesInfo extends StatefulWidget {
  @override
  FinishedCoursesInfoState createState() => FinishedCoursesInfoState();
}

File galleryFile;

class FinishedCoursesInfoState extends State<FinishedCoursesInfo> {

  List<String> _documents = [];

  imageSelectorGallery() async {
    galleryFile = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
  }


  void choiceActions(String choice) {
    if(choice == 'Edit') {
      Navigator.of(context).pushNamed('/finished_course_edit');
    } else if(choice == 'Delete') {
      _showDialogDelete();
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

          _infoC(finishedCoursesList[finished_index].name, 'Name', null),
          _infoC(finishedCoursesList[finished_index].grade, 'Final Grade', null),
          _infoC(finishedCoursesList[finished_index].department, 'Department', traillingAction(Icons.place, "Locate", () {Functions.showLocation(context,'assets/images/dept_location.png');})),
          _infoC(finishedCoursesList[finished_index].code, 'Code', null),
          _infoExams('Submit Document', traillingAction(Icons.keyboard_arrow_right, "Submit", () { imageSelectorGallery(); } )),
          //_infoC(finishedCoursesList[finished_index].coordinator, 'Coordinator', traillingAction(Icons.place, "Locate", () {print("this");} )),
        ],
      ),

    );
  }

  Widget _infoExams(String name, Widget traillingAction) {
    return Card(
      color: Colors.transparent,
      child: ListTile(
        title: Text(name),
        trailing: traillingAction,
      ),
      elevation: 0.0,
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

  void _showDialogDelete() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Remove ${finishedCoursesList[finished_index].name}"),
          content: new Text("Are you sure you want to remove ${finishedCoursesList[finished_index].name}?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Delete", style: TextStyle(color: Colors.red, fontSize: 17)),
              onPressed: () {
                finishedCoursesList.removeAt(finished_index);
                Navigator.of(context).pop();
                Navigator.pushReplacementNamed(context, '/courses_tab_controller');
              },
            ),
            new FlatButton(
              child: new Text("Close", style: TextStyle(fontSize: 17)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}