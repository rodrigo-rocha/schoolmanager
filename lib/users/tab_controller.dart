import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/users/teachers/teacher_list.dart';
import 'package:flutter_app_ihc/users/students/student_list.dart';
import 'package:flutter_app_ihc/main.dart';

class UserTabController extends StatefulWidget {
  @override
  UserTabControllerState createState() => new UserTabControllerState();
}

class UserTabControllerState extends State<UserTabController> {

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Users', textAlign: TextAlign.left ,
            style: TextStyle(
                fontSize: 30.0,
                color: Colors.blue,
            ),
          ),
          elevation: 0.5, // 2
          leading: IconButton(icon:Icon(Icons.arrow_back),
            onPressed:() => Navigator.pop(context, false),
          ),
          iconTheme: IconThemeData(
            color: Colors.blue,
          ),
          backgroundColor: Colors.white,
          bottom: TabBar(
            indicatorColor: Colors.blue,
            labelColor: Colors.blue,
            tabs: [
              Tab(child: Text("Teachers", style: TextStyle(fontSize: 22.0, color: Colors.blue))),
              Tab(child: Text("Students", style: TextStyle(fontSize: 22.0, color: Colors.blue))),
            ],
          ),
          //title: Text('Notes'),
        ),
          body: TabBarView(
            children: [
              new TeacherList(),
              new StudentList(),
            ],
          ),
        ),
    );
  }

}