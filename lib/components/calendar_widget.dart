import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

class _CalendarState extends State<Calendar> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        print(_selectedDay);
        // print();
        // _rangeStart = null; // Important to clean those
        // _rangeEnd = null;
        // _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      // _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 150,
      color: Colors.blue,
      padding: EdgeInsets.only(bottom: 5.0),
      child: TableCalendar(
        focusedDay: kToday,
        firstDay: kFirstDay,
        lastDay: kLastDay,
        locale: 'id_ID',
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: _onDaySelected,
        calendarStyle: CalendarStyle(
          defaultTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
          holidayTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
          weekendTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
          // todayTextStyle: TextStyle(color: Colors.white),
          todayDecoration: BoxDecoration(
            // color: Colors.lightBlueAccent,
            border: Border.all(color: Colors.white),
            shape: BoxShape.circle,
          ),
          selectedDecoration:
              BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          selectedTextStyle: TextStyle(color: Colors.blue),
          // outsideTextStyle: TextStyle(color: Colors.white),
        ),
        headerStyle: HeaderStyle(
          titleCentered: true,
          // formatButtonShowsNext: false,
          formatButtonVisible: false,
          leftChevronVisible: false,
          rightChevronVisible: false,
          // leftChevronIcon: Icon(
          //   Icons.chevron_left_rounded,
          //   color: Colors.white,
          // ),
          // rightChevronIcon:
          //     Icon(Icons.chevron_right_rounded, color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: TextStyle(
              color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w300),
          weekendStyle: TextStyle(
              color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w300),
        ),
        onFormatChanged: (format) {
          if (_calendarFormat != format) {
            // Call `setState()` when updating calendar format
            setState(() {
              _calendarFormat = format;
            });
          }
        },
        // calendarBuilders: CalendarBuilders(headerTitleBuilder: headtit),
      ),
    );
  }
}
