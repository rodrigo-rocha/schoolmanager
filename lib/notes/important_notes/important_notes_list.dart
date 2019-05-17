import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/functions/functions.dart';
import 'package:flutter_app_ihc/classes/Notes.dart';

List<Note> importantNoteList = [
  new Note("Check this stuff A", "Amazing A stuff to be checked"),
  new Note("Check this stuff B", "Amazing B stuff to be checked"),
  new Note("Check this stuff C", "Amazing C stuff to be checked"),
  new Note("Repository Github A", "Check repository schoolmanager2.0 A"),
];

class ImportantNoteList extends StatefulWidget {

  @override
  ImportantNoteListState createState() => ImportantNoteListState();
}

class ImportantNoteListState extends State<ImportantNoteList> {

  void choiceActions(String choice) {
    if(choice == 'Add course') {
      Navigator.of(context).pushNamed('/course_add');
    }
  }

  Widget popUpButton(){
    return PopupMenuButton<String> (
      onSelected: choiceActions,
      itemBuilder: (BuildContext context) {
        return ['Add course', 'Delete course'].map((String choice) {
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
    return Scaffold(
      //appBar: Functions.appBar("Notes", Icons.speaker_notes, popUpButton()),
      body: ListView.builder(
        itemCount: importantNoteList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.transparent,
            shape: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 0.5,
                  color: Colors.grey,
                )),
            child: ListTile(
                title: Text(importantNoteList[index].title, style: TextStyle(fontSize: 20)),
                subtitle: Text(importantNoteList[index].body),
                leading: Icon(Icons.warning, color: Colors.blue,),
                //leading: Icon(Icons.category, color: Colors.blue),
                onTap: () {
                  //t_idx = index;
                  //Navigator.push(context, new MaterialPageRoute(
                  //    builder: (context) => new CourseInfo())
                  //);
                }
            ),
            elevation: 0.0,
          );
        },
      ),
    );
  }
}