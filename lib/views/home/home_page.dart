import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frikiteam/components/bottom_bar.dart';
import 'package:frikiteam/components/nav_bar.dart';
import 'package:frikiteam/models/events/event.dart';
import 'package:frikiteam/services/events/events_service.dart';
import 'package:frikiteam/views/events/viewevent_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AnimationController _controller;

  EventsSevice eventsSevice = EventsSevice();
  Event? event;
  List<Event> eventsDate = [];
  List<Event> eventsMoment = [];

  @override
  void initState() {
    getEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navBar(context, title: "Home page"),
      bottomNavigationBar: bottomNav(context, 0),
      body: ListView(
        children: [
          Container(
            color: Color.fromRGBO(24, 22, 26, 1),
            child: mainImage(),
          ),
          Container(
            padding: EdgeInsets.only(top: 25, bottom: 25),
            color: Colors.white,
            child: Text("EVENTOS MOMENTANEOS", textAlign: TextAlign.center, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ),
          Container(
            padding: EdgeInsets.only(top: 30, bottom: 30),
            width: double.infinity,
            color: Colors.white,
            child: Container(
              height: 320,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: eventsMoment.length,
                itemBuilder: (context, index){
                  Event event = eventsMoment[index];
                  return GestureDetector(
                    child: _eventCard(title: event.name, description: event.information, index: index, id: event.id, design: 0, image: event.logo),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ViewEventPage(eventId: event.id,))),  
                  );
                },
              ),
            )
          ),
          Container(
            padding: EdgeInsets.only(top: 25, bottom: 25),
            color: Color.fromRGBO(24, 22, 26, 1),
            child: Text("EVENTOS ESPECIALES", textAlign: TextAlign.center, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
          ),
          Container(
              padding: EdgeInsets.only(top: 30, bottom: 30),
              width: double.infinity,
              color: Color.fromRGBO(24, 22, 26, 1),
              child: Container(
                height: 320,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: eventsDate.length,
                  itemBuilder: (context, index){
                    Event event = eventsDate[index];
                    return GestureDetector(
                      child: _eventCard(title: event.name, description: event.information, index: index, id: event.id, design: 0, image: event.logo),
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ViewEventPage(eventId: event.id,))),                        
                    );
                  },
                ),
              )
          ),
        ],
      )
    );
  }

  //Option 0 is with background white
  //Option 1 is with background dark

  Widget _eventCard({required title, required description, required id, required index, required design, required image}) {
    return Container(
      margin: (index == 0) ? EdgeInsets.only(right: 20, left: 20) : EdgeInsets.only(right: 20),
      width: 200,
      height: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: (design == 1) ? Colors.white : Color.fromRGBO(246, 246, 255, 1),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 15, bottom: 15),
            width: double.infinity,
            child: Text(title, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color.fromRGBO(24, 22, 26, 1)),),
          ),
          Container(
            width: double.infinity,
            child: Center(
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Image.network(
                  image,
                  fit: BoxFit.fill,
                  errorBuilder: (ctx, ex, trace) =>
                      Image.network(image,
                        fit: BoxFit.fill,
                      ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15, right: 15, left: 15),
            width: double.infinity,
            height: 80,
            child: Center(child: Text(description, textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Color.fromRGBO(111, 111, 191, 1))),) ,
          ),
        ],
      ),

    );
  }

  Widget mainImage() {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            "assets/images/home.png",
            fit: BoxFit.fill,
          ),
        )
      ],
    );
  }

  void getEvents() async{
    final _events = await eventsSevice.getAllEvents();
    setState(() {
      eventsMoment = _events;
      eventsDate = _events;
    });
    eventsMoment.sort((a, b) => a.sold.compareTo(b.sold));
    eventsDate.sort((a, b) => a.startDate.compareTo(b.startDate));
  }
}
