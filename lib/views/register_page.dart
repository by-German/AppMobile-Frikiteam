import 'package:flutter/material.dart';
import 'package:frikiteam/views/login_page.dart';

class RegisterPage extends StatefulWidget{
  RegisterPage({Key? key}) : super(key: key);

  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>{
  bool _loading = false;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 60),
            decoration: BoxDecoration(
              gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.white,
              ],
            ),
            ),
            child: Image.asset("assets/images/logo.png"),
            height: 168,
          ),
          Center(
            child: SingleChildScrollView(
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),),
                color: Colors.black,
                margin: const EdgeInsets.only(top:125),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.white,
                        ),
                        child: TextField(
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(20),
                            border: OutlineInputBorder(),
                            hintText: "Username:",
                            hintStyle: TextStyle(color: Colors.grey, fontSize: 16,)
                        ),
                      ),
                      ),
                      SizedBox(height: 12,),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.white,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                              hintText: "Password:",
                              hintStyle: TextStyle(color: Colors.grey, fontSize: 16,)
                          ),
                          obscureText: true,
                        ),
                      ),
                      SizedBox(height: 12,),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.white,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(20),
                              border: OutlineInputBorder(),
                              hintText: "Email:",
                              hintStyle: TextStyle(color: Colors.grey, fontSize: 16,)
                          ),
                        ),
                      ),
                      SizedBox(height: 12,),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.white,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(20),
                              border: OutlineInputBorder(),
                              hintText: "Name:",
                              hintStyle: TextStyle(color: Colors.grey, fontSize: 16,)
                          ),
                        ),
                      ),
                      SizedBox(height: 12,),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.white,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(20),
                              border: OutlineInputBorder(),
                              hintText: "LastName:",
                              hintStyle: TextStyle(color: Colors.grey, fontSize: 16,)
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      RaisedButton(
                        color: Colors.purple[200],
                        textColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        onPressed: () {
                          _login(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Register"),
                            if (_loading)
                              Container(
                                height: 20,
                                width: 20,
                                margin: const EdgeInsets.only(left: 20),
                                child: CircularProgressIndicator(),
                              )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                              '¿Ya te encuentras registrado?',
                            style: TextStyle(color: Colors.white),
                          ),
                          FlatButton(
                              textColor: Colors.purple[200],
                              onPressed: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
                              },
                              child: Text("Log in")
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
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