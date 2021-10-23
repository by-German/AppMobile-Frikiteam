import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frikiteam/components/bottom_bar.dart';
import 'package:frikiteam/components/nav_bar.dart';
import 'package:frikiteam/views/home_page.dart';
import 'package:frikiteam/views/list_events_page.dart';
import 'package:frikiteam/views/login_page.dart';

class UserProfile extends StatefulWidget{
  UserProfile({Key? key}) : super(key: key);

  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile>{
  bool _loading = false;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: navBar(context),
      bottomNavigationBar: bottomNav(context),
      backgroundColor: Color.fromRGBO(24, 22, 26, 1),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(

            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.zero),
                  color: Colors.white,
                ),

              ),
              SizedBox(height: 18,),
              _crearCard1(),
              _crearCard2(),
            ],
          ),
        ),
      ),

    );
  }

  Widget _crearCard1(){
    return Card(
      elevation: 5,
      color: Color.fromRGBO(24, 22, 26, 1),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget> [
            new Container(
                width: 120.0,
                height: 120.0,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new NetworkImage(
                            "https://i.imgur.com/BoN9kdC.png")
                    )
                )),
            Text('Usuario Friki', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,  color: Colors.white),),
            SizedBox(height: 15,),
            Text('Editar perfil', style: TextStyle(color: Colors.pink[300], fontWeight: FontWeight.bold, decoration: TextDecoration.underline, fontSize: 16), ),
            SizedBox(height: 15,),
            Text('Siguiendo: 3                      Eventos: 2', style: TextStyle(color: Colors.white, fontSize: 16),)
          ],
        ),
      ),
    );
  }

  Widget _crearCard2(){
    return Card(
      elevation: 5,
      color: Colors.white,

      child: Container(
        padding: EdgeInsets.all(120),
        child: Column(
          children: <Widget> [

            Text('Nombre', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),),
            SizedBox(height: 10,),
            Text('Usuario Friki', style: TextStyle(color: Colors.lightBlue[700]),),
            SizedBox(height: 10,),
            Text('Telefono', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),),
            SizedBox(height: 10,),
            Text('9999999', style: TextStyle(color: Colors.lightBlue[700]),),
            SizedBox(height: 10,),
            Text('Telefono', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),),
            SizedBox(height: 10,),
            Text('alguienfriki@gmail.com', style: TextStyle(color: Colors.lightBlue[700]),),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
                fixedSize: MaterialStateProperty.all<Size>(Size.fromWidth(500)),
              ),
              child: Text("Cerrar Sesion"),
            ),


          ],
        ),
      ),
    );
  }



  void _login(BuildContext context) {
    if(!_loading){
      setState(() {
        _loading = true;
      });
    }
  }
}