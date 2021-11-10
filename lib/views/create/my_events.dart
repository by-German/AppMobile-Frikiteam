import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frikiteam/components/bottom_bar.dart';
import 'package:frikiteam/components/nav_bar.dart';
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

  @override
  void initState() {
    getAllEventsCreated();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navBar(context),
      bottomNavigationBar: bottomNav(context, 3),
      backgroundColor: Color.fromRGBO(24, 22, 26, 1),
      body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text('Nuestro producto de creacion de eventos se ha diseñado para ser sencillo. Para empezar, registrate o inicia sesion en tu cuenta de Findevents. Luego, haz clic en "Crear evento". Tambien tenemos opciones de personalizacion robustas para que puedas sacar el maximo provecho a tu pagina de eventos ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white
                ),
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
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
                  fixedSize: MaterialStateProperty.all<Size>(Size.fromWidth(150)),
                ),
                child: Text("Crear", style: TextStyle(
                  fontSize: 18,
                ),),
              ),
            ),
            Container(
              width: double.infinity,
              height: 500,
              margin: const EdgeInsets.only(top:30),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 30,),
                    child: Text('Mis Eventos',
                    style: TextStyle(
                    fontSize: 28, fontWeight: FontWeight.bold)
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        width: 180,
                        height: 360,
                        color: Color.fromRGBO(246, 246, 255, 1),
                        alignment: Alignment.topCenter,
                        child: Column(
                            children: <Widget>[
                              Container(
                                margin: new EdgeInsets.symmetric(vertical: 15.0),
                                width: 130,
                                height: 130,
                                child: Image.asset("assets/images/download.png"),
                              ),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Text('Otaku',
                                      style: TextStyle(
                                          fontSize: 22, fontWeight: FontWeight.bold))),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 8),
                                  child: (Text(
                                      "Evento relacionado con los superheores, anime y cosplay",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 16)))),
                              FlatButton(
                                onPressed: () {},
                                child: Text("Actualizar",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                color: Colors.orange,
                                minWidth: 120,
                              ),
                              FlatButton(
                                onPressed: () {},
                                child: Text("Eliminar",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                color: Colors.red,
                                minWidth: 120,
                              ),
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
                            Container(
                              margin: new EdgeInsets.symmetric(vertical: 15.0),
                              width: 130,
                              height: 130,
                              child: Image.asset("assets/images/download.png"),
                            ),
                            Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Text('Otaku',
                                    style: TextStyle(
                                        fontSize: 22, fontWeight: FontWeight.bold))),
                            Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 8),
                                child: (Text(
                                    "Evento relacionado con los superheores, anime y cosplay",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 16)))),
                            FlatButton(
                              onPressed: () {},
                              child: Text("Actualizar",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              color: Colors.orange,
                              minWidth: 120,
                            ),
                            FlatButton(
                              onPressed: () {},
                              child: Text("Eliminar",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              color: Colors.red,
                              minWidth: 120,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
         ],
        ),
    );
  }

  void getAllEventsCreated() async {
    final auth = await storage.getUserAuth();
    var list = await service.getAllEventsByOrganizerId(auth.id);
    print(list[0].name);

  }
}
