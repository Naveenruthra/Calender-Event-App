import 'dart:convert';
import 'dart:io';

import 'package:calender_event_app/model/event_list_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CalendarController extends ChangeNotifier {
  dynamic decodedData;
  Future<List<Event>> fetchEvents() async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("eventlist") != null) {
      decodedData = jsonDecode(prefs.getString("eventlist") as String);
    } else {
      final response = await http.get(headers: {
        "Authorization": "Bearer 2f68dbbf-519d-4f01-9636-e2421b68f379"
      }, Uri.parse("https://mock.apidog.com/m1/561191-524377-default/Event"));
      prefs.setString("eventlist", response.body);
      decodedData = jsonDecode(response.body);
    }

    return Event.eventList(decodedData["data"]);
  }
}
