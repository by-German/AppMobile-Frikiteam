import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frikiteam/components/component.dart';
import 'package:frikiteam/views/list_events_page.dart';
import 'package:frikiteam/views/nav_bar.dart';
import 'package:frikiteam/views/user_profile.dart';

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
      appBar: AppBar( leading: IconButton(onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => UserProfile()));
      },icon: Icon(Icons.person), iconSize: 50,), actions: [ Image.asset("assets/images/logo.png", width: 150,), ], backgroundColor: Color.fromRGBO(24, 22, 26, 1),),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index == 1)
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ListEventPage()));
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "search"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "notify")
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: Color.fromRGBO(24, 22, 26, 1),
            child: this.first()
          ),
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
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)
                    )
                ),
                this.second(),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 500,
            color: Color.fromRGBO(24, 22, 26, 1),           //
            child: Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 25, 0, 25),
                    child: Text('Eventos Especiales',
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)
                    )
                ),
                this.third(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget first(){
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

  Widget second(){
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
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)
                    )
                ),
                Container(
                  margin: new EdgeInsets.symmetric(vertical: 15.0),
                  width: 130,
                  height: 130,
                  child: Image.asset("assets/images/download.png"),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 8),
                    child:(
                        Text("Evento relacionado con los superheores, anime y cosplay", textAlign: TextAlign.center ,style: TextStyle(fontSize: 16))
                    )
                ),

                FlatButton(
                  onPressed: () {},
                  child: Text("Informacion", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  color: Color.fromRGBO(24, 22, 26, 1),
                  minWidth: 120,
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text("Agregar", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
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
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)
                    )
                ),
                Container(
                  margin: new EdgeInsets.symmetric(vertical: 15.0),
                  width: 130,
                  height: 130,
                  child: Image.asset("assets/images/download.png"),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 8),
                    child:(
                        Text("Evento relacionado con los superheores, anime y cosplay", textAlign: TextAlign.center ,style: TextStyle(fontSize: 16))
                    )
                ),

                FlatButton(
                  onPressed: () {},
                  child: Text("Informacion", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  color: Color.fromRGBO(24, 22, 26, 1),
                  minWidth: 120,
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text("Agregar", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  color: Color.fromRGBO(147, 147, 188, 1),
                  minWidth: 120,
                )
              ],
            ),
          ),
        ],
    );
  }

  Widget third(){
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
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)
                  )
              ),
              Container(
                margin: new EdgeInsets.symmetric(vertical: 15.0),
                width: 130,
                height: 130,
                child: Image.asset("assets/images/download.png"),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 8),
                  child:(
                      Text("Evento relacionado con los superheores, anime y cosplay", textAlign: TextAlign.center ,style: TextStyle(fontSize: 16))
                  )
              ),

              FlatButton(
                onPressed: () {},
                child: Text("Informacion", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                color: Color.fromRGBO(24, 22, 26, 1),
                minWidth: 120,
              ),
              FlatButton(
                onPressed: () {},
                child: Text("Agregar", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
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
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)
                  )
              ),
              Container(
                margin: new EdgeInsets.symmetric(vertical: 15.0),
                width: 130,
                height: 130,
                child: Image.asset("assets/images/download.png"),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 8),
                  child:(
                    Text("Evento relacionado con los superheores, anime y cosplay", textAlign: TextAlign.center ,style: TextStyle(fontSize: 16))
                  )
              ),

              FlatButton(
                onPressed: () {},
                child: Text("Informacion", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                color: Color.fromRGBO(24, 22, 26, 1),
                minWidth: 120,
              ),
              FlatButton(
                onPressed: () {},
                child: Text("Agregar", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
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