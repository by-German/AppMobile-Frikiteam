import 'dart:convert';

import 'package:frikiteam/models/events/itinerary.dart';
import 'package:frikiteam/services/common/http.common.dart';
import 'package:http/http.dart' as http;

class EventItinerariesService {
  Future<List<Itinerary>> getAllEventItineraries(int eventId) async {
    var response = await http.get(Uri.parse('$basePath/events/$eventId/itineraries'));
    
    var source = Utf8Decoder().convert(response.bodyBytes);
    
//     http.Response response = await _api.getData();
//  String source = Utf8Decoder().convert(response.bodyBytes);

//  // Convert to your class instance...
//  MyClass instance = json.decode(source);


    var itineraries = jsonDecode(source) as List;

    return itineraries.map((e) => Itinerary.fromJson(e)).toList();
  }

  Future<void> postEventItineraries(int eventId, List<Itinerary> items) async {
    for (var item in items) {
      await http.post(
          Uri.parse('$basePath/events/$eventId/itineraries'),
          body: jsonEncode(item),
          headers: {'Content-type': 'application/json'}
        );
    }
  }


}