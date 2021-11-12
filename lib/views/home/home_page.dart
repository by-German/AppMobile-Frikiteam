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
  List<Event> events = [];

  @override
  void initState() {
    getEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navBar(context),
      bottomNavigationBar: bottomNav(context, 0),
      body: ListView(
        children: <Widget>[
          Container(color: Color.fromRGBO(24, 22, 26, 1), child: this.first()),
          Container(
            margin: EdgeInsets.only(bottom: 30),
            width: double.infinity,
            color: Colors.white,
            //
            child: Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 25, 0, 25),
                    child: Text('Eventos Momentaneos',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold))),
                this.second()
              ],
            ),
          ),
          Container(
            width: double.infinity,
            color: Color.fromRGBO(24, 22, 26, 1), //
            child: Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 25, 0, 25),
                    child: Text('Eventos Especiales',
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white))),
                this.third(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget first() {
    return Column(
      children: <Widget>[
        Container(
          height: 500,
          margin: new EdgeInsets.symmetric(vertical: 30.0),
          child: Image.asset(
            "assets/images/home.png",
            width: 300.0,
          ),
        )
      ],
    );
  }

  Widget second() {
    return Container(
      height: 500,
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.40,
                  color: Colors.grey,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                          "Otakus",
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                        child:
                        LimitedBox(
                          maxWidth: 200,
                          maxHeight: 200,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Container(
                              width: double.infinity,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                        child:
                        LimitedBox(
                          child: Container(
                            width: 300,
                            child: Text(
                              "Evento relacionado con los superheores, anime y cosplay",
                              style: TextStyle(fontSize: 17),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15, bottom: 15),
                        child: FlatButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => ViewEventPage(eventId: 65,)));
                          },
                          child: Text("Informacion",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                          color: Color.fromRGBO(24, 22, 26, 1),
                          minWidth: 120,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15, bottom: 0),
                        child: FlatButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => ViewEventPage(eventId: 65,)));
                          },
                          child: Text("Agregar",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                          color: Color.fromRGBO(147, 147, 188, 1),
                          minWidth: 120,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.40,
                  color: Colors.grey,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                          "Otakus",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                        child:
                        LimitedBox(
                          maxWidth: 200,
                          maxHeight: 200,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Container(
                              width: double.infinity,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                        child:
                        LimitedBox(
                          child: Container(
                            width: 300,
                            child: Text(
                              "Evento relacionado con los superheores, anime y cosplay",
                              style: TextStyle(fontSize: 17),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15, bottom: 15),
                        child: FlatButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => ViewEventPage(eventId: 65,)));
                          },
                          child: Text("Informacion",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                          color: Color.fromRGBO(24, 22, 26, 1),
                          minWidth: 120,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15, bottom: 0),
                        child: FlatButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => ViewEventPage(eventId: 65,)));
                          },
                          child: Text("Agregar",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                          color: Color.fromRGBO(147, 147, 188, 1),
                          minWidth: 120,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }

  Widget third() {
    return Container(
      height: 500,
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.40,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                          "Otakus",
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                        child:
                        LimitedBox(
                          maxWidth: 200,
                          maxHeight: 200,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Container(
                              width: double.infinity,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                        child:
                        LimitedBox(
                          child: Container(
                            width: 300,
                            child: Text(
                              "Evento relacionado con los superheores, anime y cosplay",
                              style: TextStyle(fontSize: 17),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15, bottom: 15),
                        child: FlatButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => ViewEventPage(eventId: 65,)));
                          },
                          child: Text("Informacion",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                          color: Color.fromRGBO(24, 22, 26, 1),
                          minWidth: 120,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15, bottom: 0),
                        child: FlatButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => ViewEventPage(eventId: 65,)));
                          },
                          child: Text("Agregar",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                          color: Color.fromRGBO(147, 147, 188, 1),
                          minWidth: 120,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.40,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                          "Otakus",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                        child:
                        LimitedBox(
                          maxWidth: 200,
                          maxHeight: 200,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Container(
                              width: double.infinity,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                        child:
                        LimitedBox(
                          child: Container(
                            width: 300,
                            child: Text(
                              "Evento relacionado con los superheores, anime y cosplay",
                              style: TextStyle(fontSize: 17),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15, bottom: 15),
                        child: FlatButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => ViewEventPage(eventId: 65,)));
                          },
                          child: Text("Informacion",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                          color: Color.fromRGBO(24, 22, 26, 1),
                          minWidth: 120,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15, bottom: 0),
                        child: FlatButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => ViewEventPage(eventId: 65,)));
                          },
                          child: Text("Agregar",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                          color: Color.fromRGBO(147, 147, 188, 1),
                          minWidth: 120,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }

  Widget asd() {
    return Container(
      width: 20,
      height: 20,
      color: Colors.red,
    );
}

  void getEvents() async{
    final _events = await eventsSevice.getAllEvents();
    setState(() {
      events = _events;
    });
  }
}
