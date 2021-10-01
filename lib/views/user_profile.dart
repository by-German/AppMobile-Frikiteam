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