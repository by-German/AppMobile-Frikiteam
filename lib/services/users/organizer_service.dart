import 'dart:convert';

import 'package:frikiteam/models/users/organizer.dart';
import 'package:frikiteam/services/common/http.common.dart';
import 'package:http/http.dart' as http;

class OrganizerService {
  Future<Organizer> getOrganizerById(int id) async {
    var response = await http.get(Uri.parse('$basePath/organizers/$id'));
    return Organizer.fromJson(jsonDecode(response.body));
  }
}