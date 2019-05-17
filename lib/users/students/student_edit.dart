import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/functions/functions.dart';
import 'package:flutter_app_ihc/users/students/student_list.dart';
import 'package:flutter_app_ihc/classes/Student.dart';
import 'package:flutter_app_ihc/users/tab_controller.dart';

TextEditingController nameController = new TextEditingController(text: studentList[t_idx].name);
TextEditingController emailController = new TextEditingController(text: studentList[t_idx].email);
TextEditingController degreeController = new TextEditingController(text: studentList[t_idx].degree);
TextEditingController phoneController = new TextEditingController(text: studentList[t_idx].phone);
TextEditingController deptController = new TextEditingController(text: studentList[t_idx].department);

var coursesItems = ['Interação Humano-Computador', 'Arquitetura de Redes', 'Projeto em Engenharia Informatica', 'Bases de Dados'];
var deptItems = ['DETI', 'Biology', 'Physics', 'ISCAA', 'Mathematics'];

class StudentEdit extends StatefulWidget {
  @override
  StudentEditState createState() => StudentEditState();
}

class StudentEditState extends State<StudentEdit> {


  void addTeacherAction() {
    String photo = studentList[t_idx].photo;
    studentList.removeAt(t_idx);
    studentList.add(new Student(nameController.text, emailController.text, degreeController.text, phoneController.text, deptController.text, photo));

    /*
    nameController.text = "";
    emailController.text = "";
    officeController.text = "";
    phoneController.text = "";
    deptController.text = "";
    coursesController.text = "";
    */

    Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => UserTabController()
        ));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Functions.createBar(
          "Edit Teacher", () => addTeacherAction(), () =>
          Navigator.pop(context)),
      body:
      ListView(
        children: <Widget>[
          textField('Name *', nameController),
          textField('E-Mail *', emailController),
          textField('Degree', degreeController),
          textField('Phone', phoneController),
          dropdownField('Department', deptController, deptItems),
          imageField(),
          //reqFieldInfo(),
          // clearFieldText(), // Necessary??
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
          IconButton(
            icon: Icon(Icons.clear), onPressed: () => print("pressed"),),
          Text("Clear field", style: TextStyle(fontSize: 15.0)),
        ],
      ),
    );
  }

  Widget reqFieldInfo() {
    return Padding(
      padding: const EdgeInsets.only(right: 18.0),
      child: Text("Fields with * are required",
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red[400]),
        textAlign: TextAlign.right,
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
                IconButton(
                  icon: Icon(Icons.image), onPressed: () => print("pressed"),),
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