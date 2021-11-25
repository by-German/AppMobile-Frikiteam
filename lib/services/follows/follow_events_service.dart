import 'dart:convert';

import 'package:frikiteam/models/events/event.dart';
import 'package:frikiteam/models/shared/pageable_response.dart';
import 'package:frikiteam/services/common/http.common.dart';
import 'package:frikiteam/storage/storage.dart';
import 'package:http/http.dart' as http;

class FollowEventsService {
  final storage = Storage();

  Future<bool> followEvent(int customerId, int eventId) async {
    var token = await storage.getToken();
    Map<String, String> headers = {
          'Content-type': 'application/json',
          'Authorization': 'Bearer $token'
        };

    var response = await http.post(
        Uri.parse('$basePath/customers/$customerId/events/$eventId'),
        headers: headers
      );
    
    return response.statusCode == 200; 
  }

  Future<bool> unFollowEvent(int customerId, int eventId) async {
    var token = await storage.getToken();
    Map<String, String> headers = {
          'Content-type': 'application/json',
          'Authorization': 'Bearer $token'
        };

    var response = await http.delete(
        Uri.parse('$basePath/customers/$customerId/events/$eventId'),
        headers: headers
      );
    
    return response.statusCode == 200; 
  }

  Future<List<Event>> getEventsFollowed(int customerId) async {
    var token = await storage.getToken();
    Map<String, String> headers = {
          'Content-type': 'application/json',
          'Authorization': 'Bearer $token'
        };

    var response = await http.get(
        Uri.parse('$basePath/customers/$customerId/events'),
        headers: headers
      );
    
    PageableResponse pageableResponse = PageableResponse.fromJson(json.decode(response.body));
    List<Event> events = pageableResponse.content.map((e) => Event.fromJson(e)).toList();
    return events;
  }

    Future<bool> isFollowingEvent(int customerId, int eventId) async {
    final events = await getEventsFollowed(customerId);
    for (var event in events) {
      if (event.id == eventId) return true;
    }
    return false;
  }

}