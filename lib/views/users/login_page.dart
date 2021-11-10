import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frikiteam/services/users/user_auth_service.dart';
import 'package:frikiteam/views/home/home_page.dart';
import 'package:frikiteam/views/users/register_page.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  UserAuthService authService = UserAuthService();
  
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60, bottom: 60),
              child: Image.asset(
                "assets/images/logo.png",
                width: 200,
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)
                  )
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40, bottom: 40),
                      child: Text("Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Form(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                labelText: "Email",
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                suffixIcon: Icon(Icons.email),
                                fillColor: Colors.white,
                                filled: true
                              ),
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (value) => setState(() => email = value),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              decoration: InputDecoration(
                                  labelText: "Password",
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white)
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  suffixIcon: Icon(Icons.password_sharp),
                            ),
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              onChanged: (value) => setState(() => password = value),
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                loginAction(email, password);
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
                                fixedSize: MaterialStateProperty.all<Size>(Size.fromWidth(500)),
                              ),
                              child: Text("Login"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => RegisterPage()));
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                fixedSize: MaterialStateProperty.all<Size>(Size.fromWidth(500)),
                                foregroundColor: MaterialStateProperty.all(Colors.black),
                              ),
                              child: Text("Register"),  
                            )
                          ],
                        ),
                      )
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }

  void loginAction(String email, String password) async {
    var success = await authService.auth(email, password);
    if (success) {
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => HomePage()));
    } else {
      print("credenciales incorrectos");
    }
  }
}