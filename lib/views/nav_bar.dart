import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: 50,
          height: 50,
          child: Icon(
            Icons.person,
            size: 50.0,
            color: Colors.white,
          ),
        ),
        Image.asset(
          "assets/images/logo.png",
          width: 150.0,
        )
      ],
    );
  }
}
