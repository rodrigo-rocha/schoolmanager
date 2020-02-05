import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/functions/functions.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:auto_size_text/auto_size_text.dart';

TextEditingController subjectController = new TextEditingController();
TextEditingController bodyController = new TextEditingController();

TextEditingController meetingController = new TextEditingController();

class GenericTeacherInfo extends StatefulWidget {

  @override
  GenericTeacherInfoState createState() => GenericTeacherInfoState();
}

int edit_cont;

class GenericTeacherInfoState extends State<GenericTeacherInfo> {

  void choiceActions(String choice) {
    if(choice == 'Edit') {
    } else if(choice == 'Delete') {
      _showDialog();
    }
  }

  Widget popUpButton(){
    return PopupMenuButton<String> (
      onSelected: choiceActions,
      itemBuilder: (BuildContext context) {
        return ['Edit', 'Delete'].map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
    );
  }

  Widget _scheduleMeeting(String name, Widget traillingAction) {
    return Card(
      color: Colors.transparent,
      child: ListTile(
        title: Text(name),
        trailing: traillingAction,
      ),
      elevation: 0.0,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: Functions.appBar("Information", Icons.add, popUpButton()),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage('https://utulsa.edu/wp-content/uploads/2018/08/generic-avatar.jpg'),
                radius: 70.0,
              ),
              SizedBox(width: 30),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Gonçalo Faria", textAlign: TextAlign.left, style: TextStyle(fontSize: 25)),
                  Text("gonçalo@sm.pt"),

                ],
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              miniIcons("Schedule", Icons.calendar_today, () => Navigator.of(context).pushNamed('/week_schedule'), Colors.blue),
              miniIcons("Shared Docs", Icons.folder_shared, () => Navigator.of(context).pushNamed('/shared_docs'), Colors.blue),
              availIcon(new Random().nextInt(10)),
            ],
          ),
          _scheduleMeeting('Schedule Meeting', traillingAction(Icons.keyboard_arrow_right, "Schedule Meeting", () { _showScheduleDialog(); } )),
          _infoT("gonçalo@sm.pt", 'E-Mail', traillingAction(Icons.mail_outline, "Send Email", () { _showMailDialogue(); } )),
          _infoT("210000000", 'Phone', traillingAction(Icons.phone, "Call", () { _openWith('tel:210000000'); })),
          _infoT("Network Architecture", 'Courses', traillingAction(Icons.description, "Information", () { _googleSearch("Network Architecture"); })),
          _infoT("DETI", 'Department', traillingAction(Icons.place, "Locate", () { Functions.showLocation(context,'assets/images/dept_location.png'); })),
          _infoT("4.2.10", 'Office', traillingAction(Icons.place, "Locate", () { Functions.showLocation(context,'assets/images/location.png'); } )),
        ],
      ),

    );
  }

  Widget miniIcons(String label, IconData icon, action(), Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        IconButton(icon: Icon(icon), color: color, onPressed: () { action(); },),
        Text(label, style: TextStyle(color: color),),
      ],
    );
  }

  Widget availIcon(int avail) {
    if(avail%2 == 0) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(icon: Icon(Icons.fiber_smart_record), color: Colors.green, onPressed: () {Functions.showSimpleDialog(context, "Not Available", classInfo(true));}),
          Text("Not at class", style: TextStyle(color: Colors.green),),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(icon: Icon(Icons.fiber_smart_record), color: Colors.red, onPressed: () {Functions.showSimpleDialog(context, "Available", classInfo(false));}),
          Text("At class", style: TextStyle(color: Colors.red),),
        ],
      );
    }

  }

  Widget _infoT(String title, String sub, Widget traillingAction) {
    return Card(
      color: Colors.transparent,
      shape: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 0.5,
            color: Colors.grey,
          )),
      child: ListTile(
        title: Text(title),
        subtitle: Text(sub),
        trailing: traillingAction,
      ),
      elevation: 0.0,
    );
  }

  Widget traillingAction(IconData icon, String text, actions()) {
    return GestureDetector(
      child: Container(
        width: 70,
        child: Column(
            children: <Widget>[
              Icon(icon, color: Colors.blue,),
              AutoSizeText(
                text,
                style: TextStyle(color: Colors.blue, fontSize: 15.0),
              ),
            ]
        ),
      ),
      onTap: () {
        actions();
      },
    );
  }

  Widget classInfo(avail) {
    if(avail) {
      return Text("Currently Not at class.", style: TextStyle(color: Colors.green),);
    } else {
      return Container(
        height: 55,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text("Currently at class.", style: TextStyle(color: Colors.red),),
            SizedBox(height: 5),
            Row(
              children: <Widget>[
                Text("Class: ", style: TextStyle(fontWeight: FontWeight.bold,)),
                Text("Network Achitecture"),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: <Widget>[
                Text("Room: ", style: TextStyle(fontWeight: FontWeight.bold,)),
                Text("4.1.15"),
              ],
            ),
          ],
        ),
      );
    }


  }


  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Delete Gonçalo Faria?"),
          content: new Text("Are you sure you want to delete Gonçalo Faria?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Delete", style: TextStyle(color: Colors.red, fontSize: 17)),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacementNamed(context, '/user_tab_controller');
              },
            ),
            new FlatButton(
              child: new Text("Close", style: TextStyle(fontSize: 17)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showMailDialogue() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return ListView(
          children: <Widget>[
            AlertDialog(
              title: Column(children: <Widget>[Text("Destination: ", style: TextStyle(fontWeight: FontWeight.bold)), new Text("gonçalo@sm.pt"),],),
              content: Column(
                children: <Widget>[
                  TextField(
                    controller: subjectController,
                    decoration: InputDecoration(
                      hintText: "Subject",
                    ),
                  ),
                  TextField(
                    controller: bodyController,
                    maxLines: 15,
                    decoration: InputDecoration(
                      hintText: "Message",
                    ),
                  ),
                ],
              ),

              //new Text("Are you sure you want to delete ${teachersList[t_idx].name}?"),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                new FlatButton(
                  child: new Text("Close", style: TextStyle(fontSize: 17)),
                  onPressed: () {
                    //teachersList.removeAt(t_idx);
                    Navigator.of(context).pop();
                  },
                ),
                new FlatButton(
                  child: new Text("Send", style: TextStyle(color: Colors.green, fontSize: 17)),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Functions.confirmationEmail(context, "gonçalo@sm.pt");
                  },
                ),
              ],
            )
          ],
        );
      },
    );
  }

  List<String> dates = ['Monday 14-15h', 'Monday 15-16h', 'Thusday 16-17h', 'Wednesday 16-17h', 'Wednesday 17-18h', 'Thurday 10-11h', 'Thurday 11-12h'];

  Widget gradeActions(){
    return PopupMenuButton<String> (
      icon: Icon(Icons.add_circle),
      onSelected: choiceActions,
      itemBuilder: (BuildContext context) {
        return dates.map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
    );
  }

  Widget dropdownField(String hint, TextEditingController cont, var items) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0, left: 18.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new TextField(
              controller: cont,
              decoration: InputDecoration(hintText: hint),
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

  void _showScheduleDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Please choose the day and time of the meeting."),
          content: dropdownField("Day and time of meeting", meetingController, dates),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Go Back", style: TextStyle(fontSize: 17)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Schedule Meeting", style: TextStyle(color: Colors.green, fontSize: 17)),
              onPressed: () {
                Navigator.of(context).pop();
                Functions.confirmationMeeting(context, meetingController.text);
              },
            ),
          ],
        );
      },
    );
  }

  _openWith(String url) async{
    //const url = urlProp;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _googleSearch(String query) async {
    String url = 'https://www.google.com/search?q=$query';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}