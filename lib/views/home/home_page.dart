import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frikiteam/components/bottom_bar.dart';
import 'package:frikiteam/components/nav_bar.dart';
import 'package:frikiteam/models/events/event_information.dart';
import 'package:frikiteam/services/events/event_information_service.dart';
import 'package:frikiteam/services/events/organizer_events_service.dart';
import 'package:frikiteam/services/users/user_auth_service.dart';
import 'package:frikiteam/views/events/viewevent_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navBar(context),
      bottomNavigationBar: bottomNav(context, 0),
      body: ListView(
        children: <Widget>[
          Container(color: Color.fromRGBO(24, 22, 26, 1), child: this.first()),
          Container(
            width: double.infinity,
            height: 500,
            color: Colors.white,
            //
            child: Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 25, 0, 25),
                    child: Text('Eventos Momentaneos',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold))),
                this.second(),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 500,
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          width: 180,
          height: 360,
          color: Color.fromRGBO(246, 246, 255, 1),
          alignment: Alignment.topCenter,
          child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: Text('Comic Con',
                      style: TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold))),
              Container(
                margin: new EdgeInsets.symmetric(vertical: 15.0),
                width: 130,
                height: 130,
                child: Image.asset("assets/images/download.png"),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 8),
                  child: (Text(
                      "Evento relacionado con los superheores, anime y cosplay",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16)))),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => ViewEventPage()));
                },
                child: Text("Informacion",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                color: Color.fromRGBO(24, 22, 26, 1),
                minWidth: 120,
              ),
              FlatButton(
                onPressed: () async {
                  /* TODO: Testing endpoints */     
                  // await UserAuthService().auth("german@gmail.com", "german");
                  // var result = await OrganizerEventsService().getAllEventsByOrganizerId(5);
                  // print(result[0].name);

                  List<EventInformation> information = [];
                  information.add(EventInformation(id: 0, title: "info 1", description: "desc1", image: "image1"));
                  information.add(EventInformation(id: 0, title: "info 2", description: "desc2", image: "image3"));

                  await EventInformationService().postEventInformation(5, information);

                  var result = await EventInformationService().getAllEventInformation(5);

                  for (var item in result) {
                    print(item.title);
                    print("");
                  }


                },
                child: Text("Agregar",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                color: Color.fromRGBO(147, 147, 188, 1),
                minWidth: 120,
              )
            ],
          ),
        ),
        Container(
          width: 180,
          height: 360,
          color: Color.fromRGBO(246, 246, 255, 1),
          alignment: Alignment.topCenter,
          child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: Text('Comic Con',
                      style: TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold))),
              Container(
                margin: new EdgeInsets.symmetric(vertical: 15.0),
                width: 130,
                height: 130,
                child: Image.asset("assets/images/download.png"),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 8),
                  child: (Text(
                      "Evento relacionado con los superheores, anime y cosplay",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16)))),
              FlatButton(
                onPressed: () {},
                child: Text("Informacion",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                color: Color.fromRGBO(24, 22, 26, 1),
                minWidth: 120,
              ),
              FlatButton(
                onPressed: () {},
                child: Text("Agregar",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                color: Color.fromRGBO(147, 147, 188, 1),
                minWidth: 120,
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget third() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          width: 180,
          height: 360,
          color: Color.fromRGBO(246, 246, 255, 1),
          alignment: Alignment.topCenter,
          child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: Text('Comic Con',
                      style: TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold))),
              Container(
                margin: new EdgeInsets.symmetric(vertical: 15.0),
                width: 130,
                height: 130,
                child: Image.asset("assets/images/download.png"),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 8),
                  child: (Text(
                      "Evento relacionado con los superheores, anime y cosplay",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16)))),
              FlatButton(
                onPressed: () {},
                child: Text("Informacion",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                color: Color.fromRGBO(24, 22, 26, 1),
                minWidth: 120,
              ),
              FlatButton(
                onPressed: () {},
                child: Text("Agregar",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                color: Color.fromRGBO(147, 147, 188, 1),
                minWidth: 120,
              )
            ],
          ),
        ),
        Container(
          width: 180,
          height: 360,
          color: Color.fromRGBO(24, 22, 26, 1),
          alignment: Alignment.topCenter,
          child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: Text('Comic Con',
                      style: TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold))),
              Container(
                margin: new EdgeInsets.symmetric(vertical: 15.0),
                width: 130,
                height: 130,
                child: Image.asset("assets/images/download.png"),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 8),
                  child: (Text(
                      "Evento relacionado con los superheores, anime y cosplay",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16)))),
              FlatButton(
                onPressed: () {},
                child: Text("Informacion",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                color: Color.fromRGBO(24, 22, 26, 1),
                minWidth: 120,
              ),
              FlatButton(
                onPressed: () {},
                child: Text("Agregar",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                color: Color.fromRGBO(147, 147, 188, 1),
                minWidth: 120,
              )
            ],
          ),
        ),
      ],
    );
  }
}
