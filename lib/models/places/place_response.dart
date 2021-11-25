import 'dart:convert';

PlaceResponse placeResponseFromJson(String str) => PlaceResponse.fromJson(json.decode(str));

class PlaceResponse {
  PlaceResponse({
    required this.id,
    required this.name,
    required this.reference,
    required this.district,
    required this.city,
    required this.country
  });

  int id;
  String name;
  String reference;
  String district;
  String city;
  String country;

  factory PlaceResponse.fromJson(Map<String, dynamic> json) => PlaceResponse(
    id: json["id"],
    name: json["name"],
    reference: json["reference"],
    district: json["district"]['name'],
    city: json["district"]['city']['name'],
    country: json["district"]['city']['country']['name']
  );
}

