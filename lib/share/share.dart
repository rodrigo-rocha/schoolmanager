import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/functions/functions.dart';

class Share extends StatefulWidget {

  @override
  ShareState createState() => ShareState();
}

class ShareState extends State<Share> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: Functions.appBar("Share", Icons.add, null),
      body: ListView(
        children: <Widget>[
          shareTile("Share my Schedule", Icons.calendar_today,() => Functions.showShareDialog(context)),
          shareTile("Share my Details", Icons.person_outline,() => Functions.showShareDialog(context)),
          shareTile("Add new User", Icons.person_add, () => print("QR")),

        ],
      ),
    );
  }

  Widget shareTile(String name, IconData icon, action()) {
    return Card(
      elevation: 0.0,
      margin: EdgeInsets.all(0.0),
      shape: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Colors.grey,
          width: 0.5,
        )
      ),
      child: ListTile(
        onTap: () {
          action();
        },
        title: Text(name),
        subtitle: Text("Click to share."),
        leading: Icon(icon, color: Colors.blue, size: 30),
      ),
    );
  }



}