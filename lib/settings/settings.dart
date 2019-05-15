import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/functions/functions.dart';


class Settings extends StatefulWidget {

  @override
  SettingsState createState() => SettingsState();
}

class SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: Functions.appBar("Settings", Icons.add, null),
      body: new Container(
        child: new Center(
          child:  ListView(
              children: <Widget>[
                ///TODO: Beginning of the week(sunday or monday) card



                ///Color Theme card
                Card(
                  color: Colors.transparent,
                  shape: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.5,
                        color: Colors.grey,
                      )),
                  child: ListTile(
                      title: Text("Blue"  , style: TextStyle(fontSize: 20)),

                      subtitle: Text("Color Theme"),
                      leading: Icon(Icons.color_lens, color: Colors.blue,),
                      trailing: SizedBox(
                        width: 30.0,
                        height: 30.0,
                        child: DecoratedBox(
                          decoration: ShapeDecoration(
                              shape: CircleBorder(),
                              color: Colors.blue),
                        ),
                      ),
                      onTap: () {
                      }
                  ),
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
                      title: Text("English" , style: TextStyle(fontSize: 20)),
                      subtitle: Text("Language"),
                      leading: Icon(Icons.info_outline, color: Colors.blue,),
                      onTap: () {
                      }
                  ),
                  elevation: 0.0,
                ),
              ],
          ),
        ),
      ),
    );
  }
}