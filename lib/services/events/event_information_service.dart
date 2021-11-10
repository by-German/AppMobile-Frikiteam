import 'dart:convert';

EventInformation eventInformationFromJson(String str) => EventInformation.fromJson(json.decode(str));

String eventInformationToJson(EventInformation data) => json.encode(data.toJson());

class EventInformation {
    EventInformation({
      required this.id,
      required this.title,
      required this.description,
      required this.image,
    });

    int id;
    String title;
    String description;
    String image;

    factory EventInformation.fromJson(Map<String, dynamic> json) => EventInformation(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image,
    };
}
