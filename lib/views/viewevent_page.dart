import 'package:flutter/material.dart';

import 'detailevent_page.dart';

class ViewEventPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {}, icon: Icon(Icons.person), iconSize: 50,),
        actions: [
          Image.asset("assets/images/logo.png", height: 10,)
        ],
        backgroundColor: Colors.black,
      ),

      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(

            children: <Widget>[
              _crearCard1(),
              _crearCard2(context),
              _crearCard3(),
              _crearCard4(),
              _crearCard5()
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
            SizedBox(height: 10,),
            Text('Friki Festival', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),),
            SizedBox(height: 10,),
            Text('by: Festival', style: TextStyle(color: Colors.white),),

          ],
        ),
      ),
    );
  }

  Widget _crearCard2(BuildContext context){
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
            Text('Taller Arte, Magia y Manga',  style: TextStyle(color: Colors.deepPurple, fontSize: 12),),
            SizedBox(height: 15,),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => DetailEventPage()));
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

  Widget _crearCard3() {
    return Card(
      elevation: 5,
      color: Color.fromRGBO(24, 22, 26, 1),

      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text('Eventos', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white),),
            SizedBox(height: 15,),
            Card(
              elevation: 5,
              color: Color.fromRGBO(255, 255, 255, 1),

              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children:<Widget> [
                    Image.asset("assets/images/otaku.png", height: 150, width: 400,),
                    SizedBox(height: 10,),
                    Text('Friki Festival 10ma edición', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    SizedBox(height: 20,),
                    Text('El mundo está cambiando. Todos los paises',  style: TextStyle(color: Colors.deepPurple, fontSize: 12),),
                    Text('lo hacen, de hecho. Sí que es cierto que',  style: TextStyle(color: Colors.deepPurple, fontSize: 12),),
                    Text('algunos más aceleradamente que otros,',  style: TextStyle(color: Colors.deepPurple, fontSize: 12),),
                    Text('pero la realidad no puede mantenerse',  style: TextStyle(color: Colors.deepPurple, fontSize: 12),),
                    Text('estática. En esta nueva dimensión se',  style: TextStyle(color: Colors.deepPurple, fontSize: 12),),
                    Text('acumulan los eventos que quieren regular',  style: TextStyle(color: Colors.deepPurple, fontSize: 12),),
                    Text('los sentidos de los amantes de la cultura',  style: TextStyle(color: Colors.deepPurple, fontSize: 12),),
                    Text('oriental more...',  style: TextStyle(color: Colors.deepPurple, fontSize: 12),),

                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }

  Widget _crearCard4(){
    return Card(
      elevation: 5,
      color: Color.fromRGBO(255, 255, 255, 1),

      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget> [
            SizedBox(height: 15,),
            Text('Ubicaciones de los Eventos', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            SizedBox(height: 15,),
            Text('Esq.Av. Tomás Valle with, Auxiliar Panamericana Nte.,',  style: TextStyle(color: Colors.deepPurple, fontSize: 12),),
            Text('Independencia 15311 - piso 1 - explanada Metro',  style: TextStyle(color: Colors.deepPurple, fontSize: 12),),
            SizedBox(height: 15,),
            Image.asset("assets/images/Map.png", height: 150, width: 400,),
            SizedBox(height: 15,),
            Text('Ver Detallado',  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.amber, fontSize: 15),),

          ],
        ),
      ),
    );
  }

  Widget _crearCard5(){
    return Card(
      elevation: 5,
      color: Color.fromRGBO(24, 22, 26, 1),

      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget> [
            SizedBox(height: 15,),
            Text('Organizador',  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white, fontSize: 20),),
            SizedBox(height: 15,),
            Image.asset("assets/images/friki.png", height: 150, width: 400,),
            SizedBox(height: 15,),
            Text('Friki festival es una organización que se encarga de',  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white, fontSize: 11),),
            Text('hacer eventos referentes al mundo friki, actualmente',  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white, fontSize: 11),),
          ],
        ),
      ),
    );
  }


}