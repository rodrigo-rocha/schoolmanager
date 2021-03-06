import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/functions/functions.dart';
import 'package:flutter_app_ihc/users/students/student_list.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:auto_size_text/auto_size_text.dart';

TextEditingController subjectController = new TextEditingController();
TextEditingController bodyController = new TextEditingController();


class StudentInfo extends StatefulWidget {

  @override
  StudentInfoState createState() => StudentInfoState();
}

class StudentInfoState extends State<StudentInfo> {

  void choiceActions(String choice) {
    if(choice == 'Edit') {
      Navigator.pushReplacementNamed(context, '/student_edit');
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
                backgroundImage: NetworkImage(studentList[s_idx].photo),
                radius: 70.0,
              ),
              SizedBox(width: 30),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(studentList[s_idx].name, textAlign: TextAlign.left,style: TextStyle(fontSize: 25)),
                  Text(studentList[s_idx].email),
                ],
              )
            ],
          ),
          _infoT(studentList[s_idx].email, 'E-Mail', traillingAction(Icons.mail_outline, "Send Email", () { _showMailDialogue(); } )),
          _infoT(studentList[s_idx].phone, 'Phone', traillingAction(Icons.phone, "Call", () { _openWith('tel:${studentList[s_idx].phone}'); })),
          _infoT(studentList[s_idx].department, 'Department', traillingAction(Icons.place, "Locate", () {Functions.showLocation(context,'assets/images/dept_location.png');})),
          _infoT(studentList[s_idx].degree, 'Degree', traillingAction(Icons.help_outline, "Learn More", () { _googleSearch(studentList[s_idx].degree);})),
        ],
      ),

    );
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
                maxLines: 1,
              ),
            ]
        ),
      ),
      onTap: () {
        actions();
      },
    );
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Delete ${studentList[s_idx].name}"),
          content: new Text("Are you sure you want to delete ${studentList[s_idx].name}?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Delete", style: TextStyle(color: Colors.red, fontSize: 17)),
              onPressed: () {
                studentList.removeAt(s_idx);
                Navigator.pop(context);
                Navigator.pushNamed(context, '/user_tab_controller');
              },
            ),
            new FlatButton(
              child: new Text("Go Back", style: TextStyle(fontSize: 17)),
              onPressed: () {
                Navigator.of(context).pop();
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

  void _showMailDialogue() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return ListView(
          children: <Widget>[
            AlertDialog(
              title: Column(children: <Widget>[Text("Destination: ", style: TextStyle(fontWeight: FontWeight.bold)), new Text("${studentList[s_idx].email}"),],),
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
                    Navigator.of(context).pop();
                  },
                ),
                new FlatButton(
                  child: new Text("Send", style: TextStyle(color: Colors.green, fontSize: 17)),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    Functions.confirmationEmail(context, studentList[s_idx].email);
                  },
                ),
              ],
            )
          ],
        );
      },
    );
  }

}