import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget navBar(BuildContext context,  {bool leadingActive = false, String title = ""}) {
  return AppBar(
    // leading: IconButton(
    //   onPressed: () {
    //     Navigator.of(context).push(MaterialPageRoute(
    //         builder: (BuildContext context) => UserProfile()));
    //   },
    //   icon: Icon(Icons.person),
    //   iconSize: 30,
    // ),
    automaticallyImplyLeading: leadingActive,
    title: Text(title),
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
    elevation: 0,
  );
}
