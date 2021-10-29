import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frikiteam/components/bottom_bar.dart';
import 'package:frikiteam/components/nav_bar.dart';
import 'package:frikiteam/views/login_page.dart';

class DetailedInformation extends StatefulWidget{
  DetailedInformation({Key? key}) : super(key: key);

  _DetailedInformationState createState() => _DetailedInformationState();
}

class _DetailedInformationState extends State<DetailedInformation>{
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navBar(context),
      bottomNavigationBar: bottomNav(context, 0),
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



  void _login(BuildContext context) {
    if(!_loading){
      setState(() {
        _loading = true;
      });
    }
  }
}