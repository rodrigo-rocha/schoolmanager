import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/functions/functions.dart';

import "dart:math";

class StudentList extends StatefulWidget {
  @override
  StudentListState createState() => StudentListState();
}

class StudentListState extends State<StudentList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: Functions.appBar("Teachers", Icons.add, context),
      drawer: Functions.sideBar(context),
      //bottomNavigationBar: Functions.navBar(context),
      //floatingActionButton: FloatingActionButton(
      //  tooltip: 'Add new note',
      //  child: Icon(Icons.add, color: Colors.white),
      //  onPressed: () {
      //    // New Note Pressed
      //    Navigator.of(context).pushNamed('/add_teacher');
      //  },
      // ),
      body: new Container(
        child: new Center(
          child: new RefreshIndicator(
            child: ListView(
                children: <Widget> [
                  _teacher("Joaquim Batista", "jb@sm.com", 'https://greatergood.berkeley.edu/images/application_uploads/Hopeful_student_1.jpg'),
                  _teacher("Paula Fernandes", "paula@sm.com", 'https://www.caprent.com/img/student.jpg'),
                  _teacher("Ana Maria", "ana@sm.com", 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnHDvkOYQGL6khvCU2UotPqgFh_XMjS1Dov97TuMnmHBXHvl4fTA'),
                ] //_teacherShow(),
            ),
            //new FutureBuilder(
            //  future: _usersShow(),
            //  builder: (context, snapshot) {
            //    return snapshot.requireData;
            //  },
            //),
            onRefresh: () {
              print("Refreshed");
            },
          ),
        ),
      ),
    );
  }

  Future<void> _refreshPage() async {
    Navigator.of(context).pushNamed('/teachers');
  }

  List<Widget> _teacherShow() {
    int nTeachers = 10;
    var disciplines = [
      'IHC',
      'BD',
      'PEI',
      'AR',
      'FR',
      'AMS',
      'ARA',
      'P1',
      'P2',
      'P3',
      'C1',
      'C2',
      'AlgC',
      'ISD',
      'LSD',
      '',
    ];

    List<Widget> list = new List<Widget>();

    for (int i = 1; i <= nTeachers; i++) {
      list.add(_teacher('i', disciplines[Random().nextInt(disciplines.length)], ''));
    }

    return list;
  }

  Widget _teacher(String i, String sub, String url) {
    return Card(
      color: Colors.transparent,
      shape: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 0.5,
            color: Colors.grey,
          )),
      child: ListTile(
          title: Text(i.toString()),
          //leading: Icon(Icons.account_circle, size: 50,), ///Change for pic
          subtitle: Text(sub),
          trailing: Icon(Icons.info_outline),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(url),
          ),
          onTap: () => {Navigator.of(context).pushNamed('/info_teacher')},
    ),
    elevation: 0.0,
    );
  }
}