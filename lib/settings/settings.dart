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
                        _showDialogColors();
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
                      leading: Icon(Icons.flag, color: Colors.blue,),
                      trailing: CircleAvatar(
                        child: Image.network('https://images-na.ssl-images-amazon.com/images/I/61RmUb5bD1L._UX522_.jpg'),
                      ),
                      onTap: () {
                        _showDialog();
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

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Select Language"),
          content: new ListView(
            children: <Widget>[
              colorLanguageTile('English', 'https://images-na.ssl-images-amazon.com/images/I/61RmUb5bD1L._UX522_.jpg'),
              colorLanguageTile('Português', 'https://i.ebayimg.com/images/g/RC0AAOSwPRxbPj-K/s-l300.jpg'),
              colorLanguageTile('Deutsch', 'https://www.publicdomainpictures.net/pictures/250000/nahled/german-flag.jpg'),

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
               colorSelectTile("Blue", Colors.blue),
               colorSelectTile("Red", Colors.red),
               colorSelectTile("Green", Colors.green),
               colorSelectTile("Orange", Colors.orange),
               colorSelectTile("Black", Colors.black),
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

  Widget colorSelectTile(String color, Color colorS) {
    return Card(
      elevation: 0.0,
      shape:UnderlineInputBorder(
        borderSide: BorderSide(
          width: 0.1
        )
      ) ,
      child: ListTile(
        title: Text(color),
        leading: Icon(Icons.adjust, color: colorS,)
      ),
    );
  }

  Widget colorLanguageTile(String language, String url) {
    return Card(
      elevation: 0.0,
      shape:UnderlineInputBorder(
          borderSide: BorderSide(
              width: 0.1
          )
      ) ,
      child: ListTile(
        title: Text(language),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(url),
        ),
      ),
    );
  }
}