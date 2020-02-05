import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/functions/functions.dart';

class WeekSchedule extends StatefulWidget{
  @override
  WeekScheduleState createState()=> WeekScheduleState();
}

class WeekScheduleState extends State<WeekSchedule> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: Functions.appBar("Schedule", Icons.add_circle, null),
      body: ListView(
        children: <Widget>[
          buildDayInfo("Monday"),
          buildDay("Network Architecture T", '08:10 - 12:00' ,'4.1.15'),
          buildDay("Human-Computer Interaction P", '08:10 - 12:00' ,'4.1.15'),
          buildDay("IHuman-Computer Interaction T", '08:10 - 12:00' ,'4.1.15'),
          buildDayInfo("Tuesday"),
          buildDay("Databases P", '08:10 - 12:00' ,'4.1.15'),
          buildDay("Databases T", '08:10 - 12:00' ,'4.1.15'),
          buildDay("Human-Computer Interaction T", '08:10 - 12:00' ,'4.1.15'),
          buildDayInfo("Wednesday"),
          buildDay("Human-Computer Interaction P", '08:10 - 12:00' ,'4.1.15'),
          buildDay("Network Architecture T", '08:10 - 12:00' ,'4.1.15'),
          buildDayInfo("Thursday"),
          buildDay("Network Architecture P", '08:10 - 12:00' ,'4.1.15'),
          buildDayInfo("Friday"),
          buildDay("No classes", '-' ,'-'),
          buildDayInfo("Saturday"),
          buildDay("No classes", '-' ,'-'),
        ],
      ),
      
      
    );
  }

  Widget buildDayInfo(String name) {

    return Card(
      elevation: 0.0,
      color: Colors.blue[50],
      shape: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,

        ),
      ),
      child: ListTile(
        title: Text(name, style: TextStyle(fontSize: 23)),
      ),
    );
  }

  Widget buildDay(String course, String time, String room) {

    return Card(
      elevation: 0.0,
      color: Colors.transparent,
      shape: UnderlineInputBorder(
        borderSide: BorderSide(
          width: 0.5,
          color: Colors.grey
        )
      ),
      child: Container(
        height: 70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(time, style: TextStyle(fontSize: 15)),
                Text(room, style: TextStyle(fontSize: 15)),

              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(course, style: TextStyle(fontSize: 20)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}