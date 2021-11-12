import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frikiteam/components/bottom_bar.dart';
import 'package:frikiteam/components/nav_bar.dart';
import 'package:frikiteam/models/events/event.dart';
import 'package:frikiteam/services/events/events_service.dart';

class FollowPage extends StatefulWidget {
  @override
  _FollowPage createState() => _FollowPage();
  }

  class _FollowPage extends State<FollowPage> {

  EventsSevice eventsSevice = EventsSevice();
  Event? event;
  List<Event> events = [];

  String imageDefault =
  "https://www.kenyons.com/wp-content/uploads/2017/04/default-image-620x600.jpg";

  @override
  void initState() {
    getEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: navBar(context),
        bottomNavigationBar: bottomNav(context, 2),
        body: ListView(
          children: <Widget>[
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15, bottom: 15),
                  child: Text(
                    'Eventos Seguidos',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: events.length,
              itemBuilder: (context, index){
                Event event = events[index];
                return conditional2(text: event.information, title: event.name ,date: "event.startDate", image: event.logo ,index: index);
              },
            ),
          ],
        )
    );
  }

  Widget conditional2({required text, required title, required date, required image , required index}) {
    return LimitedBox(
      maxHeight: 150,
      child: Container(
        color: (index % 2 == 0) ? Color.fromRGBO(24, 22, 26, 1) : Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Align(
                child: Container(
                  margin: EdgeInsets.all(15),
                  width: 90,
                  height: 90,
                  child: Image.network(
                    image,
                    errorBuilder: (ctx, ex, trace) =>
                        Image.network("https://images.unsplash.com/photo-1547721064-da6cfb341d50"),
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                          title,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: (index % 2 == 0) ? Colors.white : Color.fromRGBO(24, 22, 26, 1)),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                          text,
                          style: TextStyle(fontSize: 14, color: (index % 2 == 0) ? Colors.white : Color.fromRGBO(147, 147, 188, 1)),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                          'Fecha' + date,
                          style: TextStyle(fontSize: 14, color: (index % 2 == 0) ? Colors.white : Color.fromRGBO(147, 147, 188, 1)),
                        ),
                      ),
                    ),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }

  void getEvents() async{
    final _events = await eventsSevice.getAllEvents();
    setState(() {
      events = _events;
    });
  }
}