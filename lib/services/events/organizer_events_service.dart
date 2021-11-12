import 'dart:convert';

import 'package:frikiteam/models/events/event.dart';
import 'package:frikiteam/models/shared/pageable_response.dart';
import 'package:frikiteam/services/common/http.common.dart';
import 'package:frikiteam/storage/storage.dart';
import 'package:http/http.dart' as http;

class OrganizerEventsService {
  var storage = Storage();

  Future<Event> createEvent(int organizerId, Event event) async {
    var token = await storage.getToken();
    Map<String, String> headers = {
          'Content-type': 'application/json',
          'Authorization': 'Bearer $token'
        };
    var response = await http.post(
      Uri.parse('$basePath/organizers/$organizerId/events'),
        body: jsonEncode(event),
        headers: headers
      );
    
    print(response.body);
    
    return Event.fromJson(jsonDecode(response.body));
  }

  Future<List<Event>> getAllEventsByOrganizerId(int organizerId) async{
    var token = await storage.getToken();
    Map<String, String> headers = {'Authorization': 'Bearer $token'};
    var response = await http.get(
      Uri.parse('$basePath/organizers/$organizerId/events'),
      headers: headers
    );
    var source = Utf8Decoder().convert(response.bodyBytes);

    PageableResponse pageableResponse = PageableResponse.fromJson(json.decode(source));
    List<Event> events = pageableResponse.content.map((e) => Event.fromJson(e)).toList();
    return events;
  }

  Future<void> deleteEvent(int organizerId, int eventId) async {
    var token = await storage.getToken();
    Map<String, String> headers = {'Authorization': 'Bearer $token'};
    await http.delete(
      Uri.parse('$basePath/organizers/$organizerId/events/$eventId'),
      headers: headers
    );
  }
}