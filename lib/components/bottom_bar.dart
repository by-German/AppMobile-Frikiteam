import 'package:flutter/material.dart';
import 'package:frikiteam/views/home_page.dart';
import 'package:frikiteam/views/list_events_page.dart';

Widget bottomNav(BuildContext context) {
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
          print("navigation for follows events and organizers");
          break;
        case 3:
          print("navigation for create event");
          break;
      }
    },
    showSelectedLabels: false,
    showUnselectedLabels: false,
    type: BottomNavigationBarType.fixed,
    items: [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
      BottomNavigationBarItem(icon: Icon(Icons.search), label: "search"),
      BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "notifications"),
      BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline), label: "create"),
    ],
  );
}
