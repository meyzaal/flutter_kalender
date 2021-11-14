        // body: Column(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   children: [

        //     //kalender
        //     Container(
        //       // height: 150,
        //       color: Colors.blue,
        //       padding: EdgeInsets.only(bottom: 5.0),
        //       child: TableCalendar(
        //         focusedDay: kToday,
        //         firstDay: kFirstDay,
        //         lastDay: kLastDay,
        //         locale: 'id_ID',
        //         calendarFormat: _calendarFormat,
        //         selectedDayPredicate: (day) {
        //           return isSameDay(_selectedDay, day);
        //         },
        //         onDaySelected: _onDaySelected,
        //         calendarStyle: CalendarStyle(
        //           defaultTextStyle: TextStyle(
        //             color: Colors.white,
        //             fontSize: 18.0,
        //             fontWeight: FontWeight.w600,
        //           ),
        //           holidayTextStyle: TextStyle(
        //             color: Colors.white,
        //             fontSize: 18.0,
        //             fontWeight: FontWeight.w600,
        //           ),
        //           weekendTextStyle: TextStyle(
        //             color: Colors.white,
        //             fontSize: 18.0,
        //             fontWeight: FontWeight.w600,
        //           ),
        //           // todayTextStyle: TextStyle(color: Colors.white),
        //           todayDecoration: BoxDecoration(
        //             // color: Colors.lightBlueAccent,
        //             border: Border.all(color: Colors.white),
        //             shape: BoxShape.circle,
        //           ),
        //           selectedDecoration:
        //               BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        //           selectedTextStyle: TextStyle(color: Colors.blue),
        //           // outsideTextStyle: TextStyle(color: Colors.white),
        //         ),
        //         headerStyle: HeaderStyle(
        //           titleCentered: true,
        //           // formatButtonShowsNext: false,
        //           formatButtonVisible: false,
        //           leftChevronVisible: false,
        //           rightChevronVisible: false,
        //           // leftChevronIcon: Icon(
        //           //   Icons.chevron_left_rounded,
        //           //   color: Colors.white,
        //           // ),
        //           // rightChevronIcon:
        //           //     Icon(Icons.chevron_right_rounded, color: Colors.white),
        //           titleTextStyle: TextStyle(
        //             color: Colors.white,
        //             fontSize: 18.0,
        //           ),
        //         ),
        //         daysOfWeekStyle: DaysOfWeekStyle(
        //           weekdayStyle: TextStyle(
        //               color: Colors.white,
        //               fontSize: 16.0,
        //               fontWeight: FontWeight.w300),
        //           weekendStyle: TextStyle(
        //               color: Colors.white,
        //               fontSize: 16.0,
        //               fontWeight: FontWeight.w300),
        //         ),
        //         onFormatChanged: (format) {
        //           if (_calendarFormat != format) {
        //             // Call `setState()` when updating calendar format
        //             setState(() {
        //               _calendarFormat = format;
        //             });
        //           }
        //         },
        //         // calendarBuilders: CalendarBuilders(headerTitleBuilder: headtit),
        //       ),
        //     ),

        //     DefaultTabController(
        //       length: 2,
        //       child: Expanded(
        //         child: Container(
        //           // color: Colors.white,
        //           // height: MediaQuery.of(context).size.height,
        //           // width: MediaQuery.of(context).size.width,
        //           padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
        //           decoration: const BoxDecoration(
        //             color: Colors.white,
        //             borderRadius: BorderRadius.only(
        //               topLeft: Radius.circular(30.0),
        //               topRight: Radius.circular(30.0),
        //             ),
        //           ),
        //           child: Column(
        //             mainAxisAlignment: MainAxisAlignment.start,
        //             // crossAxisAlignment: CrossAxisAlignment.start,
        //             children: <Widget>[

        //               Padding(
        //                 padding: const EdgeInsets.symmetric(horizontal: 10.0),
        //                 child: Column(
        //                   children: <Widget>[

        //                     const Text(
        //                       'Agenda Saya',
        //                       style: TextStyle(
        //                           fontSize: 16, fontWeight: FontWeight.w500),
        //                     ),
                            
        //                     const SizedBox(height: 5.0,),
            
        //                     //TabBar Harian/Bulanan
        //                     Container(
        //                       height: 40,
        //                       width: 200,
        //                       decoration: BoxDecoration(
        //                         color: Colors.grey.shade400,
        //                         borderRadius: BorderRadiusDirectional.circular(100),
        //                       ),
        //                       child: TabBar(
        //                           indicator: BoxDecoration(
        //                             color: Colors.blueAccent,
        //                             borderRadius: BorderRadius.circular(100),
        //                           ),
        //                           tabs: const [
        //                             Tab(text: 'Hari Ini'),
        //                             Tab(text: 'Bulan Ini')
        //                           ]),
        //                     )

        //                   ],
        //                 ),
        //               ),

        //               SizedBox(height: 20.0),

        //               SizedBox(
        //                 height: 300,
        //                 child: TabBarView(
        //                   children: [

        //                     Padding(
        //                       padding: const EdgeInsets.all(8.0),
        //                       child: Expanded(
        //                         child: Column(
        //                           children: [
        //                             Row(
        //                               children: [
        //                                 const Padding(
        //                                   padding: EdgeInsets.only(right: 8.0),
        //                                   child: Text(
        //                                     "Hari ini",
        //                                     style: TextStyle(fontSize: 16.0),
        //                                   ),
        //                                 ),
        //                                 // SizedBox(
        //                                 //   width: 20.0,
        //                                 // ),
        //                                 Expanded(
        //                                   child: Container(
        //                                     color: Colors.black26,
        //                                     height: 1.0,
        //                                     // width: MediaQuery.of(context).size.width,
        //                                   ),
        //                                 ),
        //                               ],
        //                             ),
                              
        //                             ListView.builder(
        //                               shrinkWrap: true,
        //                               itemCount: documentmodel.length,
        //                               itemBuilder: (context, index) {
        //                                 DocumentModel document = documentmodel[index];
        //                                 return InkWell(
        //                                   child: Card(
        //                                     child: Text(document.judul),
        //                                   ),
        //                                 );
        //                               }
        //                             ),
        //                           ],
        //                         ),
        //                       ),
        //                     ),

        //                     // thisMonth(),
        //                     Text("month"),
        //                   ],
        //                 ),
        //               ),

        //             ],
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),