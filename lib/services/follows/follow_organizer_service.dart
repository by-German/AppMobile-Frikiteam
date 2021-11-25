import 'dart:convert';

import 'package:frikiteam/models/shared/pageable_response.dart';
import 'package:frikiteam/models/users/organizer.dart';
import 'package:frikiteam/services/common/http.common.dart';
import 'package:frikiteam/storage/storage.dart';
import 'package:http/http.dart' as http;

class FollowOrganizerService {
  var storage = Storage();

  Future<bool> followOrganizer(int customerId, int organizerId) async {
    var token = await storage.getToken();
    Map<String, String> headers = {
          'Content-type': 'application/json',
          'Authorization': 'Bearer $token'
        };

    var response = await http.post(
        Uri.parse('$basePath/customers/$customerId/organizers/$organizerId'),
        headers: headers
      );
    
    return response.statusCode == 200; 
  }

  Future<bool> unFollowOrganizer(int customerId, int organizerId) async {
    var token = await storage.getToken();
    Map<String, String> headers = {
          'Content-type': 'application/json',
          'Authorization': 'Bearer $token'
        };

    var response = await http.delete(
        Uri.parse('$basePath/customers/$customerId/organizers/$organizerId'),
        headers: headers
      );
    
    return response.statusCode == 200; 
  }
  
  Future<List<Organizer>> getOrganizerFollowed(int customerId) async {
    var token = await storage.getToken();
    Map<String, String> headers = {
          'Content-type': 'application/json',
          'Authorization': 'Bearer $token'
        };

    var response = await http.get(
        Uri.parse('$basePath/customers/$customerId/organizers'),
        headers: headers
      );
    
    PageableResponse pageableResponse = PageableResponse.fromJson(json.decode(response.body));
    List<Organizer> organizers = pageableResponse.content.map((e) => Organizer.fromJson(e)).toList();
    return organizers;
  }

  Future<bool> isFollowingOrganizer(int customerId, int organizerId) async {
    final organizers = await getOrganizerFollowed(customerId);
    for (var organizer in organizers) {
      if (organizer.id == organizerId) return true;
    }
    return false;
  }
}