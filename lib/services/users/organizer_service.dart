import 'dart:convert';

import 'package:frikiteam/models/users/organizer.dart';
import 'package:frikiteam/services/common/http.common.dart';
import 'package:frikiteam/services/users/user_auth_service.dart';
import 'package:http/http.dart' as http;

class OrganizerService {
  Future<Organizer> getOrganizerById(int id) async {
    var response = await http.get(Uri.parse('$basePath/organizers/$id'));
    return Organizer.fromJson(jsonDecode(response.body));
  }

  Future<bool> createOrganizer({required String firstName, required String lastName, required String email, required String password}) async {
    UserAuthService userAuthService = UserAuthService();
    Organizer organizer = Organizer(id: 0, firstName: firstName, lastName: lastName, email: email, password: password, logo: "default", description: "", verified: false);

    var response = await http.post(
      Uri.parse('$basePath/organizers'),
      body: jsonEncode(organizer),
      headers: {"Content-Type": "application/json"}
    );

    final user = Organizer.fromJson(jsonDecode(response.body));
    return await userAuthService.auth(user.email, user.password);
  }

  Future<Organizer> updateOrganizer({required int id, required String firstName, required String lastName, required String email, required String password}) async {
    Organizer organizer = Organizer(id: 0, firstName: firstName, lastName: lastName, email: email, password: password, logo: "default", description: "", verified: false);

    var response = await http.put(
      Uri.parse('$basePath/organizers/$id'),
      body: jsonEncode(organizer),
      headers: {"Content-Type": "application/json"}
    );

    return Organizer.fromJson(jsonDecode(response.body));
  }

}