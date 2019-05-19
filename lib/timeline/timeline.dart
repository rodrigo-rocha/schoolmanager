import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_app_ihc/functions/functions.dart';

class Timeline extends StatefulWidget {

  @override
  TimelineState createState() => TimelineState();
}

class TimelineState extends State<Timeline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Functions.appBar("Timeline", Icons.add, null),
      drawer: Functions.sideBar(context),
      body: new ListView(
        children: <Widget>[
//          _event("Aniversário da Susana", "25-02-2019", Icons.cake),
//          _event("", "", Icons.today),
          _event("IHC Presentation", DateFormat('dd-MM-yyyy').format(DateTime.now().add(Duration(days: 0))).toString(), Icons.event_note),
          _event("PEI MileStone", DateFormat('dd-MM-yyyy').format(DateTime.now().add(Duration(days: 7))).toString(), Icons.shopping_cart),
          _event("AR exam", DateFormat('dd-MM-yyyy').format(DateTime.now().add(Duration(days: 7))).toString(), Icons.today),
        ],
      ),
    );
  }
}


Widget _event(String txt, String data, IconData icon){
  return Stack(
    children: <Widget>[
      new Padding(
        padding: const EdgeInsets.only(left: 50.0),
        child: new Card(
          elevation: 0,
          shape: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue
            )
          ),
          margin: new EdgeInsets.all(20.0),
          child: Center(
            child: new Container(
              width: double.infinity,
              height: 80.0,
              //color: Colors.green[50],
              color: Colors.transparent,
              child:
                Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(txt, style: TextStyle(fontSize: 20)),
                    Text(data, style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
              ),
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
          color: Colors.blue,
        ),
      ),
      new Positioned(
        top: 40.0,
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