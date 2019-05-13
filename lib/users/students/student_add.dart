import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/functions/functions.dart';

TextEditingController nameController = new TextEditingController();
TextEditingController ageController = new TextEditingController();
TextEditingController profController = new TextEditingController();

class StudentAdd extends StatefulWidget {

  @override
  StudentAddState createState() => StudentAddState();
}

class StudentAddState extends State<StudentAdd> {

  void addTeacherAction(String routeName) {

    Navigator.of(context).pushNamed(routeName);
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: Functions.createBar("Create Teacher", () => Navigator.pop(context), () => Navigator.pop(context)),
      drawer: Functions.sideBar(context),
      //bottomNavigationBar: Functions.navBar(context),

      body:
      ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Name",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: ageController,
              decoration: InputDecoration(
                hintText: "Age",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: profController,
              decoration: InputDecoration(
                hintText: "Profession",
              ),
            ),
          ),
        ],
      ),
    );
  }
}