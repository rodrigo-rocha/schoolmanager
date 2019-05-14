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
      body: new Container(
        child: new Center(
          child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.transparent,
                  shape: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.5,
                        color: Colors.grey,
                      )),
                  child: ListTile(
                      title: Text("Set" , style: TextStyle(fontSize: 20)),
                      subtitle: Text("set 1"),
                      trailing: Icon(Icons.info_outline, color: Colors.blue,),
                      leading: Icon(Icons.category, color: Colors.blue),
                      onTap: () {
                        _onTap();
                      }
                  ),
                  elevation: 0.0,
                );
              }
          ),
        ),
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