import 'dart:convert';

import 'package:frikiteam/models/events/event.dart';
import 'package:frikiteam/models/shared/pageable_response.dart';
import 'package:frikiteam/services/common/http.common.dart';
import 'package:http/http.dart' as http;

class OrganizerEventsService {
  var token = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJnZXJtYW5AZ21haWwuY29tIiwiZXhwIjoxNjM2NTEzNjI0LCJpYXQiOjE2MzY0OTU2MjR9.2GVCGR9z3HRjsuwtWq8ojKUdqWFGNw2vWZ2txu_QdvB35LHLTPnA3ubod4Ev0WmRwkh9r_8B_rvDhdVuJxco9A";

  Future<Event> createEvent(int organizerId, Event event) async {
    Map<String, String> headers = {
          'Content-type': 'application/json',
          'Authorization': 'Bearer $token'
        };
    var response = await http.post(
      Uri.parse('$basePath/organizers/$organizerId/events'),
      body: jsonEncode(event),
      headers: headers
      );
    
    return Event.fromJson(jsonDecode(response.body));
  }

  Future<List<Event>> getAllEventsByOrganizerId(int organizerId) async{
    Map<String, String> headers = {'Authorization': 'Bearer $token'};
    var response = await http.get(
      Uri.parse('$basePath/organizers/$organizerId/events'),
      headers: headers
      );
    
    PageableResponse pageableResponse = PageableResponse.fromJson(json.decode(response.body));
    List<Event> events = pageableResponse.content.map((e) => Event.fromJson(e)).toList();
    return events;
  }
}