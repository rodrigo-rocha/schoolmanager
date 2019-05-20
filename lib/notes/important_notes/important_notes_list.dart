import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/functions/functions.dart';
import 'package:flutter_app_ihc/classes/Notes.dart';
import 'package:flutter_app_ihc/classes/DateFormat.dart';
import 'package:flutter_app_ihc/notes/important_notes/important_note_view.dart';

List<Note> importantNoteList = [
  new Note("Check this stuff A", "Amazing A stuff to be checked",DateTime.now()),
  new Note("Check this stuff B", "Amazing B stuff to be checked",DateTime.now()),
  new Note("Check this stuff C", "Amazing C stuff to be checked",DateTime.now()),
  new Note("Repository Github A", "Check repository schoolmanager2.0 A",DateTime.now()),
];

int inote_idx;

class ImportantNoteList extends StatefulWidget {

  @override
  ImportantNoteListState createState() => ImportantNoteListState();
}

class ImportantNoteListState extends State<ImportantNoteList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/important_note_add'),
        tooltip: 'Add new list',
        backgroundColor: Colors.white,
        child: Icon(Icons.add, color: Colors.blue),
      ),
      body: ListView.builder(
        physics: ScrollPhysics(parent: BouncingScrollPhysics()),
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
                subtitle: Row(
                  children: <Widget>[
                    Text("Limit: ", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(DateReformat.reformat(importantNoteList[index].alarm.toString()), style: TextStyle(color: Colors.red)),
                  ],
                ),


                leading: Icon(Icons.warning, color: Colors.blue,),
                onTap: () {
                  inote_idx = index;
                  Navigator.push(context, new MaterialPageRoute(
                      builder: (context) => new ImportantNoteView())
                  );
                }
            ),
            elevation: 0.0,
          );
        },
      ),
    );
  }
}