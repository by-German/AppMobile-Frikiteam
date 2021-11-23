import 'dart:convert';

import 'package:frikiteam/models/events/event.dart';
import 'package:frikiteam/models/events/event_information.dart';
import 'package:frikiteam/services/common/http.common.dart';
import 'package:frikiteam/storage/storage.dart';
import 'package:http/http.dart' as http;

class EventFollowService {
  Future<List<Event>> getAllEventFollow(int customerId) async {
    var storage = Storage();
    var token = await storage.getToken();
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var response = await http.get(Uri.parse('$basePath/customers/$customerId/organizers'), headers: headers);

    var source = Utf8Decoder().convert(response.bodyBytes);
    var information = jsonDecode(source) as List;

    return information.map((e) => Event.fromJson(e)).toList();
  }
}