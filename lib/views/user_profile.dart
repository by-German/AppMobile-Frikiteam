import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
        },icon: Icon(Icons.person), iconSize: 50,),
        actions: [
          Image.asset("assets/images/logo.png",height: 10,)
        ],
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: <Widget>[


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