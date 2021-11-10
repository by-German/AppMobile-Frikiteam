import 'dart:convert';

UserAuth userAuthFromJson(String str) => UserAuth.fromJson(json.decode(str));

String userAuthToJson(UserAuth data) => json.encode(data.toJson());

class UserAuth {
    UserAuth({
      required this.id,
      required this.username,
      required this.token,
      required this.role,
    });

    int id;
    String username;
    String token;
    String role;

    factory UserAuth.fromJson(Map<String, dynamic> json) => UserAuth(
        id: json["id"],
        username: json["username"],
        token: json["token"],
        role: json["role"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "token": token,
        "role": role,
    };
}
