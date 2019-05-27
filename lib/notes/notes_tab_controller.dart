import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/notes/important_notes/important_notes_list.dart';
import 'package:flutter_app_ihc/notes/notes/note_list.dart';
import 'package:flutter_app_ihc/functions/functions.dart';

class NotesTabController extends StatefulWidget {
  @override
  NotesTabControllerState createState() => new NotesTabControllerState();
}

class NotesTabControllerState extends State<NotesTabController> {

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Functions.sideBar(context),
        appBar: AppBar(
          centerTitle: true,
          title: Text('Notes', textAlign: TextAlign.left ,
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.blue,
            ),
          ),
          elevation: 0.5, // 2
          leading: IconButton(icon:Icon(Icons.menu),
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
              Tab(child: Text("Important", style: TextStyle(fontSize: 22.0, color: Colors.blue))),
              Tab(child: Text("Regular", style: TextStyle(fontSize: 22.0, color: Colors.blue))),
            ],
          ),
          //title: Text('Notes'),
        ),
          body: TabBarView(
            children: [
              new ImportantNoteList(),
              new NoteList(),
            ],
          ),
        ),
    );
  }

}