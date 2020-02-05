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

FocusNode nameFocus = new FocusNode();
FocusNode emailFocus = new FocusNode();
FocusNode officeFocus = new FocusNode();
FocusNode phoneFocus = new FocusNode();
FocusNode dptFocus = new FocusNode();
FocusNode coursesFocus = new FocusNode();

File galleryFile;

var coursesItems = ['Interação Humano-Computador', 'Arquitetura de Redes', 'Projeto em Engenharia Informatica', 'Bases de Dados'];
var deptItems = ['DETI', 'Biology', 'Physics', 'ISCAA', 'Mathematics'];

class TeachersAdd extends StatefulWidget {

  @override
  TeachersAddState createState() => TeachersAddState();
}

final _validationKey = GlobalKey<FormState>();

class TeachersAddState extends State<TeachersAdd> {

  void checkEmpty() {
    if(nameController.text != ""  || emailController.text != "" || officeController.text != ""
        || phoneController.text != "" || deptController.text != "" || coursesController.text != "") {
      _showDialog();
    } else {
      Navigator.of(context).pushReplacementNamed('/user_tab_controller');
    }
  }

  void addTeacherAction() {
    if(_validationKey.currentState.validate()) {
      teachersList.add(new Teacher(nameController.text, emailController.text, officeController.text, phoneController.text, deptController.text, coursesController.text, 'https://utulsa.edu/wp-content/uploads/2018/08/generic-avatar.jpg'));

      nameController.text = "";
      emailController.text = "";
      officeController.text = "";
      phoneController.text = "";
      deptController.text = "";
      coursesController.text = "";

      Navigator.pushReplacement(
          context,
          new MaterialPageRoute(builder: (context) => UserTabController()
          ));
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: Functions.createBar("Create Teacher", () => addTeacherAction(), () => checkEmpty()),
      //drawer: Functions.sideBar(context),

      body:
      ListView(
        children: <Widget>[
          Form(
            key: _validationKey,
            child: Column(
              children: <Widget>[
                textFieldMandatory('Name *', nameController, "Name can\'t be empty", nameFocus, emailFocus),
                textFieldMandatory('E-Mail *', emailController, "E-Mail can\'t be empty", emailFocus, officeFocus),
              ],
            ),
          ),

          textField('Office', officeController, officeFocus, phoneFocus),
          textField('Phone', phoneController, phoneFocus, phoneFocus),
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
            //onTap: imageSelectorGallery,
            onTap: _optionsDialogBox,
          ),
          reqFieldInfo(),
        ],
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

  imageSelectorCamera() async {
    galleryFile = await ImagePicker.pickImage(
      source: ImageSource.camera,
    );
  }

  Future<void> _optionsDialogBox() {
    return showDialog(context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: <Widget>[
            new FlatButton(
              child: new Text("Close", style: TextStyle(fontSize: 17)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
          title: Text("Select image source."),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Card(
                    shape: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.2
                      )
                    ),
                    elevation: 0.0,
                    child: ListTile(
                      title: new Text('Take a picture'),
                    ),
                  ),
                  onTap: imageSelectorCamera,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                GestureDetector(
                  child: Card(
                    shape: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 0.2
                        )
                    ),
                    elevation: 0.0,
                    child: ListTile(
                      title: new Text('Select from galery'),
                    ),
                  ),
                  onTap: imageSelectorGallery,
                ),
              ],
            ),
          ),
        );
      });
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
                emailController.text = "";
                officeController.text = "";
                phoneController.text = "";
                deptController.text = "";
                coursesController.text = "";
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed('/user_tab_controller');
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