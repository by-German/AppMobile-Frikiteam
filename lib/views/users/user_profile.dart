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
  String password = '';

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
          child: logo.isNotEmpty ? Container(
            width: 120.0,
            height: 120.0,
            decoration: new BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white),
                image: new DecorationImage(
                    fit: BoxFit.cover,
                    image: new NetworkImage(logo)))): CircularProgressIndicator(),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: IconButton(
            icon: Icon(Icons.edit),
            color: Colors.white, 
            onPressed: () => _onButtonPressed(),),
        )
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
      password = response.password;
    });
    print(password);


  }

  void signOff() async {
    await storage.removeAuthUser();
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
  }

  void _onButtonPressed() {
    showModalBottomSheet(context: context, builder: (context) {
      return SingleChildScrollView(
        padding: EdgeInsets.all(35),
        child: Container(
          child: Column(
            children: [
                  Text("UPDATE INFORMATION:", style: TextStyle(fontSize: 20)),
                  SizedBox(height: 10,),
                  TextField(
                    keyboardType: TextInputType.name,
                    onChanged: (value) => firstname = value,
                    decoration: inputDecoration(text: firstname, icon: Icons.text_fields)
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    keyboardType: TextInputType.name,
                    onChanged: (value) => lastname = value,
                    decoration: inputDecoration(text: lastname, icon: Icons.text_fields)
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) => email = value,
                    decoration: inputDecoration(text: email, icon: Icons.email)
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    keyboardType: TextInputType.visiblePassword,
                    onChanged: (value) => password = value,
                    obscureText: true,
                    decoration: inputDecoration(text: "Password", icon: Icons.password)
                  ),
                  SizedBox(height: 20,),
                  MaterialButton(onPressed: () => _updateUser(),
                    child: Text("SAVE", style: TextStyle(color: Colors.white),),
                    color: Colors.deepPurple,
                    minWidth: 200,
                  )
                ],
              ),
        ),
      );
    });
  }

void _updateUser() async {
    final user = await storage.getUserAuth();
    var response;

    if (user.role == 'organizer') {
      response = await organizerService.updateOrganizer(id: user.id, firstName: firstname, lastName: lastname, email: email, password: password);
    } else {
      response = await customerService.updateCustomer(id: user.id, firstName: firstname, lastName: lastname, email: email, password: password);
    }

    setState(() {
      firstname = response.firstName;
      lastname = response.lastName;
      email = response.email;
      logo = response.logo;
      password = response.password;
    });

    print(password);
}

InputDecoration inputDecoration({required String text, required IconData icon}) => InputDecoration(
      labelText: text,
      suffixIcon: Icon(icon),
    );

}


