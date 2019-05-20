import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/functions/functions.dart';
import 'package:flutter_app_ihc/notes/notes/note_list.dart';

TextEditingController titleController = new TextEditingController();
TextEditingController bodyController = new TextEditingController();

String editTitle = titleController.text;
String editbody = bodyController.text;

class NoteView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {

    return NoteViewState();
  }
}
class NoteViewState extends State<NoteView> {

  void choiceActions(String choice) {
    if(choice == 'Edit') {
      Navigator.pushNamed(context, '/note_edit');
    } else if(choice == 'Delete') {
      _showDialog();
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

    return Scaffold(

      appBar: Functions.appBar("Title", Icons.landscape, popUpButton()),
      body: Padding(
        padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
        child: ListView(
          children: <Widget>[
            noteTitleViewer(),
            noteBodyViewer(),
          ],
        ),
      ),
    );
  }

  Widget noteTitleViewer() {
    return Container(
      height: 30,
      //color: Colors.yellow[100],
      decoration: ShapeDecoration(
        shape: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(1.0),
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
      child: Text(noteList[note_idx].title, style: TextStyle(fontSize: 25), textAlign: TextAlign.left),
    );
  }

  Widget noteBodyViewer() {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Text(noteList[note_idx].body, style: TextStyle(fontSize: 15),)
    );
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Delete Note"),
          content: new Text("Are you sure you want to delete this note?"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Delete", style: TextStyle(color: Colors.red, fontSize: 17)),
              onPressed: () {
                noteList.removeAt(note_idx);
                Navigator.of(context).pop();
                Navigator.pushReplacementNamed(context, '/notes_tab_controller');
              },
            ),
            new FlatButton(
              child: new Text("Close", style: TextStyle(fontSize: 17)),
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