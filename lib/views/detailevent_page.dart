import 'package:flutter/material.dart';
import 'package:frikiteam/components/bottom_bar.dart';
import 'package:frikiteam/components/nav_bar.dart';

class DetailEventPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: navBar(context),
      bottomNavigationBar: bottomNav(context, 0),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(

            children: <Widget>[
              _crearCard1(),
              _crearCard2(),
              _crearCard3(context)
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
            Image.asset("assets/images/friki.png", height: 150, width: 400,),
            SizedBox(height: 15,),
            Text('Friki Festival', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),),
            SizedBox(height: 10,),
            Text('by: Festival', style: TextStyle(color: Colors.white),),
            SizedBox(height: 15,),

          ],
        ),
      ),
    );
  }

  Widget _crearCard2(){
    return Card(
      elevation: 5,
      color: Color.fromRGBO(255, 255, 255, 1),

      child: Container(
        padding: EdgeInsets.all(50),
        child: Column(
          children: <Widget> [
            Text('Horario', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            SizedBox(height: 10,),
            Text('Jueves de 8:00 a 10:00',  style: TextStyle(color: Colors.deepPurple, fontSize: 12),),
            SizedBox(height: 15,),
            Text('Publico Recomendado', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            SizedBox(height: 10,),
            Text('Para Todos',  style: TextStyle(color: Colors.deepPurple, fontSize: 12),),
            SizedBox(height: 15,),
            Text('Temario / Agenda', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            SizedBox(height: 8,),
            Text('Concurso de Cosplay',  style: TextStyle(color: Colors.deepPurple, fontSize: 12),),
            Text('Shows con las mas reconocidas bandas K-Pop',  style: TextStyle(color: Colors.deepPurple, fontSize: 12),),
            Text('Taller Arte, Magia y Manga',  style: TextStyle(color: Colors.deepPurple, fontSize: 12),)
          ],
        ),
      ),
    );
  }

  Widget _crearCard3(BuildContext context) {
    return Card(
      elevation: 5,
      color: Color.fromRGBO(24, 22, 26, 1),

      child: Container(
        padding: EdgeInsets.all(50),
        child: Column(
          children: <Widget>[

            Text('Precio de Entrada', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white),),
            SizedBox(height: 15,),
            Text('Gratis', style: TextStyle(fontSize: 13,color: Colors.white),),
            SizedBox(height: 15,),
            Text('Metodo de Pago', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white),),
            SizedBox(height: 15,),
            ElevatedButton(
              onPressed: () {
                //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => DetailEventPage()));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
                fixedSize: MaterialStateProperty.all<Size>(Size.fromWidth(200)),
              ),
              child: Text("COMPRAR"),
            )

          ],
        ),
      ),
    );
  }

}