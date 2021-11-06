import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frikiteam/views/users/user_profile.dart';

PreferredSizeWidget navBar(BuildContext context) {
  return AppBar(
    leading: IconButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => UserProfile()));
      },
      icon: Icon(Icons.person),
      iconSize: 30,
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Image.asset(
          "assets/images/logo.png",
          width: 120,
        ),
      ),
    ],
    backgroundColor: Color.fromRGBO(24, 22, 26, 1),
  );
}
