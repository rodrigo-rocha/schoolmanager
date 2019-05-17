import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/users/teachers/teacher_list.dart';
import 'package:flutter_app_ihc/users/students/student_list.dart';
import 'package:flutter_app_ihc/functions/functions.dart';


import 'package:flutter_app_ihc/users/teachers/teacher_info.dart';
import 'package:flutter_app_ihc/users/teachers/teacher_add.dart';

import 'package:flutter_app_ihc/classes/Teacher.dart';

class UserTabController extends StatefulWidget {
  @override
  UserTabControllerState createState() => new UserTabControllerState();
}

class UserTabControllerState extends State<UserTabController> {

  static TextStyle textStyle() {
    return TextStyle(
      fontSize: 30.0,
      color: Colors.blue,
    );
  }
  /* Serach Bar Options */
  final TextEditingController _filter = new TextEditingController();

  String _searchText = "";

  List names = ['A', 'B', 'C', 'D', 'A', 'B', 'C', 'D']; // names we get from API

  List filteredNames = new List(); // names filtered by search text

  Icon _searchIcon = new Icon(Icons.search);

  Widget _appBarTitle = new Text('Users', style: textStyle());
  /* Serach Bar Options */

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Functions.sideBar(context),
        appBar: AppBar(
          title: _appBarTitle,
          actions: <Widget>[
            new IconButton(
              icon: _searchIcon,
              onPressed: () {
                _searchPressed();
              },
            ),
          ],

          centerTitle: true,
          //title: Text('Users', textAlign: TextAlign.left ,
          //  style: TextStyle(
          //      fontSize: 30.0,
          //      color: Colors.blue,
          //  ),
          //),
          elevation: 0.5, // 2
          leading: IconButton(icon:Icon(Icons.dehaze),
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

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          style: TextStyle(
            color: Colors.grey,
            fontSize: 25
          ),
          controller: _filter,
          decoration: new InputDecoration(
            prefixIcon: new Icon(Icons.search),
            hintText: 'Search...'
          ),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text('Users', style: textStyle(),
      );
        filteredNames = names;
        _filter.clear();
      }
    });
  }
}