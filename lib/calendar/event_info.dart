import 'package:date_utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/functions/functions.dart';
import 'package:url_launcher/url_launcher.dart';


class EventInfo extends StatefulWidget {

  @override
  EventInfoState createState() => EventInfoState();
}

class EventInfoState extends State<EventInfo> {

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
              Text("Teste de IHC", textAlign: TextAlign.left,style: TextStyle(fontSize: 25)),
              Text("12/9/2019"),
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
              title: Text("19 May 2019"),
              subtitle: Text("Date"),
              trailing: Icon(Icons.accessible_forward),
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
              title: Text("30%"),
              subtitle: Text("Percentage"),
              trailing: Icon(Icons.accessible_forward),
            ),
            elevation: 0.0,
          ),


        ],
      ),
    );
  }

  _onTap() async{
    const url = 'https://www.instagram.com/__rodrigorocha__/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }



}