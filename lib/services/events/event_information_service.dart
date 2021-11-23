import 'dart:convert';

import 'package:frikiteam/models/events/event_information.dart';
import 'package:frikiteam/services/common/http.common.dart';
import 'package:http/http.dart' as http;

class EventInformationService {
  Future<List<EventInformation>> getAllEventInformation(int eventId) async {
    var response = await http.get(Uri.parse('$basePath/events/$eventId/information'));

    var source = Utf8Decoder().convert(response.bodyBytes);
    var information = jsonDecode(source) as List;

    return information.map((e) => EventInformation.fromJson(e)).toList();
  }

  Future<void> postEventInformation(int eventId, List<EventInformation> items) async {
    for (var item in items) {
      await http.post(
          Uri.parse('$basePath/events/$eventId/information'),
          body: jsonEncode(item),
          headers: {'Content-type': 'application/json'}
        );
    }
  }
}