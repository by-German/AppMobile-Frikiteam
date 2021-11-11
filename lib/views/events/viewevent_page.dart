import 'package:flutter/material.dart';
import 'package:frikiteam/components/bottom_bar.dart';
import 'package:frikiteam/components/nav_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ViewEventPage extends StatefulWidget {
  @override
  _ViewEventPageState createState() => _ViewEventPageState();
}

class _ViewEventPageState extends State<ViewEventPage> {
  String textDisplay = "title";
  bool pressCard = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navBar(context),
      bottomNavigationBar: bottomNav(context, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            imageEvent(context: context, index: 0, height: 230),
            title(text: "Itineraries"),
            Container(
              height: 150,
              margin: EdgeInsets.only(bottom: 25),
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("itinerari" + index.toString()),
                  );
                },
              ),
            ),
            title(text: "Detailed Information"),
            Center(
              child: CarouselSlider.builder(
                  options: CarouselOptions(
                    height: 400,
                    enlargeCenterPage: true,
                  ),
                  itemCount: 3,
                  itemBuilder: (context, index, realIndex) =>
                      detailedCard(context, index, 400)),
            ),
            title(text: "Organizer"),
            circleAvatar(name: "German Mamani"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.shopping_cart),
        backgroundColor: Colors.deepPurple,
        splashColor: Colors.white,
      ),
    );
  }

  Widget cardText() {
    if (!pressCard)
      return Container(
        padding: EdgeInsets.all(10),
        width: 250,
        decoration:
            BoxDecoration(border: Border.all(width: 1, color: Colors.white)),
        child: Text(
          textDisplay,
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      );

    return Text(
      textDisplay,
      style: TextStyle(
        color: Colors.white,
        fontSize: 17,
        fontStyle: FontStyle.italic,
      ),
      textAlign: TextAlign.justify,
    );
  }

  Widget detailedCard(BuildContext context, int index, double height) {
    return GestureDetector(
      onTap: () {
        pressCard = !pressCard;
        setState(() {
          if (pressCard) {
            textDisplay =
                "En Japón se publicó esta semana la lista de los mangas más vendidos del año, y el gran superventas de la Tierra del Sol naciente fue ni más ni menos que One Piece, la interminable aventura de Monkey D. Luffy y sus nakamas, que ya está a punto de llegar a su tomo 100. El triunfo del manga de Eiichiro Oda no es una sorpresa, en los últimos 11 años One Piece es el manga mejor vendido en Japón, donde Luffy es un héroe local incluso por encima de Goku en cuanto a fama y amor de sus fans. Lo único malo para Oda es que, a pesar de ser el manga mejor vendido, One Piece vendió 3 millones menos de ejemplares con relación al año pasado. El segundo lugar fue para My Hero Academia, que subió dos escalones, y las grandes decepciones fueron Kingdom y Tokyo Ghoul:re, que bajaron 4 y 5 lugares respectivamente.";
          } else {
            textDisplay = "Literatura Manga y mas";
          }
        });
      },
      child: Card(
          elevation: 3,
          margin: EdgeInsets.only(bottom: 25),
          child: Stack(
            children: [
              Container(
                height: height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/images/home.png",
                  fit: BoxFit.cover,
                  color: Colors.black54,
                  colorBlendMode: BlendMode.darken,
                ),
              ),
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(child: cardText()),
              ))
            ],
          )),
    );
  }
}

Widget imageEvent({required BuildContext context, int? index, double? height}) {
  return Stack(
    children: [
      Container(
        height: height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset("assets/images/friki.png", fit: BoxFit.cover),
      ),
      Container(
        height: height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border.all(width: 0.0),
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0.03, 1],
                colors: [Color.fromRGBO(24, 22, 26, 1), Colors.transparent])),
      ),
      Positioned(
        bottom: 25,
        left: 25,
        right: 20,
        child: Padding(
          padding: const EdgeInsets.only(right: 50),
          child: Text(
            "Friki Festival 10 ma. Edicion",
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Positioned(
          bottom: 18,
          right: 10,
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border,
                color: Colors.white,
              )))
    ],
  );
}

Widget title({required text}) => Padding(
      padding: EdgeInsets.symmetric(vertical: 25),
      child: Text(
        text,
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );

Widget circleAvatar({ required String name}) {
  return Column(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Container(
          width: 120,
          height: 120,
          child: Image.network(
            "https://firebasestorage.googleapis.com/v0/b/prueba-43bf8.appspot.com/o/images%2Fpablo.jpg?alt=media&token=c0a9c87e-6954-4355-9cd4-84b9d8294392",
            fit: BoxFit.cover,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          name,
          style: TextStyle(fontSize: 20),
        ),
      ),
      MaterialButton(
        onPressed: () {},
        child: Text("FOLLOW"),
        color: Colors.deepPurple,
        textColor: Colors.white,
      ),
      SizedBox(
        height: 25,
      )
    ],
  );
}
