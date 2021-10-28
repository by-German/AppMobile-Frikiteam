import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frikiteam/components/bottom_bar.dart';
import 'package:frikiteam/components/nav_bar.dart';

class FollowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navBar(context),
      bottomNavigationBar: bottomNav(context, 0),
      body: ListView(
        children: <Widget>[
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 15, bottom: 15),
                child: Text(
                  'Eventos Seguidos',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
              for(var i = 0; i < 10; i++)
                if (i % 2 == 0)
                  this.conditional1()
                else
                  this.conditional2()

            ],
          )
        ],
      )
    );
  }

  Widget conditional1() {
    return LimitedBox(
      maxHeight: 150,
      child: Container(
        color: Color.fromRGBO(24, 22, 26, 1),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Align(
                child: Container(
                  margin: EdgeInsets.all(15),
                  color: Colors.black,
                  width: 90,
                  height: 90,
                  child: Image.asset(
                      'assets/images/logo2.png'
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                          'Otaku',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                          'Evento relacionado al mundo del manga, se presentaran productos exclusivos.',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                          'Fecha 15/15/20',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }

  Widget conditional2() {
    return LimitedBox(
      maxHeight: 150,
      child: Container(
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Align(
                child: Container(
                  margin: EdgeInsets.all(15),
                  width: 90,
                  height: 90,
                  child: Image.asset(
                      'assets/images/logo2.png'
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                          'Otaku',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                          'Evento relacionado al mundo del manga, se presentaran productos exclusivos.',
                          style: TextStyle(fontSize: 14, color: Color.fromRGBO(147, 147, 188, 1)),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                          'Fecha 15/15/20',
                          style: TextStyle(fontSize: 12, color: Color.fromRGBO(147, 147, 188, 1)),
                        ),
                      ),
                    ),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}