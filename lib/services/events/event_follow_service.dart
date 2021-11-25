import 'dart:convert';

import 'package:frikiteam/models/events/event.dart';
import 'package:frikiteam/models/events/event_information.dart';
import 'package:frikiteam/models/users/organizer.dart';
import 'package:frikiteam/services/common/http.common.dart';
import 'package:frikiteam/storage/storage.dart';
import 'package:http/http.dart' as http;

class EventFollowService {
  Future<List<Event>> getAllEventFollow(int customerId) async {

    var response = await http.get(Uri.parse('$basePath/customers/$customerId/events'));
    var events = json.decode(response.body)["content"];
    var information = events as List;
    return information.map((e) => Event.fromJson(e)).toList();
  }

  Future<List<Organizer>> getAllOrganizersByCustomer(int customerId) async {
    final uri = Uri.parse('$basePath/customers/25/organizers');

    var response = await http.get(uri);
    var organizers = json.decode(response.body)["content"];
    var information = organizers as List;
    return information.map((e) => Organizer.fromJson(e)).toList();
  }
}