import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/functions/functions.dart';
import 'package:flutter_app_ihc/notes/notes/note_list.dart';
import 'package:flutter_app_ihc/classes/Notes.dart';

TextEditingController titleController = TextEditingController();
TextEditingController descriptionController = TextEditingController();

FocusNode titleFocus = new FocusNode();
FocusNode bodyFocus = new FocusNode();

class NoteEdit extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {

    return NoteEditState();
  }
}

class NoteEditState extends State<NoteEdit> {

  final _validationKey = GlobalKey<FormState>();

  @override
  void initState() {
    titleController.text = noteList[note_idx].title;
    descriptionController.text = noteList[note_idx].body;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Functions.createBar("Edit note", ()
      {
        noteList.removeAt(note_idx);
        noteList.add(new Note(titleController.text, descriptionController.text, DateTime.now()));
        Navigator.pushReplacementNamed(context, '/notes_tab_controller');
      }, () => print("UNdone")),
      body: Padding(
        padding: EdgeInsets.only(top: 1.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[
            noteView(),
            helperButtons()
            //editSaveButton(),
          ],
        ),
      ),
    );
  }

  Widget helperButtons() {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(icon: Icon(Icons.filter), onPressed: () => ""),
                  Text("Add attachment", style: TextStyle(fontSize: 15)),
                ],
              ),
              Row(
                children: <Widget>[
                  IconButton(icon: Icon(Icons.cancel),
                    onPressed: () {
                      if(titleFocus.hasFocus) {
                        titleController.text = "";
                      } else {
                        descriptionController.text = "";
                      }
                    },),
                  Text("Clear field", style: TextStyle(fontSize: 15)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget noteView() {
    return Form(
      key: _validationKey,
      child: Column(
        children: <Widget>[
          noteTitleView(),
          SizedBox(height: 15),
          noteBodyView(),
        ],
      ),
    );
  }

  Widget noteTitleView() {
    return TextFormField(
      focusNode: titleFocus,
      onFieldSubmitted: (term) {
        titleFocus.unfocus();
        FocusScope.of(context).requestFocus(bodyFocus);
      },
      validator: (val) => val.isEmpty? 'This field can\'t be empty' : null,
      controller: titleController,
      decoration: InputDecoration(
          labelText: 'Title',
          alignLabelWithHint: true,
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(1.0),
          )
      ),
    );
  }

  Widget noteBodyView() {
    return TextFormField(
      validator: (val) => val.isEmpty? 'This field can\'t be empty' : null,
      focusNode: bodyFocus,
      controller: descriptionController,
      maxLines: 7,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
          labelText: 'Description',
          alignLabelWithHint: true,
          border: new UnderlineInputBorder(
            borderRadius: BorderRadius.circular(1.0),
          )
      ),
    );
  }
}

