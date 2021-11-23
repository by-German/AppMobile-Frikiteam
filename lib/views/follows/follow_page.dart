import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frikiteam/components/bottom_bar.dart';
import 'package:frikiteam/components/nav_bar.dart';
import 'package:frikiteam/models/events/event.dart';
import 'package:frikiteam/services/events/event_follow_service.dart';
import 'package:frikiteam/services/events/events_service.dart';
import 'package:frikiteam/storage/storage.dart';
import 'package:intl/intl.dart';
class FollowPage extends StatefulWidget {
  @override
  _FollowPage createState() => _FollowPage();
  }

  class _FollowPage extends State<FollowPage> {

    final Storage storageService = Storage();

  EventFollowService eventsSevice = EventFollowService();
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 15, bottom: 15),
                child: Center(child: Text( 'Eventos Seguidos', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
                ),
              ),
              Container(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: events.length,
                  itemBuilder: (context, index){
                    Event event = events[index];
                    return conditional2(text: event.information, title: event.name ,date: event.startDate, image: event.logo ,index: index);
                  },
                ),
              )
            ],
          ),
        )
    );
  }

  Widget conditional2({required text, required title, required date, required image , required index}) {
    return Form(
      child: Container(
        padding: EdgeInsets.only(bottom: 20),
        color: (index % 2 == 0) ? Color.fromRGBO(24, 22, 26, 1) : Colors.white,
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: Align(
                child: Container(
                  width: 90,
                  height: 90,
                  child: Center(
                    child: Image.network(
                      image,
                      errorBuilder: (ctx, ex, trace) =>
                          Image.network(image),
                    ),
                  )
                ),
              ),
            ),
            Flexible(
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
                          'Fecha: ' + date,
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
    final user = await storageService.getUserAuth();

    final DateFormat format = DateFormat("yyyy-MM-dd");
    final _events = await eventsSevice.getAllEventFollow(user.id);
    setState(() {
      events = _events;
    });
    
    

    for(int i = 0; i < events.length; i++){
      var d = DateTime.fromMillisecondsSinceEpoch(events[i].startDate);
      var a = format.format(events[i].startDate);
      var year = events[i].startDate.toString().substring(0,4);
      var month =  events[i].startDate.toString().substring(4,6);
      var day =  events[i].startDate.toString().substring(6,8);
      var date = day + "/" + month + "/" + year;
      events[i].startDate = date;
    }
  }
}