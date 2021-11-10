import 'dart:convert';

Itinerary itineraryFromJson(String str) => Itinerary.fromJson(json.decode(str));

String itineraryToJson(Itinerary data) => json.encode(data.toJson());

class Itinerary {
    Itinerary({
      required this.id,
      required this.name,
      this.startDateTime,
      this.endDateTime,
    });

    int id;
    String name;
    dynamic startDateTime;
    dynamic endDateTime;

    factory Itinerary.fromJson(Map<String, dynamic> json) => Itinerary(
        id: json["id"],
        name: json["name"],
        startDateTime: json["startDateTime"],
        endDateTime: json["endDateTime"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "startDateTime": startDateTime,
        "endDateTime": endDateTime,
    };
}
