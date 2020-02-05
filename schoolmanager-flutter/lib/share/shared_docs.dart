import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/functions/functions.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class SharedDocs extends StatefulWidget{
  @override
  SharedDocsState createState()=> SharedDocsState();
}

File galleryFile;

class SharedDocsState extends State<SharedDocs> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: Functions.appBar("Shared Documents", Icons.add_circle, null),
      body: ListView(
        children: <Widget>[
          _infoExams('Submit Document', traillingAction(Icons.keyboard_arrow_right, "Submit", () { imageSelectorGallery(); } )),
          buildDocInfo("PDF", 'https://cdn4.iconfinder.com/data/icons/file-extension-names-vol-8/512/24-512.png'),
          buildDoc("Network 101"),
          buildDoc("Network Architecture Manual"),
          buildDocInfo("Word", 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Microsoft_Word_2013_logo.svg/1043px-Microsoft_Word_2013_logo.svg.png'),
          buildDoc("Draft Heuristic Evaluation"),
          buildDoc("Heuristic Evaluation Notes"),
          buildDoc("Report IHC"),
          buildDocInfo("Excel", 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/86/Microsoft_Excel_2013_logo.svg/1043px-Microsoft_Excel_2013_logo.svg.png'),
          buildDoc("Report IHC Calc"),
          buildDoc("Evaluation"),
          buildDocInfo("Powerpoint", 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Microsoft_PowerPoint_2013_logo.svg/1043px-Microsoft_PowerPoint_2013_logo.svg.png'),
          buildDoc("Heuristic Evaluation Presentation"),
          buildDocInfo("Draw.io", 'https://yt3.ggpht.com/a/AGF-l78fkfku8iONid0H6dHhsozkWjNA_X0MV5Uiog=s900-mo-c-c0xffffffff-rj-k-no'),
          buildDoc("AR Project Architecture"),
          buildDoc("AR Project IPv4"),
          buildDoc("AR Project Equipments"),

        ],
      ),


    );
  }

  imageSelectorGallery() async {
    galleryFile = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
  }

  Widget _infoExams(String name, Widget traillingAction) {
    return Card(
      color: Colors.transparent,
      child: ListTile(
        title: Text(name),
        trailing: traillingAction,
      ),
      elevation: 0.0,
    );
  }

  Widget traillingAction(IconData icon, String text, actions()) {
    return GestureDetector(
      child: Container(
        width: 130,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Icon(icon, color: Colors.blue,),
              SizedBox(height: 2,),
              Text(text, style: TextStyle(color: Colors.blue),),
            ]
        ),
      ),
      onTap: () {
        actions();
      },
    );
  }

  Widget buildDocInfo(String name, String url) {

    return Card(
      elevation: 0.0,
      color: Colors.grey[100],
      shape: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,

        ),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(url),
          backgroundColor: Colors.transparent,
        ),
        title: Text(name, style: TextStyle(fontSize: 20)),
      ),
    );
  }

  Widget buildDoc(String name) {

    return Card(
      elevation: 0.0,
      color: Colors.transparent,
      shape: UnderlineInputBorder(
        borderSide: BorderSide(
          width: 0.5,
          color: Colors.grey
        )
      ),
      child: ListTile(
        title: Text(name, style: TextStyle(fontSize: 17),),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(icon: Icon(Icons.file_download, color: Colors.blue), onPressed: () => Functions.showDownloadDialog(context)),
            IconButton(icon: Icon(Icons.share, color: Colors.blue), onPressed: () => Functions.showShareDialog(context)),
            IconButton(icon: Icon(Icons.delete, color: Colors.red[400]), onPressed: null), //TODO: Dialogue for deleting
          ],
        ),
      )
    );
  }
}