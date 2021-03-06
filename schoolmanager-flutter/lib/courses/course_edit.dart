import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/functions/functions.dart';
import 'package:flutter_app_ihc/courses/current/current_courses.dart';
import 'package:flutter_app_ihc/courses/courses_tab_controller.dart';
import 'package:flutter_app_ihc/classes/Course.dart';

TextEditingController nameController = new TextEditingController();
TextEditingController codeController = new TextEditingController();
TextEditingController departmentController = new TextEditingController();
TextEditingController coordinatorController = new TextEditingController();

var coursesItems = ['Interação Humano-Computador', 'Arquitetura de Redes', 'Projeto em Engenharia Informatica', 'Bases de Dados'];
var deptItems = ['DETI', 'Biology', 'Physics', 'ISCAA', 'Mathematics'];

class CourseEdit extends StatefulWidget {

  @override
  CourseEditState createState() => CourseEditState();
}

class CourseEditState extends State<CourseEdit> {

  void addCourseAction() {
    courseList.removeAt(t_idx);
    courseList.add(new Course(nameController.text, codeController.text, departmentController.text, coordinatorController.text,"",[]));

    nameController.text = "";
    codeController.text = "";
    departmentController.text = "";
    coordinatorController.text = "";

    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => CoursesTabController()
    ));
  }


  @override
  Widget build(BuildContext context) {

    nameController.text = courseList[t_idx].name;
    codeController.text = courseList[t_idx].code;
    departmentController.text = courseList[t_idx].department;
    coordinatorController.text = courseList[t_idx].coordinator;

    return Scaffold(
      appBar: Functions.createBar("Edit Course", () => addCourseAction(), () => Navigator.pop(context)),

      body:
      ListView(
        children: <Widget>[
          textField('Name *', nameController),
          textField('Code', codeController),
          textField('Department', departmentController),
          textField('Coordinator', coordinatorController),
          SizedBox(height: 10),
          reqFieldInfo()
        ],
      ),
    );
  }

  Widget clearFieldText() {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          IconButton(icon: Icon(Icons.clear), onPressed: () => print("pressed"),),
          Text("Clear field", style: TextStyle(fontSize: 15.0)),
        ],
      ),
    );
  }

  Widget reqFieldInfo() {
    return Padding(
      padding: const EdgeInsets.only(right: 18.0),
      child: Text("Fields with * are required",
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red[400]), textAlign: TextAlign.right,
      ),
    );
  }

  Widget imageField() {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, left: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            child: Row(
              children: <Widget>[
                IconButton(icon: Icon(Icons.image), onPressed: () => print("pressed"),),
                Text("Add Picture", style: TextStyle(fontSize: 16.0)),
              ],
            ),
            onTap: () => print("Add pic"),
          ),
          reqFieldInfo(),
        ],
      ),
    );
  }

  Widget textField(String hint, TextEditingController cont) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0, left: 18.0, right: 18.0),
      child: TextFormField(
        controller: cont,
        decoration: InputDecoration(
          //border: UnderlineInputBorder(
            //borderSide: BorderSide(color: Colors.red, width: 110.1)
            //borderSide: BorderSide(width: 0.5, color: Colors.blue)
          //),
          hintText: hint,
        ),
      ),
    );
  }

  Widget dropdownField(String hint, TextEditingController cont, var items) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0, left: 18.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: new TextField(
                controller: cont,
                decoration: InputDecoration(hintText: hint),
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