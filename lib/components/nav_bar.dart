import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frikiteam/views/user_profile.dart';

PreferredSizeWidget navBar(BuildContext context) {
  return AppBar(
    leading: IconButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => UserProfile()));
      },
      icon: Icon(Icons.person),
      iconSize: 50,
    ),
    actions: [
      Image.asset(
        "assets/images/logo.png",
        width: 150,
      ),
    ],
    backgroundColor: Color.fromRGBO(24, 22, 26, 1),
  );
}
