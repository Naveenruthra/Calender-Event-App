import 'package:calender_event_app/controller/calendar_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';

import '../model/event_list_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<NeatCleanCalendarEvent>? eventList = [];
  bool isLoading = true;
  final controller = CalendarController();
  @override
  void initState() {
    super.initState();
    populateEvent();
  }

  Future<void> populateEvent() async {
    List<Event> events = await controller.fetchEvents();
    setState(() {
      isLoading = false;
    });

    events.forEach(
      (element) {
        eventList?.add(
          NeatCleanCalendarEvent(
            description: element.description,
            element.title,
            startTime: DateTime.parse(element.startAt),
            endTime: DateTime.parse(element.startAt),
            color: element.status == "Confirmed" ? Colors.green : Colors.red,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isLoading
            ? Center(
                child: CupertinoActivityIndicator(
                  radius: 50,
                  color: Colors.amber,
                  animating: true,
                ),
              )
            : Calendar(
                onEventSelected: (value) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return SimpleDialog(
                        title: Text("Event Description"),
                        contentPadding: EdgeInsets.all(20),
                        children: [
                          Text(value.description),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Close"))
                        ],
                      );
                    },
                  );
                },
                startOnMonday: true,
                weekDays: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
                eventsList: eventList,
                isExpandable: true,
                eventDoneColor: Colors.green,
                selectedColor: Colors.pink,
                selectedTodayColor: Colors.red,
                todayColor: Colors.blue,
                eventColor: null,
                locale: 'en_US',
                todayButtonText: 'Today',
                allDayEventText: 'All Day',
                multiDayEndText: 'End',
                isExpanded: true,
                expandableDateFormat: 'EEEE, dd. MMMM yyyy',
                datePickerType: DatePickerType.date,
                dayOfWeekStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 11),
              ),
      ),
    );
  }
}
