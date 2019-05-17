import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/functions/functions.dart';
import 'package:flutter_app_ihc/classes/Notes.dart';

List<Note> noteList = [
  new Note("Repository Github", "Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0Check repository schoolmanager2.0"),
  new Note("Repository Github A", "Check repository schoolmanager2.0 A"),
  new Note("Repository Github B", "Check repository schoolmanager2.0 B"),
  new Note("Repository Github C", "Check repository schoolmanager2.0 C"),
  new Note("Repository Github D", "Check repository schoolmanager2.0 D"),
];

int note_idx;

class NoteList extends StatefulWidget {

  @override
  NoteListState createState() => NoteListState();
}

class NoteListState extends State<NoteList> {

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
        itemCount: noteList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.transparent,
            shape: UnderlineInputBorder(
              borderSide: BorderSide(
                width: 0.5,
                color: Colors.grey,
              )),
            child: ListTile(
              title: Text(noteList[index].title, style: TextStyle(fontSize: 20)),
              subtitle: Text(noteList[index].body, maxLines: 1,),
              leading: Icon(Icons.speaker_notes, color: Colors.blue,),
              //leading: Icon(Icons.category, color: Colors.blue),
              onTap: () {
                note_idx = index;
                Navigator.pushNamed(context, '/note_view');
              }
            ),
            elevation: 0.0,
          );
        },
      ),
    );
  }
}