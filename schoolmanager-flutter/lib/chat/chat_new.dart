import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/functions/functions.dart';

import 'package:flutter_app_ihc/users/teachers/teacher_list.dart';
import 'package:flutter_app_ihc/users/students/student_list.dart';
import 'package:flutter_app_ihc/classes/Chat.dart';
import 'package:flutter_app_ihc/classes/Messages.dart';
import 'package:flutter_app_ihc/chat/chat_messages.dart';

import 'package:flutter_app_ihc/chat/chat_vars.dart';
int chat_idx;

List users = teachersList;

//TODO: NOT DONE!!!

class ChatNew extends StatefulWidget {

  @override
  ChatNewState createState() => ChatNewState();
}

class ChatNewState extends State<ChatNew> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.white,
        onPressed: () => print(""),
        icon: Icon(Icons.add, color: Colors.blue),
        label: Text("New Chat", style: TextStyle(fontSize: 15, color: Colors.blue),),
      ),
      appBar: Functions.appBar("Messages", null, null),
      body: new Container(
        child: new Center(
          child: ListView.builder(
              itemCount: ChatVars.chatList.length,
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
                      title: Text(ChatVars.chatList[index].person.name, style: TextStyle(fontSize: 20)),
                      subtitle: Text('- ${ChatVars.chatList[index].messages[ChatVars.chatList[index].messages.length-1].message}', maxLines: 1, overflow: TextOverflow.ellipsis,),
                      trailing: Icon(Icons.info_outline, color: Colors.blue,),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(ChatVars.chatList[index].person.photo),
                      ),
                      onTap: () {
                        chat_idx = index;
                        Navigator.push(context, new MaterialPageRoute(
                            builder: (context) => new ChatMessage())
                        );
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