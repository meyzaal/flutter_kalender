import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_event_calendar/components/calendar_widget.dart';
import 'package:flutter_event_calendar/models/event_model_local.dart';
// import 'package:flutter_event_calendar/models/event_model.dart';
import 'package:table_calendar/table_calendar.dart';

class EventCalendar extends StatefulWidget {
  const EventCalendar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<EventCalendar> createState() => _EventCalendarState();
}

class _EventCalendarState extends State<EventCalendar> {
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

  // _selectedEvents.value = _getEventsForDay(selectedDay);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CupertinoIcons.chevron_left),
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
      body: DefaultTabController(
        length: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Calendar(),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  // color: Colors.white,
                ),
                child: Column(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          'Agenda Saya',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),

                        //TabBar Harian/Bulanan
                        Container(
                          // padding: EdgeInsets.all(5.0),
                          // height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadiusDirectional.circular(100),
                          ),
                          child: TabBar(
                              indicator: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              tabs: [
                                Tab(text: 'Hari Ini'),
                                Tab(text: 'Bulan Ini')
                              ]),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Expanded(
                      child: Container(
                        // height: MediaQuery.of(context).size.height,
                        // color: Colors.amber,
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        // color: Colors.blue,
                        // height: 300,
                        child: TabBarView(
                          children: [
                            Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Hari ini",
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    Expanded(
                                      child: Container(
                                        color: Colors.black26,
                                        height: 1.0,
                                        // width: MediaQuery.of(context).size.width,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.0),
                                Expanded(
                                  child: Container(
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: documentmodel.length,
                                        itemBuilder: (context, index) {
                                          DocumentModel document =
                                              documentmodel[index];
                                          return Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            padding: EdgeInsets.all(5.0),
                                            margin:
                                                EdgeInsets.only(bottom: 5.0),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(10.0),
                                                ),
                                                border: Border.all(
                                                    color: Colors.black26)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Container(
                                                  height: 50.0,
                                                  width: 50.0,
                                                  decoration:
                                                      const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors.blue),
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
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Text(
                                                        // "Collection",
                                                        document.judul,
                                                        style: TextStyle(
                                                            fontSize: 16.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300),
                                                      ),
                                                      SizedBox(height: 5.0),
                                                      Text(
                                                        // "Quiz 1",
                                                        document.deskripsi,
                                                        style: TextStyle(
                                                            fontSize: 18.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      SizedBox(height: 5.0),
                                                      Row(
                                                        children: const <
                                                            Widget>[
                                                          Icon(
                                                            Icons.access_time,
                                                            size: 20.0,
                                                          ),
                                                          SizedBox(width: 5.0),
                                                          Text(
                                                            "09:00 WIB",
                                                            style: TextStyle(
                                                                fontSize: 14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(width: 5.0),
                                                Icon(
                                                  Icons
                                                      .check_circle_outline_rounded,
                                                  color: Colors.lightGreen,
                                                  size: 30.0,
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                  ),
                                ),
                              ],
                            ),
                            // Today(),
                            // thisMonth(),
                            Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Bulan ini",
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    Expanded(
                                      child: Container(
                                        color: Colors.black26,
                                        height: 1.0,
                                        // width: MediaQuery.of(context).size.width,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.0),
                                Expanded(
                                  child: Container(
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: documentmodel.length,
                                        itemBuilder: (context, index) {
                                          DocumentModel document =
                                              documentmodel[index];
                                          return Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            padding: EdgeInsets.all(5.0),
                                            margin:
                                                EdgeInsets.only(bottom: 5.0),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(10.0),
                                                ),
                                                border: Border.all(
                                                    color: Colors.black26)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Container(
                                                  height: 50.0,
                                                  width: 50.0,
                                                  decoration:
                                                      const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors.blue),
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
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Text(
                                                        // "Collection",
                                                        document.judul,
                                                        style: TextStyle(
                                                            fontSize: 16.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300),
                                                      ),
                                                      SizedBox(height: 5.0),
                                                      Text(
                                                        // "Quiz 1",
                                                        document.deskripsi,
                                                        style: TextStyle(
                                                            fontSize: 18.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      SizedBox(height: 5.0),
                                                      Row(
                                                        children: const <
                                                            Widget>[
                                                          Icon(
                                                            Icons.access_time,
                                                            size: 20.0,
                                                          ),
                                                          SizedBox(width: 5.0),
                                                          Text(
                                                            "09:00 WIB",
                                                            style: TextStyle(
                                                                fontSize: 14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(width: 5.0),
                                                Icon(
                                                  Icons
                                                      .check_circle_outline_rounded,
                                                  color: Colors.lightGreen,
                                                  size: 30.0,
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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
                            "Sales",
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w300),
                          ),
                          SizedBox(height: 5.0),
                          const Text(
                            "Quiz 1",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w500),
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
                                fontSize: 16.0, fontWeight: FontWeight.w300),
                          ),
                          SizedBox(height: 5.0),
                          const Text(
                            "Quiz 1",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w500),
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
