import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:toggle_switch/toggle_switch.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(Kalender()));
}

class Kalender extends StatelessWidget {
  const Kalender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
                // Icons.chevron_left_rounded,
                CupertinoIcons.chevron_left),
            // iconSize: 24.0,
            onPressed: () {},
          ),
          title: Text("Kalender"),
          elevation: 0.0,
          backgroundColor: Colors.blue,
          actions: <Widget>[
            IconButton(
              icon: Icon(CupertinoIcons.ellipsis_vertical),
              // iconSize: 30.0,
              onPressed: () {},
            ),
          ],
        ),
        body: Body(),
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

class _BodyState extends State<Body> {
  bool _switchValue = false;
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

    return DefaultTabController(
      length: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
    
          Container(
            // height: 150,
            color: Colors.blue,
            padding: EdgeInsets.only(bottom: 5.0),
            child: TableCalendar(
              focusedDay: kToday,
              firstDay: kFirstDay,
              lastDay: kLastDay,
              locale: 'id_ID',
              calendarFormat: CalendarFormat.week,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: _onDaySelected,
              calendarStyle: CalendarStyle(

                defaultTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),

                holidayTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),

                weekendTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),

                // todayTextStyle: TextStyle(color: Colors.white),
                todayDecoration: BoxDecoration(
                  color: Colors.blue[900],
                  // border: Border.all(color: Colors.white),
                  shape: BoxShape.circle,
                ),

                selectedDecoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle
                ),
                
                selectedTextStyle: TextStyle(color: Colors.blue),

              ),
              headerStyle: const HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
                leftChevronVisible: false,
                rightChevronVisible: false,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
              daysOfWeekStyle: const DaysOfWeekStyle(
                weekdayStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w300),
                weekendStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
    
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
    
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: <Widget>[
                        const Text(
                          'Agenda Saya',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),

                        //TabBar Harian/Bulanan
                        Container(
                          height: 40,
                          width: 180,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadiusDirectional.circular(100),
                          ),
                          child: TabBar(
                            indicator: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            tabs: [
                              Tab(text: 'Hari Ini'),
                              Tab(text: 'Bulan Ini')
                            ]
                          ),
                        )
                        
                      ],
                    ),
                  ),
    
                  SizedBox(height: 20.0),

                  SizedBox(
                    height: 300,
                    child: TabBarView(
                      children: [
                        thisDay(),
                        thisMonth(),
                      ]
                    ),
                  ),
    
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class thisMonth extends StatelessWidget {
  const thisMonth({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 70.0,
                // color: Colors.amber,
                child: const Text(
                  "Bulan ini",
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              // SizedBox(
              //   width: 20.0,
              // ),
              Expanded(
                child: Container(
                  color: Colors.black26,
                  height: 1.0,
                  // width: MediaQuery.of(context).size.width,
                ),
              ),

            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w300),
              weekendStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w300),
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

            ],

          ),
        ),

        SizedBox(height: 10.0),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    border: Border.all(color: Colors.black26)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.blue),
                      child: const Icon(
                        Icons.quiz_outlined,
                        color: Colors.white,
                        size: 30.0,
                        // color: Colors.blue,
                      ),

                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            "Collection",
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(height: 5.0),
                          const Text(
                            "Quiz 1",
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 5.0),
                          Row(
                            children: const <Widget>[
                              Icon(
                                Icons.access_time,
                                size: 20.0,
                              ),
                              SizedBox(width: 5.0),
                              Text(
                                "09:00 WIB",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        ],

                      ),
                    ),
                    SizedBox(width: 5.0),
                    const Icon(
                      Icons.check_circle_outline_rounded,
                      color: Colors.lightGreen,
                      size: 30.0,
                    ),
                  ],
                ),

              ),
            ],
          ),
        ),
      ],
    );
  }
}

class thisDay extends StatelessWidget {
  const thisDay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 70.0,
                // color: Colors.amber,
                child: const Text(
                  "Hari ini",
                  style: TextStyle(fontSize: 16.0),

                ),
              ),
              // SizedBox(
              //   width: 20.0,
              // ),
              Expanded(
                child: Container(
                  color: Colors.black26,
                  height: 1.0,
                  // width: MediaQuery.of(context).size.width,
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 10.0),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    border: Border.all(color: Colors.black26)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.blue),
                      child: const Icon(
                        Icons.quiz_outlined,
                        color: Colors.white,
                        size: 30.0,
                        // color: Colors.blue,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            "Collection",
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(height: 5.0),
                          const Text(
                            "Quiz 1",
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 5.0),
                          Row(
                            children: const <Widget>[
                              Icon(
                                Icons.access_time,
                                size: 20.0,
                              ),
                              SizedBox(width: 5.0),
                              Text(
                                "09:00 WIB",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 5.0),
                    const Icon(
                      Icons.check_circle_outline_rounded,
                      color: Colors.lightGreen,
                      size: 30.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
