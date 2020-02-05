import 'package:date_utils/date_utils.dart';
import 'package:flutter/material.dart';

// import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_app_ihc/functions/functions.dart';
import 'package:flutter_app_ihc/calendar/eventInfo.dart';
import 'package:flutter_app_ihc/calendar/event.dart';
import 'package:intl/intl.dart';

class Calendar extends StatefulWidget {
  @override
  CalendarState createState() => CalendarState();
}

class CalendarState extends State<Calendar> with TickerProviderStateMixin {
  DateTime _selectedDay;
  Map<DateTime, List> _events;
  Map<DateTime, List> _visibleEvents;
  List _selectedEvents;
  AnimationController _controller;



  @override
  void initState() {
    super.initState();
    DateTime selDay = DateTime.parse('2019-08-27');
    _selectedDay = DateTime.now();
    _events = {
//      selDay: ['Aniversário'],
//      _selectedDay.subtract(Duration(days: 2)): ['Event A6', 'Event B6'],
//      _selectedDay.add(Duration(days: 3)): Set.from(['Event A9', 'Event A9', 'Event B9']).toList(),
      _selectedDay: [
        eventInfo(
            'IHC Presentation',
            DateFormat('dd-MM-yyyy')
                .format(DateTime.now().add(Duration(days: 0)))
                .toString(),
            '20%')
      ],
      _selectedDay.add(Duration(days: 7)): [
        eventInfo(
            'PEI MileStone',
            DateFormat('dd-MM-yyyy')
                .format(DateTime.now().add(Duration(days: 7)))
                .toString(),
            '15%')
      ],
      _selectedDay.add(Duration(days: 8)): [
        eventInfo(
            'AR exam',
            DateFormat('dd-MM-yyyy')
                .format(DateTime.now().add(Duration(days: 8)))
                .toString(),
            '25%')
      ],
    };
    _selectedEvents = _events[_selectedDay] ?? [];
    _visibleEvents = _events;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _controller.forward();
  }

  void _onDaySelected(DateTime day, List events) {
    setState(() {
      _selectedDay = day;
      _selectedEvents = events;
    });

    print('Selected day: $day');
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    setState(() {
      _visibleEvents = Map.fromEntries(
        _events.entries.where(
          (entry) =>
              entry.key.isAfter(first.subtract(const Duration(days: 1))) &&
              entry.key.isBefore(last.add(const Duration(days: 1))),
        ),
      );
    });

    print('First visible day: $first');
    print('Last visible day: $last');
    print('Current format: $format');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Functions.sideBar(context),
      appBar: Functions.appBar("CALENDAR", Icons.add, null),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          // Switch out 2 lines below to play with TableCalendar's settings
          //-----------------------
          _buildTableCalendar(),
          //_buildTableCalendarWithBuilders(),
          const SizedBox(height: 8.0),
          Expanded(child: _buildEventList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        //TODO:
        tooltip: 'Add Event',
        backgroundColor: Colors.white,
        child: Icon(Icons.add, color: Colors.blue),
        onPressed: () {
          Navigator.of(context).pushNamed("/add_event");
        },
      ),
    );
  }

  // Simple TableCalendar configuration (using Styles)
  Widget _buildTableCalendar() {
    return TableCalendar(
      locale: 'en_US',
      events: _visibleEvents,
      initialCalendarFormat: CalendarFormat.month,
      formatAnimation: FormatAnimation.slide,
      startingDayOfWeek: StartingDayOfWeek.monday,
      daysOfWeekStyle: DaysOfWeekStyle(
          weekendStyle: TextStyle(color: Colors.blue[400])),
      availableGestures: AvailableGestures.all,
      // para Meter Gesture: horizontal ou vertical
      availableCalendarFormats: const {
        CalendarFormat.month: 'Month',
        CalendarFormat.twoWeeks: '2 weeks', // para mostrar apenas 2 semanas
        CalendarFormat.week: 'Week',
      },
      calendarStyle: CalendarStyle(
        selectedColor: Colors.blue[400],
        todayColor: Colors.blue[100],
        markersColor: Colors.brown[700],
        weekendStyle: TextStyle(color: Colors.blue[400]),
        outsideWeekendStyle: TextStyle(color: Colors.blue[100]),
      ),
      headerStyle: HeaderStyle(
        formatButtonTextStyle:
            TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: Colors.blue[400],
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onDaySelected: _onDaySelected,
      onVisibleDaysChanged: _onVisibleDaysChanged,
    );
  }

  // More advanced TableCalendar configuration (using Builders & Styles)
  Widget _buildTableCalendarWithBuilders() {
    return TableCalendar(
      locale: 'pt_PT',
      events: _visibleEvents,
      initialCalendarFormat: CalendarFormat.month,
      formatAnimation: FormatAnimation.slide,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      availableGestures: AvailableGestures.all,
      availableCalendarFormats: const {
        CalendarFormat.month: '',
        CalendarFormat.week: '',
      },
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        weekendStyle: TextStyle().copyWith(color: Colors.blue[800]),
        outsideWeekendStyle:
            TextStyle().copyWith(color: Colors.blue[800].withAlpha(127)),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: TextStyle().copyWith(color: Colors.blue[600]),
      ),
      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
        formatButtonVisible: false,
      ),
      builders: CalendarBuilders(
        selectedDayBuilder: (context, date, _) {
          return FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(_controller),
            child: Container(
              margin: const EdgeInsets.all(4.0),
              padding: const EdgeInsets.only(top: 5.0, left: 6.0),
              color: Colors.blue[300],
              width: 100,
              height: 100,
              child: Text(
                '${date.day}',
                style: TextStyle()
                    .copyWith(fontSize: 16.0, color: Colors.blue[400]),
              ),
            ),
          );
        },
        todayDayBuilder: (context, date, _) {
          return Container(
            margin: const EdgeInsets.all(4.0),
            padding: const EdgeInsets.only(top: 5.0, left: 6.0),
            color: Colors.amber[400],
            width: 100,
            height: 100,
            child: Text(
              '${date.day}',
              style: TextStyle().copyWith(fontSize: 16.0),
            ),
          );
        },
        singleMarkerBuilder: (context, date, events) {
          return Positioned(
            right: 1,
            bottom: 1,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Utils.isSameDay(date, _selectedDay)
                    ? Colors.brown[400]
                    : Utils.isSameDay(date, DateTime.now())
                        ? Colors.brown[300]
                        : Colors.blue[400],
              ),
              width: 16.0,
              height: 16.0,
              child: Center(
                child: Text(
                  '${events.length}',
                  style: TextStyle().copyWith(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                ),
              ),
            ),
          );
        },
      ),
      onDaySelected: (date, events) {
        _onDaySelected(date, events);
        _controller.forward(from: 0.0);
      },
      onVisibleDaysChanged: _onVisibleDaysChanged,
    );
  }

  Widget _buildEventList() {
    return ListView(
      children: _selectedEvents
        .map((event) => Container(
          decoration: BoxDecoration(
            border: Border.all(width: 0.8),
            borderRadius: BorderRadius.circular(12.0),
          ),
          margin:
              const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: ListTile(
            title: Text(event.TITLE),
            trailing: Icon(Icons.info_outline, color: Colors.blue,),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Event(data: event),
              ),
            ),
          ),
        ))
        .toList(),
    );
  }
}
