import 'package:date_utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/functions/functions.dart';
import 'package:flutter_app_ihc/calendar/eventInfo.dart';

class Event extends StatefulWidget {
  final eventInfo data;
  Event({this.data});

  @override
  EventState createState() => EventState();
}

class EventState extends State<Event> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Functions.appBar("Event Information", Icons.add, null),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 10.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(widget.data.TITLE, textAlign: TextAlign.left,style: TextStyle(fontSize: 25)),
              Text(widget.data.DATE),
            ],
          ),
          Card(
            color: Colors.transparent,
            shape: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 0.5,
                  color: Colors.grey,
                )),
            child: ListTile(
              title: Text(widget.data.DATE),
              subtitle: Text("Date"),
              trailing: Icon(Icons.date_range),
            ),
            elevation: 0.0,
          ),
          Card(
            color: Colors.transparent,
            shape: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 0.5,
                  color: Colors.grey,
                )),
            child: ListTile(
              title: Text(widget.data.PERCENTAGE),
              subtitle: Text("Percentage"),
              trailing: Icon(Icons.grade),
            ),
            elevation: 0.0,
          ),


        ],
      ),
    );
  }
}