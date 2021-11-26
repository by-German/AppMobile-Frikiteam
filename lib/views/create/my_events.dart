import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frikiteam/components/bottom_bar.dart';
import 'package:frikiteam/components/nav_bar.dart';
import 'package:frikiteam/models/events/event.dart';
import 'package:frikiteam/services/events/organizer_events_service.dart';
import 'package:frikiteam/storage/storage.dart';
import 'package:frikiteam/views/create/general_information.dart';

class MyEvents extends StatefulWidget {
  const MyEvents({Key? key}) : super(key: key);

  @override
  _MyEventsState createState() => _MyEventsState();
}

class _MyEventsState extends State<MyEvents> {
  Storage storage = Storage();
  OrganizerEventsService service = OrganizerEventsService();
  List<Event> events = [];

  @override
  void initState() {
    getAllEventsCreated();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navBar(context, title: "Create event"),
      bottomNavigationBar: bottomNav(context, 3),
      backgroundColor: Color.fromRGBO(24, 22, 26, 1),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text(
              'Nuestro producto de creacion de eventos se ha diseñado para ser sencillo. Para empezar, registrate o inicia sesion en tu cuenta de Findevents. Luego, haz clic en "Crear evento". Tambien tenemos opciones de personalizacion robustas para que puedas sacar el maximo provecho a tu pagina de eventos ',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 130, right: 130),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => GeneralInformation()));
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.deepPurple),
                fixedSize: MaterialStateProperty.all<Size>(Size.fromWidth(150)),
              ),
              child: Text(
                "Crear",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 500,
            margin: const EdgeInsets.only(top: 30),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 30,
                  ),
                  child: Text('Mis Eventos',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 400,
                  child: ListView.builder(
                      itemCount: events.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => eventCard(index)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget eventCard(int index) => Padding(
        padding: const EdgeInsets.only(left: 15, right: 10),
        child: Stack(children: [
          Container(
            width: 200,
            height: 380,
            color: Color.fromRGBO(246, 246, 255, 1),
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Container(
                  margin: new EdgeInsets.symmetric(vertical: 15.0),
                  width: 130,
                  height: 130,
                  child: Image.network(events[index].logo, fit: BoxFit.fill,),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Text(events[index].name,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,)),
                Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 8),
                    child: (Text(events[index].information,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16)))),
              ],
            ),
          ),
          Positioned(
            bottom: 35,
            left: 40,
            child: MaterialButton(
              onPressed: () => deleteEvent(events[index].id),
              child: Text("Eliminar",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              color: Colors.red,
              minWidth: 120,
            ),
          ),
        ]),
      );

  void getAllEventsCreated() async {
    final auth = await storage.getUserAuth();
    var list = await service.getAllEventsByOrganizerId(auth.id);
    setState(() {
      events = list;
    });
  }

  void deleteEvent(int eventId) async {
    final auth = await storage.getUserAuth();
    print(eventId);
    await service.deleteEvent(auth.id, eventId);
    getAllEventsCreated();
  }

}
