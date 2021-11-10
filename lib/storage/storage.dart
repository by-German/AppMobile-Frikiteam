import 'dart:convert';

import 'package:frikiteam/models/users/user_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  String userKey = "userAuth";

  Future<UserAuth> getUserAuth() async {
    SharedPreferences shared = await SharedPreferences.getInstance(); 
    var userAuth = shared.getString(userKey);
    UserAuth user = UserAuth.fromJson(jsonDecode(userAuth!));
    return user;
  }

  saveUserAuth(String userString) async {
    SharedPreferences shared = await SharedPreferences.getInstance(); 

    await shared.setString(userKey, userString);
  }

  Future<String> getToken() async {
    SharedPreferences shared = await SharedPreferences.getInstance(); 
    var userAuth = shared.getString(userKey);
    UserAuth user = UserAuth.fromJson(jsonDecode(userAuth!));
    return user.token;
  }

  removeAuthUser() async {
    SharedPreferences shared = await SharedPreferences.getInstance(); 
    await shared.remove(userKey);
  }


}