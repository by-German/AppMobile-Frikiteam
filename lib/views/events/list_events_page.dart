import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frikiteam/components/bottom_bar.dart';
import 'package:frikiteam/components/nav_bar.dart';
import 'package:frikiteam/models/events/event.dart';
import 'package:frikiteam/services/events/events_service.dart';
import 'package:frikiteam/views/events/viewevent_page.dart';
import 'package:intl/intl.dart';

class ListEventPage extends StatefulWidget {
  @override
  _ListEventPage createState() => _ListEventPage();
}

class _ListEventPage extends State<ListEventPage> {

  EventsSevice eventsSevice = EventsSevice();
  Event? event;
  List<Event> events = [];


  var fname = TextEditingController();

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
        bottomNavigationBar: bottomNav(context, 1),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.only(top: 20),
                  color: Color.fromRGBO(24, 22, 26, 1),
                  child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.80,
                        child: TextField(
                          onSubmitted: (text) {
                            getEventsByFilter(filter: text);
                            print(text);
                          },
                          controller: fname,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            filled: true,
                            hintText: 'Filter by name',
                            fillColor: Colors.white,
                          ),
                        ),
                      )
                  )
              ),
              Container(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: events.length,
                  itemBuilder: (context, index){
                    Event event = events[index];
                    return conditional2(text: event.information, title: event.name ,date: event.startDate, image: event.logo ,index: index, id: event.id);
                  },
                ),
              )
            ],
          ),
        )
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
    final _events = await eventsSevice.getAllEvents();

    setState(() {
      events = _events;
    });

    for(int i = 0; i < events.length; i++){
      var date = DateTime.fromMillisecondsSinceEpoch(events[i].startDate, isUtc: true);
      final String formatted = format.format(date);
      events[i].startDate = formatted;
    }
  }

  void getEventsByFilter({required filter}) async{

    final DateFormat format = DateFormat("yyyy-MM-dd");
    final _events = await eventsSevice.getAllEventsByName(filter);

    setState(() {
      events = _events;
    });

    for(int i = 0; i < events.length; i++){
      var date = DateTime.fromMillisecondsSinceEpoch(events[i].startDate, isUtc: true);
      final String formatted = format.format(date);
      events[i].startDate = formatted;
    }
  }
}
