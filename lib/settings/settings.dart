import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/functions/functions.dart';

class Settings extends StatefulWidget {
  @override
  SettingsState createState() => SettingsState();
}

class SettingsState extends State<Settings> {
  Icon iconOff = Icon(Icons.volume_off);
  Icon iconUp = Icon(Icons.volume_up);
  bool icon = true;

  static List colorsPick = [
    ["Blue", Colors.blue],
    ["Red", Colors.red],
    ["Pink", Colors.pink],
    ["Green", Colors.green],
    ["Orange", Colors.orange],
    ["Yellow", Colors.yellow],
    ["Black", Colors.black]
  ];
  List colorInfo = colorsPick[0];

  static List languagePick = [
    ["English", AssetImage("assets/settings/English.jpg")],
    ["Português", AssetImage("assets/settings/Português.jpg")],
    ["Deutsch", AssetImage("assets/settings/Deutsch.jpg")],
    ["French", AssetImage("assets/settings/French.png")],
    ["Japanese", AssetImage("assets/settings/Japanese.png")],
    ["Chinese", AssetImage("assets/settings/Chinese.png")],
    ["Russian", AssetImage("assets/settings/Russian.png")]
  ];

  List languageInfo = languagePick[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Functions.appBar("Settings", Icons.add, null),
      drawer: Functions.sideBar(context),
      body: new Container(
        child: new Center(
          child: ListView(
            children: <Widget>[
              ///TODO: Beginning of the week(sunday or monday) card
              Card(
                color: Colors.transparent,
                shape: UnderlineInputBorder(
                    borderSide: BorderSide(
                  width: 0.5,
                  color: Colors.grey,
                )),
                child: ListTile(
                    title: Text(icon ? "Volume On" : "Volume Off",
                        style: TextStyle(fontSize: 20)),
                    subtitle: Text("Sound Alert"),
                    leading: Text(""),
                    trailing: icon ? iconUp : iconOff,
                    onTap: () {
                      _volumeState();
                    }),
                elevation: 0.0,
              ),

              ///Color Theme card
              Card(
                color: Colors.transparent,
                shape: UnderlineInputBorder(
                    borderSide: BorderSide(
                  width: 0.5,
                  color: Colors.grey,
                )),
                child: ListTile(
                    title: Text(colorInfo[0], style: TextStyle(fontSize: 20)),
                    subtitle: Text("Color Theme"),
                    leading: Icon(
                      Icons.color_lens,
                      color: colorInfo[1],
                    ),
                    trailing: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.0),
                            spreadRadius: 1,
                            blurRadius: 2.0,
                          ),
                        ],
                      ),
                      child: SizedBox(
                        width: 40.0,
                        height: 40.0,
                        child: DecoratedBox(
                          decoration: ShapeDecoration(
                              shape: CircleBorder(), color: colorInfo[1]),
                        ),
                      ),
                    ),
                    onTap: () {
                      _showDialogColors();
                    }),
                elevation: 0.0,
              ),

              ///Language card
              Card(
                color: Colors.transparent,
                shape: UnderlineInputBorder(
                    borderSide: BorderSide(
                  width: 0.5,
                  color: Colors.grey,
                )),
                child: ListTile(
                    title:
                        Text(languageInfo[0], style: TextStyle(fontSize: 20)),
                    subtitle: Text("Language"),
                    leading: Icon(
                      Icons.flag,
                      color: colorInfo[1],
                    ),
                    trailing: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.0),
                            spreadRadius: 1,
                            blurRadius: 2.0,
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        backgroundImage: languageInfo[1],
                      ),
                    ),
                    onTap: () {
                      _showDialog();
                    }),
                elevation: 0.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _volumeState() {
    setState(() {
      icon = !icon;
    });
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Select Language"),
          content: new ListView(
            children: <Widget>[
              colorLanguageTile(languagePick[0]),
              colorLanguageTile(languagePick[1]),
              colorLanguageTile(languagePick[2]),
              colorLanguageTile(languagePick[3]),
              colorLanguageTile(languagePick[4]),
              colorLanguageTile(languagePick[5]),
              colorLanguageTile(languagePick[6]),
            ],
          ),
          actions: <Widget>[
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

  void _showDialogColors() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Select Color"),
          content: new ListView(
            children: <Widget>[
              colorSelectTile(0, colorsPick[0]),
              colorSelectTile(1, colorsPick[1]),
              colorSelectTile(2, colorsPick[2]),
              colorSelectTile(3, colorsPick[3]),
              colorSelectTile(4, colorsPick[4]),
              colorSelectTile(4, colorsPick[5]),
              colorSelectTile(4, colorsPick[6]),
            ],
          ),
          actions: <Widget>[
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

  Widget colorSelectTile(int i, List lst) {
    return Card(
      elevation: 0.0,
      shape: UnderlineInputBorder(borderSide: BorderSide(width: 0.1)),
      child: ListTile(
          title: Text(lst[0]),
          leading: Icon(
            Icons.adjust,
            color: lst[1],
          ),
          onTap: () {
            setState(() {
              colorInfo = lst;
            });
            Navigator.pop(context);
          }),
    );
  }

  Widget colorLanguageTile(List lst) {
    return Card(
      elevation: 0.0,
      shape: UnderlineInputBorder(borderSide: BorderSide(width: 0.1)),
      child: ListTile(
        title: Text(lst[0]),
        leading: CircleAvatar(
          backgroundImage: lst[1],
        ),
        onTap: () {
          setState(() {
            languageInfo = lst;
          });
          Navigator.pop(context);
        },
      ),
    );
  }
}
