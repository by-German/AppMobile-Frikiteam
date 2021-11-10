import 'dart:convert';

import 'package:frikiteam/models/users/user_auth.dart';
import 'package:frikiteam/services/common/http.common.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class UserAuthService {
  
  Future<bool> auth(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    var response = await http.post(
      Uri.parse('$basePath/auth/sign-in'),
      body: jsonEncode({"username": email, "password": password}),
      headers: {'Content-type': 'application/json'}
    );

    if (response.statusCode == 200) {
      await prefs.setString("userAuth", response.body);
      return true;
    }
    await prefs.remove("userAuth");
    return false;
  }
}