import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frikiteam/components/bottom_bar.dart';
import 'package:frikiteam/components/nav_bar.dart';
import 'package:frikiteam/services/common/storage_service.dart';
import 'package:frikiteam/services/users/customer_service.dart';
import 'package:frikiteam/services/users/organizer_service.dart';
import 'package:frikiteam/storage/storage.dart';
import 'package:frikiteam/views/users/login_page.dart';

class UserProfile extends StatefulWidget {
  UserProfile({Key? key}) : super(key: key);

  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final storage = Storage();
  final storageService = StorageService();
  final customerService = CustomerService();
  final organizerService = OrganizerService();

  String logo = '';
  String email = '';
  String firstname = '';
  String lastname = '';
  String passwor = '';

  bool _loading = false;

  @override
  void initState() {
    _getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navBar(context),
      bottomNavigationBar: bottomNav(context, 4),
      backgroundColor: Color.fromRGBO(24, 22, 26, 1),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              _profile(),
              SizedBox(height: 40,),
              _information(),
              SizedBox(height: 30,),
              MaterialButton(onPressed: () => signOff(),
                color: Colors.red,
                child: Text("SIGN OFF", style: TextStyle(color: Colors.white),),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _profile() {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Container(
            width: 120.0,
            height: 120.0,
            decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    fit: BoxFit.cover,
                    image: new NetworkImage(logo)))),
        ),
      ]
    );
  }

  Widget _information() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)
      ),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          _content(title: "Full Name:", text: firstname + " " + lastname),
          _content(title: "E-mail:", text: email),
        ],
      ),
    );
  }

  Widget _content({required String title, required String text}) => Container(
    padding: EdgeInsets.only(top: 20, bottom: 20),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              text,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      );

  void _getUserInfo() async {
    final user = await storage.getUserAuth();
    var response;

    if (user.role == 'organizer') {
      response = await organizerService.getOrganizerById(user.id);
    } else {
      response = await customerService.getCustomerById(user.id);
    }

    setState(() {
      firstname = response.firstName;
      lastname = response.lastName;
      email = response.email;
      logo = response.logo;
    });
  }

  void signOff() async {
    await storage.removeAuthUser();
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
  }
}


