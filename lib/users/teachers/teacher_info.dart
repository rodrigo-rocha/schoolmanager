import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/functions/functions.dart';
import 'package:flutter_app_ihc/users/teachers/teacher_list.dart';

class TeacherInfo extends StatefulWidget {

  @override
  TeacherInfoState createState() => TeacherInfoState();
}

class TeacherInfoState extends State<TeacherInfo> {

  void choiceActions(String choice) {
    if(choice == 'Edit') {
      print("W8");
    } else if(choice == 'Delete') {
      print("This");
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

    // TODO: implement Notes build
    return Scaffold(
      appBar: Functions.appBar("Information", Icons.add, popUpButton()),
      //drawer: Functions.sideBar(context),
      //bottomNavigationBar: Functions.navBar(context),

      body: ListView(
        children: <Widget>[
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(teachersList[t_idx].photo),
                radius: 70.0,
              ),
              SizedBox(width: 30),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(teachersList[t_idx].name, textAlign: TextAlign.left,style: TextStyle(fontSize: 25)),
                  Text(teachersList[t_idx].email),
                ],
              )

            ],
          ),
          _infoT(teachersList[t_idx].email, 'E-Mail', traillingAction(Icons.mail_outline, "Send Email", () {print("this");} )),
          _infoT(teachersList[t_idx].phone, 'Phone', traillingAction(Icons.phone, "Call", () {print("this");})),
          _infoT(teachersList[t_idx].courses, 'Courses', traillingAction(Icons.description, "Information", () {print("this");})),
          _infoT(teachersList[t_idx].department, 'Department', traillingAction(Icons.place, "Locate", () {print("this");})),
          _infoT(teachersList[t_idx].office, 'Office', traillingAction(Icons.place, "Locate", () {print("this");} )),
        ],
      ),

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
        width: 70,
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

}