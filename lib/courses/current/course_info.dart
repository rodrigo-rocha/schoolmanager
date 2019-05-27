import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/functions/functions.dart';
import 'package:flutter_app_ihc/courses/current/current_courses.dart';
import 'package:flutter_app_ihc/classes/Course.dart';
import 'package:flutter_app_ihc/courses/finished/finished_courses.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

TextEditingController gradeController = new TextEditingController();

class CourseInfo extends StatefulWidget {

  @override
  CourseInfoState createState() => CourseInfoState();
}

File galleryFile;

class CourseInfoState extends State<CourseInfo> {

  void choiceActions(String choice) {
    if(choice == 'Edit') {
      Navigator.of(context).pushNamed('/course_edit');
    } else if(choice == 'Delete') {
      _showDialogDelete();
    } else if(choice == 'Add evaluation moment') {
      Navigator.of(context).pushNamed('/add_exam');
    } else {
      gradeController.text = "";
      _showDialog();
    }
  }

  Widget popUpButton(){
    return PopupMenuButton<String> (
      onSelected: choiceActions,
      itemBuilder: (BuildContext context) {
        return ['Edit','Delete','Add evaluation moment','Send to finished courses'].map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
    );
  }

  imageSelectorGallery() async {
    galleryFile = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Functions.appBar("Information", Icons.add, popUpButton()),

      body: ListView(
        children: <Widget>[
          _infoT(courseList[t_idx].name, 'Name', null),
          _infoExams('Exams information', traillingAction(Icons.keyboard_arrow_right, "Exams information", () { Navigator.of(context).pushNamed('/course_exams'); } )),
          _infoExams('Comunity Documents', traillingAction(Icons.keyboard_arrow_right, "Comunity Documents", () { Navigator.of(context).pushNamed('/comunity_docs'); } )),
          _infoExams('Submit Document', traillingAction(Icons.keyboard_arrow_right, "Submit", () { imageSelectorGallery(); } )),
          Container(height: 10, color: Colors.grey[200]),
          _infoT(courseList[t_idx].coordinator, 'Coordinator', traillingAction(Icons.account_circle, "Information", () {Navigator.of(context).pushNamed('/generic_teacher_info');} )),
          _infoT(courseList[t_idx].department, 'Department', traillingAction(Icons.place, "Locate", () {Functions.showLocation(context,'assets/images/dept_location.png');})),
          _infoT(courseList[t_idx].code, 'Code', null),
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
        width: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Icon(icon, color: Colors.blue,),
              SizedBox(height: 2,),
              Text(text, style: TextStyle(color: Colors.blue),),
            ]
        ),
      ),
      onTap: () {
        actions();
      },
    );
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Please idicate the final grade"),
          content: dropdownField("Final Grade", gradeController, grade),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Go Back", style: TextStyle(fontSize: 17)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Submit", style: TextStyle(color: Colors.green, fontSize: 17)),
              onPressed: () {
                if(_formKey.currentState.validate()) {
                  finishedCoursesList.add(new Course(courseList[t_idx].name, courseList[t_idx].code, courseList[t_idx].department, courseList[t_idx].coordinator,  gradeController.text, []));
                  courseList.removeAt(t_idx);
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacementNamed('/courses_tab_controller');
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _showDialogDelete() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Remove ${courseList[t_idx].name}"),
          content: new Text("Are you sure you want to remove ${courseList[t_idx].name}?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Delete", style: TextStyle(color: Colors.red, fontSize: 17)),
              onPressed: () {
                courseList.removeAt(t_idx);
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

  List<String> grade = ['10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20'];

  Widget gradeActions(){
    return PopupMenuButton<String> (
      icon: Icon(Icons.add_circle),
      onSelected: choiceActions,
      itemBuilder: (BuildContext context) {
        return grade.map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
    );
  }

  final _formKey = GlobalKey<FormState>();

  Widget dropdownField(String hint, TextEditingController cont, var items) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0, left: 18.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: Form(
              key: _formKey,
              child: new TextFormField(
                validator: (value) => value.isEmpty? 'Please fill in the grade' : null,
                controller: cont,
                enabled: false,
                decoration: InputDecoration(hintText: hint),
              ),
            ),
          ),
          new PopupMenuButton<String>(
            elevation: 5,

            icon: const Icon(Icons.arrow_drop_down),

            onSelected: (String value) {
              cont.text = value;
            },
            itemBuilder: (BuildContext context) {
              return items.map<PopupMenuItem<String>>((String value) {
                return new PopupMenuItem(
                  child: new Text(value),
                  value: value,
                );
              }).toList();
            },
          ),
        ],
      ),
    );
  }
}