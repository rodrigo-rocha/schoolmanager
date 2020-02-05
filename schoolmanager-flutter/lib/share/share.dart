import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/functions/functions.dart';
import 'package:image_picker/image_picker.dart';

class Share extends StatefulWidget {

  @override
  ShareState createState() => ShareState();
}

File cameraFile;

class ShareState extends State<Share> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: Functions.sideBar(context),
      appBar: Functions.appBar("Share", Icons.add, null),
      body: ListView(
        children: <Widget>[
          shareTile("Share my Schedule", Icons.calendar_today,() => Functions.showShareDialog(context)),
          shareTile("Share my Details", Icons.person_outline,() => Functions.showShareDialog(context)),
          shareTile("Add new User", Icons.person_add, () => imageSelectorCamera()),
          shareTile("Get schedule from user", Icons.calendar_today, () => imageSelectorCamera()),

        ],
      ),
    );
  }

  imageSelectorCamera() async {
    cameraFile = await ImagePicker.pickImage(
      source: ImageSource.camera,
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