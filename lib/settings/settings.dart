import 'package:flutter/material.dart';



class Settings extends StatefulWidget {

  @override
  SettingsState createState() => SettingsState();
}

class SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context){
    return Scaffold(

      body: new Container(
        child: new Center(
          child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                //return _teacher(teachersList[index].name, teachersList[index].email, teachersList[index].photo);
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
}