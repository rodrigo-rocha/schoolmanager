import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/functions/functions.dart';
import 'package:flutter_app_ihc/users/students/student_list.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ComunityDocs extends StatefulWidget{
  @override
  ComunityDocsState createState()=> ComunityDocsState();
}

File galleryFile;

class ComunityDocsState extends State<ComunityDocs> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: Functions.appBar("Comunity Documents", Icons.add_circle, null),
      body: ListView(
        children: <Widget>[
          _infoExams('Submit Document', traillingAction(Icons.keyboard_arrow_right, "Submit", () { imageSelectorGallery(); } )),
          buildDoc("Network 101", "Carlos Luis","https://cdn4.iconfinder.com/data/icons/file-extension-names-vol-8/512/24-512.png"),
          buildDoc("Network Architecture Manual", "Carlos Luis", "https://cdn4.iconfinder.com/data/icons/file-extension-names-vol-8/512/24-512.png"),
          buildDoc("Draft Heuristic Evaluation", "Carlos Luis", "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Microsoft_Word_2013_logo.svg/1043px-Microsoft_Word_2013_logo.svg.png"),
          buildDoc("Heuristic Evaluation Notes", "Carlos Luis", "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Microsoft_Word_2013_logo.svg/1043px-Microsoft_Word_2013_logo.svg.png"),
          buildDoc("Report IHC", "Matilde Gomes", "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Microsoft_Word_2013_logo.svg/1043px-Microsoft_Word_2013_logo.svg.png"),
          buildDoc("Report IHC Calc", "Matilde Gomes", "https://upload.wikimedia.org/wikipedia/commons/thumb/8/86/Microsoft_Excel_2013_logo.svg/1043px-Microsoft_Excel_2013_logo.svg.png"),
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

  Widget buildDoc(String name, String user, String url) {

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
          leading: CircleAvatar(
            backgroundImage: NetworkImage(url),
            backgroundColor: Colors.transparent,
          ),
          title: Text(name, style: TextStyle(fontSize: 17),),
          subtitle: Text("Submited by: $user"),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(icon: Icon(Icons.file_download, color: Colors.blue), onPressed: () => Functions.showDownloadDialog(context)),
              IconButton(icon: Icon(Icons.share, color: Colors.blue), onPressed: () => Functions.showShareDialog(context)),
            ],
          ),
        )
    );
  }
}