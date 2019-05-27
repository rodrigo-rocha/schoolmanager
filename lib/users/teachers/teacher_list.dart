import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/users/teachers/teacher_info.dart';
import 'package:flutter_app_ihc/users/teachers/teacher_add.dart';

import 'package:flutter_app_ihc/classes/Teacher.dart';

List<Teacher> teachersList = [
  new Teacher("Ana Maria", "anamaria@sm.pt","4.1.13","220000001","Finances","IHC","https://timedotcom.files.wordpress.com/2018/01/stephanie-schriock-motto.jpg"),
  new Teacher("João Carlos", "jcarlos@sm.pt", "4.1.12", "220000002", "Telecomunications", "Network Fundamentals", "https://www.apple.com/leadership/jonathan-ive/meta/og.png?201708312110?201708312110"),
  new Teacher("Maria Madalena", "mariamadalena@sm.pt", "4.1.13", "220000003", "Finances", "IHC", "https://ksassets.timeincuk.net/wp/uploads/sites/46/2017/03/Priti-Patel-re-sized.jpg"),
  new Teacher("Afonso Faria", "afonso@sm.pt", "4.1.13", "220000004", "Finances", "IHC", "https://cdn.thedailymash.co.uk/wp-content/uploads/20190324205530/man-serious-2.jpg"),
  new Teacher("Claudio Marques", "cmarques@sm.pt", "4.1.13", "220000005", "Telecomunications", "Network Fundamentals", "https://cdn.thedailymash.co.uk/wp-content/uploads/20190324205212/middle-aged-man-fat-2.jpg"),
  new Teacher("Joana Silva", "joanas@sm.pt", "4.1.13","220000006", "Telecomunications", "IHC", "http://templates.scriptsbundle.com/opportunities-v3/demo/images/users/3.jpg"),
];

int t_idx;

class TeacherList extends StatefulWidget {
  @override
  TeacherListState createState() => TeacherListState();
}

class TeacherListState extends State<TeacherList> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add new teacher',
        backgroundColor: Colors.white,
        child: Icon(Icons.add, color: Colors.blue),
        onPressed: () {
          Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => new TeachersAdd()
          ));
        },
      ),
      body: new Container(
        child: new Center(
          child: ListView.builder(
            physics: ScrollPhysics(parent: BouncingScrollPhysics()),
            itemCount: teachersList.length + 1,
            itemBuilder: (context, index) {
              if (index == teachersList.length){
                return SizedBox(height: 90,);
              }
              //return _teacher(teachersList[index].name, teachersList[index].email, teachersList[index].photo);
              return Card(
                color: Colors.transparent,
                shape: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 0.5,
                    color: Colors.grey,
                  )),
                child: ListTile(
                  title: Text(teachersList[index].name, style: TextStyle(fontSize: 20)),
                  subtitle: Text(teachersList[index].email),
                  trailing: Icon(Icons.info_outline, color: Colors.blue,),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(teachersList[index].photo),
                  ),
                  onTap: () {
                    t_idx = index;
                    Navigator.push(context, new MaterialPageRoute(
                      builder: (context) => new TeacherInfo())
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