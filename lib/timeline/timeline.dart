import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/functions/functions.dart';

class Timeline extends StatefulWidget {

  @override
  TimelineState createState() => TimelineState();
}

class TimelineState extends State<Timeline> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement Notes build
    return Scaffold(
      appBar: Functions.appBar("TIMELINE", Icons.add, null),
      drawer: Functions.sideBar(context),
      body: new ListView(
        children: <Widget>[
          _event("Aniversário da Ana", Icons.cake),
          _event("Apresentação de IHC", Icons.event_note),
          _event("Exame Prático de  IHC", Icons.shopping_cart),
          _event("", Icons.today),
          _event("", Icons.today),
          _event("", Icons.today),
        ],
      ),
    );
  }
}


Widget _event(String txt, IconData icon){
  return Stack(
    children: <Widget>[
      new Padding(
        padding: const EdgeInsets.only(left: 50.0),
        child: new Card(
          margin: new EdgeInsets.all(20.0),
          child: Center(
            child: new Container(
              width: double.infinity,
              height: 200.0,
              color: Colors.green[50],
              child: Center(
                child: Text(txt),
              ),
            ),
          ),
        ),
      ),
      new Positioned(
        top: 0.0,
        bottom: 0.0,
        left: 35.0,
        child: new Container(
          height: double.infinity,
          width: 1.0,
          color: Colors.green,
        ),
      ),
      new Positioned(
        top: 100.0,
        left: 15.0,
        child: new Container(
          height: 40.0,
          width: 40.0,
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: new Container(
            margin: new EdgeInsets.all(5.0),
            height: 30.0,
            width: 30.0,
            child: Icon(icon, color: Colors.white, size: 20),
            decoration: new BoxDecoration(
              //image: DecorationImage(image: Icon(Icons.accessible_forward)),
                shape: BoxShape.circle,
                color: Colors.blue),
          ),
        ),
      )
    ],
  );
}