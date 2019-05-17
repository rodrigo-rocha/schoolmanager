import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/users/students/student_add.dart';
import 'package:flutter_app_ihc/users/students/student_info.dart';
import 'package:flutter_app_ihc/classes/Student.dart';

List<Student> studentList = [
  new Student("Ana Silva", "anasilva@sm.pt","Eng. Computadores e Telemática","221000001","ESSUA","https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Missing_avatar.svg/1024px-Missing_avatar.svg.png"),
  new Student("Beatriz Almeida", "beatrizalmeida@sm.pt","Eng. Computadores e Telemática","221000002","DETI","https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Missing_avatar.svg/1024px-Missing_avatar.svg.png"),
  new Student("Carlos Matias", "carlosmatias@sm.pt","Eng. Computadores e Telemática","221000003","DETI","https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Missing_avatar.svg/1024px-Missing_avatar.svg.png"),
  new Student("João Fernandes", "joaofernandes@sm.pt","Eng. Computadores e Telemática","221000004","DETI","https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Missing_avatar.svg/1024px-Missing_avatar.svg.png"),
  new Student("Mário Aguiar", "marioaguiar@sm.pt","Eng. Computadores e Telemática","221000005","ISCAA","https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Missing_avatar.svg/1024px-Missing_avatar.svg.png"),
  new Student("Pedro André", "pedro@sm.pt","ISCAA","Eng. Informática","221000006","https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Missing_avatar.svg/1024px-Missing_avatar.svg.png"),
  new Student("Cláudio Matos", "cmatos@sm.pt","ESSUA","Eng. Informática","221000007","https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Missing_avatar.svg/1024px-Missing_avatar.svg.png"),
  new Student("Diana Maria", "diana@sm.pt","ESSUA","Eng. Informática","221000008","https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Missing_avatar.svg/1024px-Missing_avatar.svg.png"),
];

int t_idx;

class StudentList extends StatefulWidget {
  @override
  StudentListState createState() => StudentListState();
}

class StudentListState extends State<StudentList> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add new student',
        backgroundColor: Colors.white,
        child: Icon(Icons.add, color: Colors.blue),
        onPressed: () {
          Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => new StudentAdd()
              ));
        },
      ),
      body: new Container(
        child: new Center(
          child: ListView.builder(
              itemCount: studentList.length,
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
                      title: Text(studentList[index].name, style: TextStyle(fontSize: 20)),
                      subtitle: Text(studentList[index].email),
                      trailing: Icon(Icons.info_outline, color: Colors.blue,),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(studentList[index].photo),
                      ),
                      onTap: () {
                        t_idx = index;
                        Navigator.push(context, new MaterialPageRoute(
                            builder: (context) => new StudentInfo())
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