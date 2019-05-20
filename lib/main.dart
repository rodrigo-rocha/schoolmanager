import 'package:flutter/material.dart';
import 'package:flutter_app_ihc/login/login.dart';
import 'package:flutter_app_ihc/login/forget_password.dart';
import 'package:flutter_app_ihc/login/signup.dart';
import 'package:flutter_app_ihc/users/teachers/teacher_add.dart';
import 'package:flutter_app_ihc/users/teachers/teacher_edit.dart';
import 'package:flutter_app_ihc/users/teachers/teacher_info.dart';
import 'package:flutter_app_ihc/users/teachers/teacher_list.dart';
import 'package:flutter_app_ihc/users/tab_controller.dart';
import 'package:flutter_app_ihc/menu/menu.dart';
import 'package:flutter_app_ihc/courses/course_add.dart';
import 'package:flutter_app_ihc/courses/course_edit.dart';
import 'package:flutter_app_ihc/courses/course_exams.dart';
import 'package:flutter_app_ihc/courses/courses_tab_controller.dart';
import 'package:flutter_app_ihc/courses/current/course_info.dart';
import 'package:flutter_app_ihc/courses/current/current_courses.dart';
import 'package:flutter_app_ihc/courses/finished/finished_courses.dart';
import 'package:flutter_app_ihc/courses/finished/finished_courses_info.dart';
import 'package:flutter_app_ihc/courses/finished_course_add.dart';
import 'package:flutter_app_ihc/timeline/timeline.dart';
import 'package:flutter_app_ihc/notes/notes_tab_controller.dart';
import 'package:flutter_app_ihc/calendar/calendar.dart';
import 'package:flutter_app_ihc/calendar/event.dart';
import 'package:flutter_app_ihc/settings/settings.dart';
import 'package:flutter_app_ihc/share/share.dart';
import 'package:flutter_app_ihc/share/shared_docs.dart';
import 'package:flutter_app_ihc/calendar/week_schedule.dart';
import 'package:flutter_app_ihc/chat/chat_list.dart';
import 'package:flutter_app_ihc/reports/reports.dart';

void main() {
  runApp(SchoolManager());
}

/// TODO: Add Scroll Physics to All ListViews!

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

        '/course_info': (BuildContext context) => new CourseInfo(),
        '/course_list': (BuildContext context) => new CoursesList(),
        '/course_add': (BuildContext context) => new CourseAdd(),
        '/course_edit': (BuildContext context) => new CourseEdit(),
        '/course_exams': (BuildContext context) => new CourseExams(),
        '/finished_course_info': (BuildContext context) => new FinishedCoursesInfo(),
        '/finished_course_list': (BuildContext context) => new FinishedCoursesList(),
        '/finished_course_add': (BuildContext context) => new FinishedCourseAdd(),

        '/notes_tab_controller': (BuildContext context) => new NotesTabController(),

        '/user_tab_controller': (BuildContext context) => new UserTabController(),
        '/courses_tab_controller': (BuildContext context) => new CoursesTabController(),
        '/timeline': (BuildContext context) => new Timeline(),
        '/calendar': (BuildContext context) => new Calendar(),
        '/settings': (BuildContext context) => new Settings(),
        '/event_info': (BuildContext context) => new Event(),


        '/share': (BuildContext context) => new Share(),
        '/week_schedule': (BuildContext context) => new WeekSchedule(),
        '/shared_docs': (BuildContext context) => new SharedDocs(),
        '/chat_list': (BuildContext context) => new ChatList(),
        '/reports': (BuildContext context) => new Reports(),

      },
      home: Login(),
    );
  }
}