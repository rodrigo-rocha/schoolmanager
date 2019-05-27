import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/users/students/student_add.dart';
import 'package:flutter_app_ihc/users/students/student_info.dart';
import 'package:flutter_app_ihc/classes/Student.dart';

List<Student> studentList = [
  new Student("Ana Silva", "anasilva@sm.pt","Eng. Computadores e Telemática","221000001","ESSUA","https://www.irishexaminer.com/remote/media.central.ie/media/images/f/FemaleCollegeStudentGeneric_large.jpg?width=648&s=ie-422608"),
  new Student("Beatriz Almeida", "beatrizalmeida@sm.pt","Eng. Computadores e Telemática","221000002","DETI","https://www.usnews.com/dims4/USNEWS/94cc770/2147483647/crop/2121x1392%2B0%2B0/resize/640x420/quality/85/?url=http%3A%2F%2Fcom-usnews-beam-media.s3.amazonaws.com%2F9b%2Fce%2Ff7132bdf4cfda64a67b06c360c7c%2F180306-womanatlaptop-stock.jpg"),
  new Student("Carlos Matias", "carlosmatias@sm.pt","Eng. Computadores e Telemática","221000003","DETI","https://i.kym-cdn.com/entries/icons/original/000/006/474/asdfsdf.jpg"),
  new Student("João Fernandes", "joaofernandes@sm.pt","Eng. Computadores e Telemática","221000004","DETI","https://www.commonapp.org/files/styles/500-500/public/component/grid/images/homegrid-1.jpg?itok=dScxumfa"),
  new Student("Mário Aguiar", "marioaguiar@sm.pt","Eng. Computadores e Telemática","221000005","ISCAA","https://getinfo.onlinedegrees.com/imagesvr_ce/325/computer-science.jpg"),
  new Student("Cláudio Matos", "cmatos@sm.pt","ESSUA","Eng. Informática","221000007","https://petersonsprod.blob.core.windows.net/static/cdn/editorial_images/Students%20Professors/happy_student4.jpg"),
  new Student("Diana Maria", "diana@sm.pt","ESSUA","Eng. Informática","221000008","https://d32ijn7u0aqfv4.cloudfront.net/wp/wp-content/uploads/raw/artstudent-woman-laptop-smartphone_SOPL18104_585709_us.jpg"),
];

int s_idx;

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
            physics: ScrollPhysics(parent: BouncingScrollPhysics()),
            itemCount: studentList.length + 1,
            itemBuilder: (context, index) {
              if (index == studentList.length){
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
                  title: Text(studentList[index].name, style: TextStyle(fontSize: 20)),
                  subtitle: Text(studentList[index].email),
                  trailing: Icon(Icons.info_outline, color: Colors.blue,),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(studentList[index].photo),
                  ),
                  onTap: () {
                    s_idx = index;
                    Navigator.push(context, new MaterialPageRoute(
                        builder: (context) => new StudentInfo()
                      )
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