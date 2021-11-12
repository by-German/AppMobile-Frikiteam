// To parse this JSON data, do
//
//     final organizer = organizerFromJson(jsonString);

import 'dart:convert';

Organizer organizerFromJson(String str) => Organizer.fromJson(json.decode(str));

String organizerToJson(Organizer data) => json.encode(data.toJson());

class Organizer {
    Organizer({
      required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.logo,
      required this.description,
      required this.verified,
    });

    int id;
    String firstName;
    String lastName;
    String email;
    String password;
    String logo;
    String description;
    bool verified;

    factory Organizer.fromJson(Map<String, dynamic> json) => Organizer(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        password: json["password"],
        logo: json["logo"],
        description: json["description"],
        verified: json["verified"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "logo": logo,
        "description": description,
        "verified": verified,
    };
}
