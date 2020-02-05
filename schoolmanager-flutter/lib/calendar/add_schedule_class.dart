import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/functions/functions.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_app_ihc/classes/DateFormat.dart';

TextEditingController titleController = new TextEditingController();
TextEditingController placeController = new TextEditingController();
TextEditingController beginController = new TextEditingController();
TextEditingController endController = new TextEditingController();
TextEditingController dayController = new TextEditingController();
TextEditingController typeController = new TextEditingController();

DateTime finalDate;
String endDate = "Not Defined";


class AddScheduleClass extends StatefulWidget {
  @override
  AddScheduleClassState createState() => AddScheduleClassState();
}

class AddScheduleClassState extends State<AddScheduleClass>{

  void addEventAction() {
    Navigator.pushReplacementNamed(context, '/my_week_schedule');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Functions.createBar("New Event", () => addEventAction(), () => Navigator.pop(context)),
      drawer: Functions.sideBar(context),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              textField("Class *", titleController),
              dropdownField("Day", dayController, type),
              dropdownField("Day", typeController, days),
              Card(
                color: Colors.transparent,
                elevation: 0.0,
                child: ListTile(
                  title: Text('Beginning: $endDate', textAlign: TextAlign.left),
                  subtitle: Text("Tap to select"),
                  trailing: IconButton(
                    icon: Icon(Icons.keyboard_arrow_right),
                    onPressed: () {_selectTime(context);},
                  ),
                  onTap: () {
                    _selectTime(context);
                  },
                ),
              ),
              Card(
                color: Colors.transparent,
                elevation: 0.0,
                child: ListTile(
                  title: Text('End: $endDate', textAlign: TextAlign.left),
                  subtitle: Text("Tap to select"),
                  trailing: IconButton(
                    icon: Icon(Icons.keyboard_arrow_right),
                    onPressed: () {_selectTime(context);},
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

    DatePicker.showTimePicker(
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
            endDate = '${date.hour}:${date.minute}';
          });
          //print("---->$date");
        }
      },
    );
  }

  List<String> days = ['Monday', 'Tuesday', 'Wednesday', 'Thrusday', 'Friday', 'Saturday', 'Sunday'];
  List<String> type = ['Practical class', 'Theorical class'];

  /// Validate
  Widget dropdownField(String hint, TextEditingController cont, var items) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0, left: 18.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: Form(
              child: new TextField(
                controller: cont,
                decoration: InputDecoration(hintText: hint),
              ),
            ),
          ),
          new PopupMenuButton<String>(
            elevation: 5,

            icon: const Icon(Icons.arrow_drop_down),

            onSelected: (String value) {
              cont.text = value;
            },
            itemBuilder: (BuildContext context) {
              return items.map<PopupMenuItem<String>>((String value) {
                return new PopupMenuItem(
                  child: new Text(value),
                  value: value,
                );
              }).toList();
            },
          ),
        ],
      ),
    );
  }
}