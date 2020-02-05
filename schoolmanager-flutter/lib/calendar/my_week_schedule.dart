import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/functions/functions.dart';

class MyWeekSchedule extends StatefulWidget{
  @override
  MyWeekScheduleState createState()=> MyWeekScheduleState();
}

class MyWeekScheduleState extends State<MyWeekSchedule> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: Functions.sideBar(context),
      appBar: AppBar(
        title: Text(
          "My Schedule",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25.0,
            fontFamily: 'Questrial',
            color: Colors.blue,
          ),
        ),
        elevation: 2.0,
        iconTheme: IconThemeData(
          color: Colors.blue, //change your color here
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: () => Navigator.of(context).pushNamed('/add_schedule_class')),
        ],
      ),
      body: ListView(
        children: <Widget>[
          buildDayInfo("Monday"),
          buildDay("Network Architecture T", '10:00 - 12:00' ,'4.1.15'),
          buildDay("Human-Computer Interaction P", '14:00 - 15:30' ,'4.1.15'),
          buildDay("IHuman-Computer Interaction T", '15:30 - 18:00' ,'Anf. V'),
          buildDayInfo("Tuesday"),
          buildDay("Databases P", '09:00 - 10:30' ,'4.1.15'),
          buildDay("Databases T", '10:30 - 12:00' ,'Anf. IV'),
          buildDay("Human-Computer Interaction T", '14:00 - 15:00' ,'Anf. IV'),
          buildDayInfo("Wednesday"),
          buildDay("Human-Computer Interaction P", '09:00 - 12:00' ,'4.1.15'),
          buildDay("Network Architecture T", '14:00 - 15:00' ,'4.1.12'),
          buildDayInfo("Thursday"),
          buildDay("Network Architecture P", '10:00 - 12:00' ,'4.2.20'),
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
      color: Colors.blue[100],
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