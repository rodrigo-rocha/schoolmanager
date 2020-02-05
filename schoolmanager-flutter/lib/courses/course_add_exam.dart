import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/functions/functions.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_app_ihc/classes/DateFormat.dart';

TextEditingController titleController = new TextEditingController();
TextEditingController placeController = new TextEditingController();
TextEditingController beginController = new TextEditingController();
TextEditingController endController = new TextEditingController();

DateTime finalDate;
String endDate = "Not Defined";


class AddExam extends StatefulWidget {
  @override
  AddExamState createState() => AddExamState();
}

class AddExamState extends State<AddExam>{

  void addEventAction() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Functions.createBar("New evaluation", () => addEventAction(), () => Navigator.pop(context)),
      drawer: Functions.sideBar(context),
      body: Column(
        children: <Widget>[
          textField("Name *", titleController),
          textField("Place", placeController),
          Card(
            color: Colors.transparent,
            elevation: 0.0,
            child: ListTile(
              title: Text('Date: $endDate', textAlign: TextAlign.left),
              subtitle: Text("Tap to select"),
              trailing: IconButton(
                icon: Icon(Icons.keyboard_arrow_right),
                onPressed: () {},
              ),
              onTap: () {
                _selectTime(context);
              },
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text("Fields with * are required",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red[400]),
                ),
              ),
            ],
          )


        ],
      ),
    );
  }

  Widget textField(String hint, TextEditingController cont) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0, left: 18.0, right: 18.0),
      child: TextFormField(
        controller: cont,
        decoration: InputDecoration(
          hintText: hint,
        ),
      ),
    );
  }


  Widget reqFieldInfo() {
    return Padding(
      padding: const EdgeInsets.only(right: 18.0),
      child: Text("Fields with * are required",
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red[400]),
        textAlign: TextAlign.left,
      ),
    );
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Invalid date picked"),
          content: new Text("Please select a valid date."),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<Null> _selectTime(BuildContext context) async {

    DatePicker.showDateTimePicker(
      context,
      theme: DatePickerTheme(
        doneStyle: TextStyle(
          color: Colors.green,
        ),
        containerHeight: 300,
      ),
      currentTime: DateTime.now(),
      locale: LocaleType.en, // Dates in English
      showTitleActions: true,
      onConfirm: (date) {
        if(date.compareTo(DateTime.now()) <= 0) {
          _showDialog();
          _showDialog();
        } else {
          setState(() {
            finalDate = date;
            endDate = DateReformat.reformat(date.toIso8601String()).toString();
          });
          //print("---->$date");
        }
      },
    );
  }
}