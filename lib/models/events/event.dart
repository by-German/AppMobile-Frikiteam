import 'dart:convert';

class Event {
    Event({
      required this.id,
      required this.logo,
      required this.information,
      required this.name,
      required this.price,
      required this.quantity,
      required this.sold,
      required this.verified,
      required this.startDate,
      required this.endDate,
      required this.eventTypeId,
      required this.organizerId,
      required this.placeId,
    });

    int id;
    String logo;
    String information;
    String name;
    double price;
    int quantity;
    int sold;
    bool verified;
    dynamic startDate;
    dynamic endDate;
    dynamic eventTypeId;
    int organizerId;
    int placeId;

    factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"],
        logo: json["logo"],
        information: json["information"],
        name: json["name"],
        price: json["price"],
        quantity: json["quantity"],
        sold: json["sold"],
        verified: json["verified"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        eventTypeId: json["eventTypeId"],
        organizerId: json["organizerId"],
        placeId: json["placeId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "logo": logo,
        "information": information,
        "name": name,
        "price": price,
        "quantity": quantity,
        "sold": sold,
        "verified": verified,
        "startDate": startDate,
        "endDate": endDate,
        "eventTypeId": eventTypeId,
        "organizerId": organizerId,
        "placeId": placeId,
    };
}
