import 'dart:convert';

import 'package:frikiteam/services/common/http.common.dart';
import 'package:frikiteam/storage/storage.dart';
import 'package:http/http.dart' as http;

class UserAuthService {
  
  Future<bool> auth(String email, String password) async {
    var storage = Storage();

    var response = await http.post(
      Uri.parse('$basePath/auth/sign-in'),
      body: jsonEncode({"username": email, "password": password}),
      headers: {'Content-type': 'application/json'}
    );

    if (response.statusCode == 200) {
      await storage.saveUserAuth(response.body);
      return true;
    }
    await storage.removeAuthUser();
    return false;
  }
}