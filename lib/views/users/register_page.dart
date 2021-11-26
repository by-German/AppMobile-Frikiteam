import 'package:flutter/material.dart';
import 'package:frikiteam/services/users/customer_service.dart';
import 'package:frikiteam/services/users/organizer_service.dart';
import 'package:frikiteam/services/users/user_auth_service.dart';
import 'package:frikiteam/views/home/home_page.dart';

class RegisterPage extends StatefulWidget{
  RegisterPage({Key? key}) : super(key: key);

  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>{
  UserAuthService authService = UserAuthService();
  bool processing = false;
  String message = '';

  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';
  bool isOrganizer = false;
  bool accept = false;


  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
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
                Container(
                  width: MediaQuery.of(context).size.width,
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
                        child: Text("Register",
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
                                  decoration: _inputDecoration(text: "Firstname", icon: Icons.text_fields),
                                  keyboardType: TextInputType.name,
                                  onChanged: (value) => setState(() => email = value),
                                ),
                                SizedBox(height: 10),
                                TextField(
                                  decoration: _inputDecoration(text: "Lastname", icon: Icons.text_fields),
                                  keyboardType: TextInputType.name,
                                  onChanged: (value) => setState(() => lastName = value),
                                ),
                                SizedBox(height: 10),
                                TextField(
                                  decoration: _inputDecoration(text: "E-mail", icon: Icons.email),
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (value) => setState(() => email = value),
                                ),
                                SizedBox(height: 10),
                                TextField(
                                  decoration: _inputDecoration(text: "Password", icon: Icons.password),
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: true,
                                  onChanged: (value) => setState(() => password = value),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                                  child: Row(
                                    children: [
                                      Expanded(child: Text("Register as organizer?",
                                        style: TextStyle(color: Colors.white, fontSize: 16,),
                                      )),
                                      Switch(value: isOrganizer, onChanged: (value) {
                                        setState(() {
                                          this.isOrganizer = !this.isOrganizer;
                                        });
                                      })
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10, right: 10),
                                  child: Row(
                                    children: [
                                      Expanded(child: Text("I accept the terms and conditions",
                                        style: TextStyle(color: Colors.white, fontSize: 16,),
                                      )),
                                    MaterialButton(
                                      textColor: Colors.purple[200],
                                      onPressed: (){
                                        // TODO: view terms and condt. or Popview
                                        Navigator.pop(context);
                                      },
                                      child: Text("Readme")
                                    ),
                                      Switch(value: accept, onChanged: (value) {
                                        setState(() {
                                          this.accept = !this.accept;
                                        });
                                      })
                                    ],
                                  ),

                                ),
                                SizedBox(height: 10),
                                !processing ?
                                ElevatedButton(
                                  onPressed: accept ? () {
                                    setState(() {
                                      processing = true;
                                      message = '';
                                    });
                                    registerAction();
                                  }: null,
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
                                    fixedSize: MaterialStateProperty.all<Size>(Size.fromWidth(500)),
                                  ),
                                  child: Text("Register"),
                                ) : CircularProgressIndicator(),
                                SizedBox(height: 20,),
                                Text(message, style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 15
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("you are already registered?", style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15
                                      ),
                                    ),
                                    MaterialButton(
                                      textColor: Colors.purple[200],
                                      onPressed: (){
                                        Navigator.pop(context);
                                      },
                                      child: Text("Log in")
                                    ),
                                  ],
                                ),
                                SizedBox(height: 30,),
                              ],
                            ),
                          )
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }

  void registerAction() async {
    // TODO: enable button with value of accept
    var success = false;
    if (isOrganizer) {
      final organizerService = OrganizerService();
      success = await organizerService.createOrganizer(firstName: firstName, lastName: lastName, email: email, password: password);
    } else {
      final customerService = CustomerService();
      success = await customerService.createCustomer(firstName: firstName, lastName: lastName, email: email, password: password);
    }

    if (success) Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => HomePage()));
    else {
      setState(() {
        message = "An error occurred while registering";
        processing = success;
      });
    }
  }

}

InputDecoration _inputDecoration({required String text, required IconData icon}) => InputDecoration(
    labelText: text,
    border: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white)
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
    suffixIcon: Icon(icon),
    fillColor: Colors.white,
    filled: true
);