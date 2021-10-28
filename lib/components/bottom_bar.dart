import 'package:flutter/material.dart';
import 'package:frikiteam/views/create/general_information.dart';
import 'package:frikiteam/views/create/my_events.dart';
import 'package:frikiteam/views/follow_page.dart';
import 'package:frikiteam/views/home_page.dart';
import 'package:frikiteam/views/list_events_page.dart';

Widget bottomNav(BuildContext context, int index) {
  return BottomNavigationBar(
    onTap: (index) {
      switch (index) {
        case 0:
          Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => HomePage()));
          break;
        case 1:
          Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => ListEventPage()));
          break;
        case 2:
          Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => FollowPage()));
          break;
        case 3:
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MyEvents()));
          break;
        }
    },
    showSelectedLabels: false,
    showUnselectedLabels: false,
    currentIndex: index,
    type: BottomNavigationBarType.fixed,
    items: [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
      BottomNavigationBarItem(icon: Icon(Icons.search), label: "search"),
      BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "notifications"),
      BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline), label: "create"),
    ],
  );
}
