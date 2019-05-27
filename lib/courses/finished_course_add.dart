import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/functions/functions.dart';
import 'package:flutter_app_ihc/courses/finished/finished_courses.dart';
import 'package:flutter_app_ihc/courses/courses_tab_controller.dart';
import 'package:flutter_app_ihc/classes/Course.dart';
import 'package:flutter_app_ihc/classes/Teacher.dart';
import 'package:flutter_app_ihc/users/teachers/teacher_list.dart';

TextEditingController nameController = new TextEditingController();
TextEditingController codeController = new TextEditingController();
TextEditingController departmentController = new TextEditingController();
TextEditingController coordinatorController = new TextEditingController();
TextEditingController gradeController = new TextEditingController();

FocusNode nameFocus = new FocusNode();
FocusNode codeFocus = new FocusNode();
FocusNode deptFocus = new FocusNode();
FocusNode coordinatorFocus = new FocusNode();
FocusNode gradeFocus = new FocusNode();

final _validationKey = GlobalKey<FormState>();

var coursesItems = ['Interação Humano-Computador', 'Arquitetura de Redes', 'Projeto em Engenharia Informatica', 'Bases de Dados'];
var deptItems = ['DETI', 'Biology', 'Physics', 'ISCAA', 'Mathematics'];

class FinishedCourseAdd extends StatefulWidget {

  @override
  FinishedCourseAddState createState() => FinishedCourseAddState();
}

class FinishedCourseAddState extends State<FinishedCourseAdd> {

  void addCourseAction() {
    if(_validationKey.currentState.validate()) {
      finishedCoursesList.add(new Course(
          nameController.text, codeController.text, departmentController.text,
          coordinatorController.text, gradeController.text, []));

      nameController.text = "";
      codeController.text = "";
      departmentController.text = "";
      coordinatorController.text = "";
      gradeController.text = "";

      Navigator.push(
          context,
          new MaterialPageRoute(builder: (context) => CoursesTabController()
          ));
    }
  }

  void checkEmpty() {
    if(nameController.text != ""  || codeController.text != "" || departmentController.text != ""
        || coordinatorController.text != "" || gradeController.text != "") {
      _showDialog();
    } else {
      Navigator.of(context).pushReplacementNamed('/courses_tab_controller');
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: Functions.createBar("Create Course", () => addCourseAction(), () => checkEmpty()),

      body:
      ListView(
        children: <Widget>[
          Form(
            key: _validationKey,
            child: textFieldMandatory('Name *', nameController, "Name can\'t be empty", nameFocus, codeFocus),
          ),
          textField('Code', codeController, codeFocus, deptFocus),
          textField('Department', departmentController, deptFocus, coordinatorFocus),
          //textField('Coordinator', coordinatorController),
          dropdownField("Coordinator", teachersList, coordinatorFocus, coordinatorFocus),
          SizedBox(height: 10),
          reqFieldInfo()
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

  Widget textField(String hint, TextEditingController cont, FocusNode focus, FocusNode next) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0, left: 18.0, right: 18.0),
      child: TextFormField(
        focusNode: focus,
        onFieldSubmitted: (term) {
          if(focus == next) {
            focus.unfocus();
          } else {
            focus.unfocus();
            FocusScope.of(context).requestFocus(next);
          }
        },
        controller: cont,
        decoration: InputDecoration(
          hintText: hint,
        ),
      ),
    );
  }

  Widget textFieldMandatory(String hint, TextEditingController cont, String msg, FocusNode focus, FocusNode next) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0, left: 18.0, right: 18.0),
      child: TextFormField(
        focusNode: focus,
        onFieldSubmitted: (term) {
          if(focus == next) {
            focus.unfocus();
          } else {
            focus.unfocus();
            FocusScope.of(context).requestFocus(next);
          }
        },
        validator: (val) => val.isEmpty? msg : null,
        controller: cont,
        decoration: InputDecoration(
          hintText: hint,
        ),
      ),
    );
  }

  Widget dropdownStringField(String hint, TextEditingController cont, var items) {
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

  Widget dropdownField(String hint, var items, FocusNode focus, FocusNode next) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0, left: 18.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new TextFormField(
              focusNode: focus,
              onFieldSubmitted: (term) {
                if(focus == next) {
                  focus.unfocus();
                } else {
                  focus.unfocus();
                  FocusScope.of(context).requestFocus(next);
                }
              },
              controller: coordinatorController,
              decoration: InputDecoration(hintText: hint),
            ),
          ),
          new PopupMenuButton<Teacher>(
            elevation: 5,

            icon: const Icon(Icons.arrow_drop_down),

            onSelected: (Teacher value) {
              coordinatorController.text = value.name;
            },
            itemBuilder: (BuildContext context) {
              return items.map<PopupMenuItem<Teacher>>((Teacher value) {
                return new PopupMenuItem(
                  child: new Text(value.name),
                  value: value,
                );
              }).toList();
            },
          ),
        ],
      ),
    );
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Discard Information?"),
          content: new Text("Changes made will not be saved."),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Discard Changes", style: TextStyle(color: Colors.red, fontSize: 17)),
              onPressed: () {
                nameController.text = "";
                codeController.text = "";
                departmentController.text = "";
                coordinatorController.text = "";
                gradeController.text = "";
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed('/courses_tab_controller');
              },
            ),
            new FlatButton(
              child: new Text("Continue Edit", style: TextStyle(fontSize: 17)),
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