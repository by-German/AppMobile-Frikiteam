import 'dart:convert';

Customer customerFromJson(String str) => Customer.fromJson(json.decode(str));

String customerToJson(Customer data) => json.encode(data.toJson());

class Customer {
    Customer({
      required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.logo,
      required this.dateBirth,
    });

    int id;
    String firstName;
    String lastName;
    String email;
    String password;
    String logo;
    dynamic dateBirth;

    factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        password: json["password"],
        logo: json["logo"],
        dateBirth: json["dateBirth"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "logo": logo,
        "dateBirth": dateBirth,
    };
}
