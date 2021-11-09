import 'dart:convert';

import 'package:frikiteam/models/events/event.dart';
import 'package:frikiteam/services/common/http.common.dart';
import 'package:http/http.dart' as http;

class EventsSevice {
  Future<List<Event>> getAllEvents() async {
    var response = await http.get(Uri.parse('$basePath/events'));
    var events = jsonDecode(response.body) as List;
    return events.map((e) => Event.fromJson(e)).toList();
  }

  Future<Event> getEventById(int id) async {
    var response = await http.get(Uri.parse('$basePath/events/$id'));
    return Event.fromJson(jsonDecode(response.body));
  }

  Future getAllEventsByName(String name) async {
    final uri = Uri.parse('$basePath/events/search').replace(queryParameters: {'name': name});    
    var response = await http.get(uri);
    return jsonDecode(response.body).map((e) => Event.fromJson(e)).toList();
  }

}