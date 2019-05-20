import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/functions/functions.dart';
import 'package:flutter_app_ihc/users/teachers/teacher_list.dart';
import 'package:flutter_app_ihc/users/tab_controller.dart';
import 'package:flutter_app_ihc/classes/Teacher.dart';
import 'package:image_picker/image_picker.dart';

TextEditingController nameController = new TextEditingController();
TextEditingController emailController = new TextEditingController();
TextEditingController officeController = new TextEditingController();
TextEditingController phoneController = new TextEditingController();
TextEditingController deptController = new TextEditingController();
TextEditingController coursesController = new TextEditingController();

File galleryFile;

var coursesItems = ['Interação Humano-Computador', 'Arquitetura de Redes', 'Projeto em Engenharia Informatica', 'Bases de Dados'];
var deptItems = ['DETI', 'Biology', 'Physics', 'ISCAA', 'Mathematics'];

class TeachersEdit extends StatefulWidget {

  @override
  TeachersEditState createState() => TeachersEditState();
}

class TeachersEditState extends State<TeachersEdit> {

  @override
  void initState() {
    nameController.text = teachersList[t_idx].name;
    emailController.text = teachersList[t_idx].email;
    officeController.text = teachersList[t_idx].office;
    phoneController.text = teachersList[t_idx].phone;
    deptController.text = teachersList[t_idx].department;
    coursesController.text = teachersList[t_idx].courses;
  }

  void addTeacherAction() {
    String photo = teachersList[t_idx].photo;
    teachersList.removeAt(t_idx);
    teachersList.add(new Teacher(nameController.text, emailController.text, officeController.text, phoneController.text, deptController.text, coursesController.text, photo));


    Navigator.pushReplacement(
        context,
        new MaterialPageRoute(builder: (context) => UserTabController()
        ));
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: Functions.createBar("Edit Teacher", () => addTeacherAction(), () => Navigator.pop(context)),
      body:
      ListView(
        children: <Widget>[
          textField('Name *', nameController),
          textField('E-Mail *', emailController),
          textField('Office', officeController),
          textField('Phone', phoneController),
          dropdownField('Department', deptController, deptItems),
          dropdownField('Courses', coursesController, coursesItems),
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
                IconButton(icon: Icon(Icons.image, color: Colors.black), onPressed: null),
                Text("Add Picture", style: TextStyle(fontSize: 16.0)),
              ],
            ),
            onTap: imageSelectorGallery,
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

  imageSelectorGallery() async {
    galleryFile = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
  }
}