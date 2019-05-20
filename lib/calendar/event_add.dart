import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/functions/functions.dart';


class EventAdd extends StatefulWidget {
  @override
  EventAddState createState() => EventAddState();
}

class EventAddState extends State<EventAdd>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Functions.appBar("New Event", Icons.add, null),
      drawer: Functions.sideBar(context),
      body: Column(
        children: <Widget>[
          Text("Title"),
          Text("Description"),
          Text("Hora"),
          Text(""),



        ],
      ),
    );
  }
}