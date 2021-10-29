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
            children: [
              TextField(
              decoration: InputDecoration(
              labelText: "Itinerary 1",
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  fillColor: Colors.white,
                  filled: true
              ),
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 10),

              TextField(
                decoration: InputDecoration(
                    labelText: "Itinerary 2",
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    fillColor: Colors.white,
                    filled: true
                ),
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                    labelText: "Itinerary 3",
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    fillColor: Colors.white,
                    filled: true
                ),
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 10),
      ]

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