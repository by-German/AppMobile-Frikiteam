import 'package:flutter/material.dart';
import 'package:frikiteam/views/detailevent_page.dart';
import 'package:frikiteam/views/list_events_page.dart';
import 'package:frikiteam/views/register_page.dart';
import 'package:frikiteam/views/viewevent_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ViewEventPage()
    );
  }
}
