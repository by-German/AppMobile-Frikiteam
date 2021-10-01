import 'package:flutter/material.dart';
import 'package:frikiteam/views/home_page.dart';
import 'package:frikiteam/views/user_profile.dart';

class ListEventPage extends StatelessWidget{

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => UserProfile()));
        },icon: Icon(Icons.person), iconSize: 50,), actions: [ Image.asset("assets/images/logo.png", width: 150,), ],
        backgroundColor: Color.fromRGBO(24, 22, 26, 1),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index == 0)
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => HomePage()));
        },
        currentIndex: 1,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "search"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "notify")
        ],
      ),
      backgroundColor: Color.fromRGBO(24, 22, 26, 1),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(

            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                ),
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(20),
                      border: OutlineInputBorder(),
                      hintText: "Search: ",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 16,)
                  ),
                ),
              ),
              SizedBox(height: 15,),
              _crearCard1(),
              _crearCard2(),
              _crearCard3(),
              _crearCard4()
            ],
          ),
        ),
      ),
    );
  }

  Widget _crearCard1(){
    return Card(
      elevation: 5,

      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget> [
            Image.asset("assets/images/otaku.png", height: 150, width: 400,),
            Text('Otaku', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
            SizedBox(height: 15,),
            Text('Evento relacionado al mundo del manga, se presentaron productos exclusivos.'),
            SizedBox(height: 15,),
            Text('fecha: 05/09/2020',)
          ],
        ),
      ),
    );
  }

  Widget _crearCard2(){
    return Card(
      elevation: 5,
      color:  Color.fromRGBO(24, 22, 26, 1),

      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget> [
            Image.asset("assets/images/friki.png", height: 150, width: 400,),
            Text('Friki', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),),
            SizedBox(height: 15,),
            Text('Evento relacionado al mundo del manga, se presentaron productos exclusivos.', style: TextStyle(color: Colors.white),),
            SizedBox(height: 15,),
            Text('fecha: 05/09/2020',  style: TextStyle(color: Colors.white),)
          ],
        ),
      ),
    );
  }

 Widget _crearCard3() {
   return Card(
     elevation: 5,

     child: Container(
       padding: EdgeInsets.all(20),
       child: Column(
         children: <Widget>[
           Image.asset("assets/images/otaku.png", height: 150, width: 400,),
           Text('Otaku', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
           SizedBox(height: 15,),
           Text(
               'Evento relacionado al mundo del manga, se presentaron productos exclusivos.'),
           SizedBox(height: 15,),
           Text('fecha: 05/09/2020',)
         ],
       ),
     ),
   );
 }

  Widget _crearCard4(){
    return Card(
      elevation: 5,
      color: Color.fromRGBO(24, 22, 26, 1),

      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget> [
            Image.asset("assets/images/friki.png", height: 150, width: 400,),
            Text('Friki', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),),
            SizedBox(height: 15,),
            Text('Evento relacionado al mundo del manga, se presentaron productos exclusivos.', style: TextStyle(fontSize: 15,color: Colors.white),),
            SizedBox(height: 15,),
            Text('fecha: 05/09/2020',  style: TextStyle(fontSize: 15,color: Colors.white),)
          ],
        ),
      ),
    );
  }

}