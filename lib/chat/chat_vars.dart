import 'package:flutter_app_ihc/classes/Messages.dart';
import 'package:flutter_app_ihc/classes/Chat.dart';
import 'package:flutter_app_ihc/users/teachers/teacher_list.dart';
import 'package:flutter_app_ihc/users/students/student_list.dart';

class ChatVars {
  static List<Chat> chatList = [
    new Chat(teachersList[0],
      [
        Message('Hello Teacher.', '11/02/2019', 'src'),
        Message('Can we schedule a meeting anytime soon?', '11/02/2019', 'src'),
        Message('Hello! Yes, wednesday i\'m free all afternoon', '11/02/2019', 'dst'),
        Message('Can it be at 16:00?', '11/02/2019', 'src'),
        Message('Yes.', '11/02/2019', 'dst'),
        Message('I\'ll be waiting for you then', '11/02/2019', 'dst'),
        Message('Thank you!', '11/02/2019', 'src'),
        Message('No problem!', '11/02/2019', 'dst'),

      ]
    ),
    new Chat(teachersList[3],
      [
        Message('Hi. Can I see the exam this week?', '11/02/2019', 'src'),
        Message('Of course. Come by my office thursday between 15:00 and 18:00.', '11/02/2019', 'dst'),
        Message('Thank you! I\'ll see you there.', '11/02/2019', 'dst')
      ]
      ),
    new Chat(studentList[2],
      [
        Message('I\'m at room 4.2.10.', '11/02/2019', 'dst'),
        Message('On my way!', '11/02/2019', 'src'),
      ]
    )
  ];
}

