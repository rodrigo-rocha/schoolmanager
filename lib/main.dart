import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/login/login.dart';
import 'package:flutter_app_ihc/login/forget_password.dart';
import 'package:flutter_app_ihc/login/signup.dart';
import 'package:flutter_app_ihc/users/teachers/teacher_add.dart';
import 'package:flutter_app_ihc/users/teachers/teacher_edit.dart';
import 'package:flutter_app_ihc/users/teachers/teacher_info.dart';
import 'package:flutter_app_ihc/users/teachers/teacher_list.dart';
import 'package:flutter_app_ihc/users/students/student_list.dart';
import 'package:flutter_app_ihc/users/students/student_add.dart';
import 'package:flutter_app_ihc/users/students/student_edit.dart';
import 'package:flutter_app_ihc/users/students/student_info.dart';
import 'package:flutter_app_ihc/users/tab_controller.dart';
import 'package:flutter_app_ihc/menu/menu.dart';
import 'package:flutter_app_ihc/courses/course_add.dart';
import 'package:flutter_app_ihc/courses/course_edit.dart';
import 'package:flutter_app_ihc/courses/finished_course_edit.dart';
import 'package:flutter_app_ihc/courses/course_exams.dart';
import 'package:flutter_app_ihc/courses/courses_tab_controller.dart';
import 'package:flutter_app_ihc/courses/current/course_info.dart';
import 'package:flutter_app_ihc/courses/current/current_courses.dart';
import 'package:flutter_app_ihc/courses/finished/finished_courses.dart';
import 'package:flutter_app_ihc/courses/finished/finished_courses_info.dart';
import 'package:flutter_app_ihc/courses/finished_course_add.dart';
import 'package:flutter_app_ihc/timeline/timeline.dart';
import 'package:flutter_app_ihc/notes/notes_tab_controller.dart';
import 'package:flutter_app_ihc/notes/important_notes/important_note_view.dart';
import 'package:flutter_app_ihc/notes/important_notes/important_note_add.dart';
import 'package:flutter_app_ihc/notes/important_notes/important_note_edit.dart';
import 'package:flutter_app_ihc/notes/notes/note_view.dart';
import 'package:flutter_app_ihc/notes/notes/note_edit.dart';
import 'package:flutter_app_ihc/notes/notes/note_add.dart';
import 'package:flutter_app_ihc/calendar/calendar.dart';
import 'package:flutter_app_ihc/calendar/event.dart';
import 'package:flutter_app_ihc/calendar/event_add.dart';
import 'package:flutter_app_ihc/settings/settings.dart';
import 'package:flutter_app_ihc/share/share.dart';
import 'package:flutter_app_ihc/share/shared_docs.dart';
import 'package:flutter_app_ihc/calendar/week_schedule.dart';
import 'package:flutter_app_ihc/calendar/my_week_schedule.dart';
import 'package:flutter_app_ihc/calendar/add_schedule_class.dart';
import 'package:flutter_app_ihc/chat/chat_list.dart';
import 'package:flutter_app_ihc/statistics/statistics.dart';
import 'package:flutter_app_ihc/courses/comunity_documents.dart';
import 'package:flutter_app_ihc/users/generic_teacher_info.dart';
import 'package:flutter_app_ihc/courses/course_add_exam.dart';

void main() {
  runApp(SchoolManager());
}

class SchoolManager extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'Questrial',
          primarySwatch: Colors.blue
      ),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/login' : (BuildContext context) => new Login(),
        '/forget_password' : (BuildContext context) => new ForgetPassword(),
        '/signup' : (BuildContext context) => new Signup(),
        '/menu' : (BuildContext context) => new Menu(),
        '/teacher_list': (BuildContext context) => new TeacherList(),
        '/teacher_add': (BuildContext context) => new TeachersAdd(),
        '/teacher_edit': (BuildContext context) => new TeachersEdit(),
        '/teacher_info': (BuildContext context) => new TeacherInfo(),
        '/generic_teacher_info': (BuildContext context) => new GenericTeacherInfo(),

        '/student_info': (BuildContext context) => new StudentInfo(),
        '/student_list': (BuildContext context) => new StudentList(),
        '/student_add': (BuildContext context) => new StudentAdd(),
        '/student_edit': (BuildContext context) => new StudentEdit(),

        '/course_info': (BuildContext context) => new CourseInfo(),
        '/course_list': (BuildContext context) => new CoursesList(),
        '/course_add': (BuildContext context) => new CourseAdd(),
        '/course_edit': (BuildContext context) => new CourseEdit(),
        '/course_exams': (BuildContext context) => new CourseExams(),

        '/finished_course_edit': (BuildContext context) => new FinishedCourseEdit(),
        '/finished_course_info': (BuildContext context) => new FinishedCoursesInfo(),
        '/finished_course_list': (BuildContext context) => new FinishedCoursesList(),
        '/finished_course_add': (BuildContext context) => new FinishedCourseAdd(),

        '/course_details': (BuildContext context) => new CourseExams(),

        '/notes_tab_controller': (BuildContext context) => new NotesTabController(),
        '/important_note_view' : (BuildContext context) => new ImportantNoteView(),
        '/important_note_add' : (BuildContext context) => new ImportantNoteAdd(),
        '/important_note_edit' : (BuildContext context) => new ImportantNoteEdit(),
        '/note_view' : (BuildContext context) => new NoteView(),
        '/note_add' : (BuildContext context) => new NoteAdd(),
        '/note_edit' : (BuildContext context) => new NoteEdit(),

        '/user_tab_controller': (BuildContext context) => new UserTabController(),
        '/courses_tab_controller': (BuildContext context) => new CoursesTabController(),
        '/timeline': (BuildContext context) => new Timeline(),
        '/calendar': (BuildContext context) => new Calendar(),
        '/settings': (BuildContext context) => new Settings(),
        '/event_info': (BuildContext context) => new Event(),
        '/add_event' : (BuildContext context) => new EventAdd(),
        '/add_exam' : (BuildContext context) => new AddExam(),


        '/share': (BuildContext context) => new Share(),
        '/week_schedule': (BuildContext context) => new WeekSchedule(),
        '/my_week_schedule': (BuildContext context) => new MyWeekSchedule(),
        '/add_schedule_class': (BuildContext context) => new AddScheduleClass(),
        '/shared_docs': (BuildContext context) => new SharedDocs(),
        '/comunity_docs': (BuildContext context) => new ComunityDocs(),
        '/chat_list': (BuildContext context) => new ChatList(),
        '/reports': (BuildContext context) => new Reports(),

      },
      home: Login(),
    );
  }
}