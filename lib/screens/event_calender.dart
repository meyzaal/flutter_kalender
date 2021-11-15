import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_event_calendar/models/event_model_local.dart';
// import 'package:flutter_event_calendar/models/event_model.dart';
import 'package:table_calendar/table_calendar.dart';

class EventCalender extends StatefulWidget {
  const EventCalender({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<EventCalender> createState() => _EventCalenderState();
}

  final kToday = DateTime.now();
  final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
  final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

class _EventCalenderState extends State<EventCalender> {

  // List<DocumentModel> documentmodel = [];
  // DocumentRepository repository = DocumentRepository();

  // getData() async {
  //   documentmodel = await repository.getData();
  //   setState(() {});
  // }

  // @override
  // void initState() {
  //   getData();
  //   super.initState();
  // }

  // Future<Null> _refresh() {
  //   return getData().then((_documentmodel) {
  //     setState(() => documentmodel = _documentmodel);
  //   });
  // }

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
    return Scaffold(

        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
                CupertinoIcons.chevron_left),
            // iconSize: 24.0,
            onPressed: () {},
          ),
          title: const Text("Kalender"),
          elevation: 0.0,
          backgroundColor: Colors.blue,
          actions: <Widget>[
            IconButton(
              icon: const Icon(CupertinoIcons.ellipsis_vertical),
              // iconSize: 30.0,
              onPressed: () {},
            ),
          ],
        ),

        body: Container(
          decoration: const BoxDecoration(
            color: Colors.blue,
          ),
          child: Column(
            children: [

              //kalender
              Container(
                // width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  // color: Colors.green,
                  // color: Colors.blue,
                ),
                child: Column(
                  children: [
                    TableCalendar(
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
                    ),
                  ],
                ),
              ),

              DefaultTabController(
                length: 2,
                child: Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      // color: Colors.blue,
                      // color: Colors.pink,
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                    child: Column(
                      children: [
                          
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                              // color: Colors.amber,
                            ),
                            child: Center(
                              child: const Text(
                                'Agenda Saya',
                                style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                          ),
                        ),
                          
                        //TabBar
                        Container(
                          height: MediaQuery.of(context).size.height*0.06,
                          width: MediaQuery.of(context).size.width/2,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadiusDirectional.circular(100),
                          ),
                          child: TabBar(
                            indicator: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            tabs: const [
                              Tab(text: 'Hari Ini'),
                              Tab(text: 'Bulan Ini')
                            ]
                          ),
                        ),

                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              // height: MediaQuery.of(context).size.height,
                              decoration: const BoxDecoration(
                                // color: Colors.yellow
                              ),
                              child: TabBarView(
                                children: [

                                  Container(
                                    decoration: BoxDecoration(
                                      // color: Colors.teal,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text('Hari Ini'),
                                            SizedBox(width: 8.0),
                                            Expanded(
                                              child: Container(
                                                color: Colors.black26,
                                                height: 1.0,
                                                // width: MediaQuery.of(context).size.width,
                                              ),
                                            ),
                                          ],
                                        ),
                                        // Expanded(
                                        //   child: Container(
                                        //     width: MediaQuery.of(context).size.width,
                                        //     decoration: BoxDecoration(
                                        //       color: Colors.red,
                                        //     ),
                                        //     child: Text('Ini list')
                                        //   ),
                                        // ),

                                        Expanded(
                                          child: Container(
                                            width: MediaQuery.of(context).size.width,
                                            decoration: BoxDecoration(
                                              // color: Colors.red,
                                            ),
                                            child: ListView.builder(
                                              itemCount: documentmodel.length,
                                              itemBuilder: (context, index) {
                                                DocumentModel document = documentmodel[index];
                                                return InkWell(
                                                    child: Card(
                                                      shape: const RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Row(
                                                          children: [
                                        
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
                                        
                                                            Container(
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                        
                                                                  Text(
                                                                    document.judul,
                                                                    style: const TextStyle(
                                                                      fontSize: 16.0, 
                                                                      fontWeight: FontWeight.w300
                                                                    ),
                                                                  ),
                                        
                                                                  Text(
                                                                    document.deskripsi,
                                                                    style: const TextStyle(
                                                                      fontSize: 18.0, 
                                                                      fontWeight: FontWeight.w500
                                                                    ),
                                                                  ),
                                        
                                                                  Row(
                                                                    children: const [
                                                                      Icon(
                                                                        Icons.access_time,
                                                                        size: 20.0,
                                                                      ),
                                                                      Text(
                                                                        'jam 9',
                                                                        style: TextStyle(
                                                                          fontSize: 14.0,
                                                                          fontWeight: FontWeight.w300
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                        
                                                                ],
                                                              ),
                                                            ),
                                        
                                                            SizedBox(width: MediaQuery.of(context).size.width/3),
                                                            
                                                            const Icon(
                                                              Icons.check_circle_outline_rounded,
                                                              color: Colors.lightGreen,
                                                              size: 30.0,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    onTap: () {},
                                                );
                                              }
                                            ),
                                          ),
                                        ),
                                        
                                      ],
                                    )
                                  ),
                                  
                                  Container(
                                    decoration: BoxDecoration(
                                      // color: Colors.teal,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text('Bulan Ini'),
                                            SizedBox(width: 8.0),
                                            Expanded(
                                              child: Container(
                                                color: Colors.black26,
                                                height: 1.0,
                                                // width: MediaQuery.of(context).size.width,
                                              ),
                                            ),
                                          ],
                                        ),
                                        // Expanded(
                                        //   child: Container(
                                        //     width: MediaQuery.of(context).size.width,
                                        //     decoration: BoxDecoration(
                                        //       color: Colors.red,
                                        //     ),
                                        //     child: Text('Ini list')
                                        //   ),
                                        // ),

                                        Expanded(
                                          child: Container(
                                            width: MediaQuery.of(context).size.width,
                                            decoration: BoxDecoration(
                                              // color: Colors.red,
                                            ),
                                            child: ListView.builder(
                                              itemCount: documentmodel.length,
                                              itemBuilder: (context, index) {
                                                DocumentModel document = documentmodel[index];
                                                return InkWell(
                                                    child: Card(
                                                      shape: const RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Row(
                                                          children: [
                                        
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
                                        
                                                            Container(
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                        
                                                                  Text(
                                                                    document.judul,
                                                                    style: const TextStyle(
                                                                      fontSize: 16.0, 
                                                                      fontWeight: FontWeight.w300
                                                                    ),
                                                                  ),
                                        
                                                                  Text(
                                                                    document.deskripsi,
                                                                    style: const TextStyle(
                                                                      fontSize: 18.0, 
                                                                      fontWeight: FontWeight.w500
                                                                    ),
                                                                  ),
                                        
                                                                  Row(
                                                                    children: const [
                                                                      Icon(
                                                                        Icons.access_time,
                                                                        size: 20.0,
                                                                      ),
                                                                      Text(
                                                                        'jam 9',
                                                                        style: TextStyle(
                                                                          fontSize: 14.0,
                                                                          fontWeight: FontWeight.w300
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                        
                                                                ],
                                                              ),
                                                            ),
                                        
                                                            SizedBox(width: MediaQuery.of(context).size.width/3),
                                                            
                                                            const Icon(
                                                              Icons.check_circle_outline_rounded,
                                                              color: Colors.lightGreen,
                                                              size: 30.0,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    onTap: () {},
                                                );
                                              }
                                            ),
                                          ),
                                        ),
                                        
                                      ],
                                    )
                                  ),

                                ]
                              ),
                              // child: Text('tes'),
                            ),
                          ),
                        ),
                
                        // Expanded(
                        //   child: Container(
                        //     // height: MediaQuery.of(context).size.height,
                        //     decoration: BoxDecoration(
                        //       color: Colors.yellow
                        //     ),
                        //     child: Text('tes'),
                        //   ),
                        // )
                          
                      ],
                    ),
                  ),
                ),
              ),

                    // Expanded(
                    //   child: ListView.builder(
                    //     itemCount: documentmodel.length,
                    //     itemBuilder: (context, index) {
                    //       DocumentModel document = documentmodel[index];
                    //       return InkWell(
                    //         child: Card(
                    //           child: Row(
                    //             children: [
                    //               Container(
                    //                 child: Icon(Icons.ac_unit),
                    //               ),
                    //               Container(
                    //                 child: Column(
                    //                   children: [
                    //                     Text(document.judul),
                    //                     Text(document.deskripsi),
                    //                     Text('jam 9'),
                    //                   ],
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //         onTap: () {},
                    //       );
                    //     }
                    //   ),
                    // ),
            ],
          ),
        ),

    );
  }
}