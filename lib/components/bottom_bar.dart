import 'package:flutter/material.dart';
import 'package:frikiteam/views/create/my_events.dart';
import 'package:frikiteam/views/follows/follow_page.dart';
import 'package:frikiteam/views/home/home_page.dart';
import 'package:frikiteam/views/events/list_events_page.dart';
import 'package:frikiteam/views/users/user_profile.dart';

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
        case 4:
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => UserProfile()));
        }
    },
    showSelectedLabels: false,
    showUnselectedLabels: false,
    currentIndex: index,
    type: BottomNavigationBarType.fixed,
    items: [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
      BottomNavigationBarItem(icon: Icon(Icons.search), label: "search"),
      BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "favorites"),
      BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline), label: "create"),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: "user profile")
    ],
  );
}
