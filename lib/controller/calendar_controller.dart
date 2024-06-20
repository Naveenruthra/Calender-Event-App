import 'dart:convert';
import 'dart:io';

import 'package:calender_event_app/model/event_list_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CalendarController extends ChangeNotifier {
  Future<List<Event>> fetchEvents() async {
    final response = await http.get(headers: {
      "Authorization": "Bearer 2f68dbbf-519d-4f01-9636-e2421b68f379"
    }, Uri.parse("https://mock.apidog.com/m1/561191-524377-default/Event"));

    final decodedData = jsonDecode(response.body);
    return Event.eventList(decodedData["data"]);
  }
}
