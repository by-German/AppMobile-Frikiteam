import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frikiteam/components/bottom_bar.dart';
import 'package:frikiteam/components/nav_bar.dart';
import 'package:frikiteam/models/events/event.dart';
import 'package:frikiteam/models/users/organizer.dart';
import 'package:frikiteam/services/follows/follow_events_service.dart';
import 'package:frikiteam/services/follows/follow_organizer_service.dart';
import 'package:frikiteam/storage/storage.dart';
import 'package:frikiteam/views/events/viewevent_page.dart';
import 'package:intl/intl.dart';

class FollowPage extends StatefulWidget {
  @override
  _FollowPage createState() => _FollowPage();
}

class _FollowPage extends State<FollowPage> {

  Storage storage = Storage();
  FollowEventsService followEventsService = FollowEventsService();
  FollowOrganizerService followOrganizerService = FollowOrganizerService();

  Event? event;
  List<Event> events = [];
  List<Organizer> organizers = [];

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
        appBar: navBar(context, title: "Follow events"),
        bottomNavigationBar: bottomNav(context, 2),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: Center(child: Text( 'Organizadores Seguidos', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
                ),
              ),
              Container(
                  width: double.infinity,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  height: 80,
                  child: organizers.isNotEmpty ? ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: organizers.length,
                    itemBuilder: (context, index){
                      Organizer organizer = organizers[index];
                      return conditional1(index: index, image: organizer.logo, id: 1);
                    },
                  ): Center(child: Text("No esta siguiendo a ningún organizador", style: TextStyle(fontSize: 16),)),
                )
              ),
              Container(
                margin: EdgeInsets.only(top: 25, bottom: 35),
                child: Center(child: Text( 'Eventos Seguidos', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
                ),
              ),
              Container(
                child: events.isNotEmpty ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: events.length,
                  itemBuilder: (context, index){
                    Event event = events[index];
                    return conditional2(text: event.information, title: event.name ,date: event.startDate, image: event.logo ,index: index, id: event.id);
                  },
                ): Center(child: Text("No esta siguiendo a ningún evento", style: TextStyle(fontSize: 16),)),
              )
            ],
          ),
        )
    );
  }

  Widget conditional1({required image , required index, required id}) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => ViewEventPage(eventId: id)));
      },
      child: Container(
        width: 80,
        margin: (index == 0) ? EdgeInsets.only(left: 40, right: 40) : EdgeInsets.only(right: 40),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.blue),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                image,
                errorBuilder: (ctx, ex, trace) =>
                    Image.network(image),
                fit: BoxFit.cover,
                height: 80,
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget conditional2({required text, required title, required date, required image , required index, required id}) {
    return Form(
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => ViewEventPage(eventId: id)));
        },
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
      ),
    );
  }

  void getEvents() async{
    final DateFormat format = DateFormat("yyyy-MM-dd");
    final user = await storage.getUserAuth();
    final _organizers = await followOrganizerService.getOrganizerFollowed(user.id);
    final _events = await followEventsService.getEventsFollowed(user.id);
    setState(() {
      organizers = _organizers;
      events = _events;
    });

    for(int i = 0; i < events.length; i++){
      var date = DateTime.fromMillisecondsSinceEpoch(events[i].startDate, isUtc: true);
      final String formatted = format.format(date);
      events[i].startDate = formatted;
    }
  }
}