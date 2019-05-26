import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/functions/functions.dart';

import 'package:flutter_app_ihc/users/teachers/teacher_list.dart';
import 'package:flutter_app_ihc/users/teachers/teacher_info.dart';
//import 'package:flutter_app_ihc/users/students/student_list.dart';

import 'package:flutter_app_ihc/chat/chat_list.dart';
import 'package:flutter_app_ihc/chat/chat_vars.dart';

ScrollController endController = new ScrollController();

class ChatMessage extends StatefulWidget {

  @override
  ChatMessageState createState() => ChatMessageState();
}

class ChatMessageState extends State<ChatMessage> {

  @override
  Widget build(BuildContext context) {
    Timer(Duration(milliseconds: 1500), () => endController.jumpTo(endController.position.maxScrollExtent));

    // TODO: implement build
    return Scaffold(
      /*bottomSheet: Container(
        margin: EdgeInsets.only(bottom: 0.0, right: 10.0, left: 10.0),
        child: Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                decoration: new InputDecoration.collapsed(
                    hintText: "send message"),
              ),
            ),
            new Container(
              child: new IconButton(
                  icon: new Icon(Icons.send, color: Colors.blue,),
                  onPressed: () {}),
            ),
          ],
        ),
      ), */
      floatingActionButton: FloatingActionButton(onPressed: () => _showMailDialogue(), child: Icon(Icons.add)),
      drawer: Functions.sideBar(context),
      appBar: Functions.appBar("Messages", Icons.add,null),
        body: new ListView.builder
          (
            physics: ScrollPhysics(parent: BouncingScrollPhysics()),
            itemCount: ChatVars.chatList[chat_idx].messages.length,
            controller: endController,
            itemBuilder: (BuildContext ctxt, int index) {
              if(index == 0) {
                if(ChatVars.chatList[chat_idx].messages[index].dstOrSrc == 'dst') {
                  return new Column(
                    children: <Widget>[
                      Card(
                        shape: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                          )
                        ),
                        elevation: 0.0,
                        color: Colors.transparent,
                        child: ListTile(
                          title: Text(
                            'Messages with ${ChatVars.chatList[chat_idx].person.name}',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.only(right: 5, left: 90),
                        elevation: 0.0,
                        color: Colors.transparent,
                        child: ListTile(
                          title: Text(ChatVars.chatList[chat_idx].messages[index].message),
                          leading: GestureDetector(
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(ChatVars.chatList[chat_idx].person.photo),
                            ),
                            onTap: () {
                              for(int x = 0; x < teachersList.length; x++) {
                                if(teachersList[x].name == ChatVars.chatList[chat_idx].person.name) {
                                  print(x);
                                }
                              }
                            },
                          ),
                          subtitle: Text(ChatVars.chatList[chat_idx].messages[index].date)
                        ),
                      ),
                    ],
                  );
                } else {
                  return new Column(
                    children: <Widget>[
                      Card(
                        shape: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                            )
                        ),
                        elevation: 0.0,
                        color: Colors.transparent,
                        child: ListTile(
                          title: Text(
                            'Messages with ${ChatVars.chatList[chat_idx].person.name}',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.only(left: 5, right: 90),
                        elevation: 0.0,
                        color: Colors.transparent,
                        child: ListTile(
                          title: Text(ChatVars.chatList[chat_idx].messages[index].message),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage('https://scontent.fopo1-1.fna.fbcdn.net/v/t1.0-0/q92/p552x414/60102269_2282243121834812_8402665685657845760_n.jpg?_nc_cat=103&_nc_ht=scontent.fopo1-1.fna&oh=22fe4a787322d9c2c7e28ddb92c6a969&oe=5D6D22A9'),
                          ),
                          subtitle: Text(ChatVars.chatList[chat_idx].messages[index].date),
                        ),
                      ),
                    ],
                  );
                }
              } else {
                if(ChatVars.chatList[chat_idx].messages[index].dstOrSrc == 'dst') {
                  return new Card(
                    shape: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 0.1,
                        )
                    ),
                    margin: EdgeInsets.only(right: 5, left: 90),
                    elevation: 0.0,
                    color: Colors.transparent,
                    child: ListTile(
                      title: Text(ChatVars.chatList[chat_idx].messages[index].message),
                      leading: GestureDetector(
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(ChatVars.chatList[chat_idx].person.photo),
                        ),
                        onTap: () {
                          for(int x = 0; x < teachersList.length; x++) {
                            if(teachersList[x].name == ChatVars.chatList[chat_idx].person.name) {
                              t_idx = x;
                              Navigator.push(context, new MaterialPageRoute(
                                  builder: (context) => new TeacherInfo())
                              );
                            }
                          }
                        },
                      ),
                      subtitle: Text(ChatVars.chatList[chat_idx].messages[index].date),
                    ),
                  );
                } else {
                  return new Card(
                    shape: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 0.1,
                        )
                    ),
                    margin: EdgeInsets.only(left: 5, right: 90),
                    elevation: 0.0,
                    color: Colors.transparent,
                    child: ListTile(
                      title: Text(ChatVars.chatList[chat_idx].messages[index].message),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage('https://scontent.fopo1-1.fna.fbcdn.net/v/t1.0-0/q92/p552x414/60102269_2282243121834812_8402665685657845760_n.jpg?_nc_cat=103&_nc_ht=scontent.fopo1-1.fna&oh=22fe4a787322d9c2c7e28ddb92c6a969&oe=5D6D22A9'),
                      ),
                      subtitle: Text(ChatVars.chatList[chat_idx].messages[index].date),
                    ),
                  );
                }

              }
            }
        )
    );
  }


  void _showMailDialogue() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content:
            TextField(
              //controller: msgCont,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "Message",
              ),
            ),
          //new Text("Are you sure you want to delete ${teachersList[t_idx].name}?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close", style: TextStyle(fontSize: 17)),
              onPressed: () {
                //teachersList.removeAt(t_idx);
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Send", style: TextStyle(color: Colors.green, fontSize: 17)),
              onPressed: () {
                Navigator.of(context).pop();
                //confirmationEmail();
              },
            ),
          ],
        );
      },
    );
  }

  Widget msgBox() {
    return new Container(
      margin: EdgeInsets.only(bottom: 20.0, right: 10.0, left: 10.0),
      child: Row(
        children: <Widget>[
          new Flexible(
            child: new TextField(
              decoration: new InputDecoration.collapsed(
                  hintText: "send message"),
            ),
          ),
          new Container(
            child: new IconButton(
                icon: new Icon(Icons.send, color: Colors.blue,),
                onPressed: () {}),
          ),
        ],
      ),
    );
  }
}