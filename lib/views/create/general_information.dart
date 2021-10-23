import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frikiteam/components/bottom_bar.dart';
import 'package:frikiteam/components/nav_bar.dart';
import 'package:image_picker/image_picker.dart';


class GeneralInformation extends StatefulWidget {
  const GeneralInformation({Key? key}) : super(key: key);

  @override
  _GeneralInformationState createState() => _GeneralInformationState();
}

class _GeneralInformationState extends State<GeneralInformation> {
  String imagePath = "";

  openGallery() async {
    final ImagePicker _picker = ImagePicker();
    var picture = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imagePath = picture!.path;
    });
  }

  Widget imageSelected() {
    if (imagePath.isEmpty) {
      return Container(
        height: 250,
        width: 250,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white30)
        ),
      );
    }
    return Image.file(File(imagePath), width: 250, height: 250, fit: BoxFit.cover,);
    //return Image.file(openGallery(), width: 20, height: 200);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: navBar(context),
        bottomNavigationBar: bottomNav(context, 3),
        backgroundColor: Color.fromRGBO(24, 22, 26, 1),
        body: ListView(
            children: [
              SizedBox(height: 20,),
              Text(
                "General Information",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              SizedBox(height: 20,),
              Form(child: Column(
                children: [
                  Form(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                labelText: "Title of event",
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
                                labelText: "Short description",
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
                            SizedBox(height: 20),
                            Stack(
                              children: [
                                Center(child: imageSelected()),
                                Padding(
                                  padding: const EdgeInsets.only(top: 100),
                                  child: Center(
                                    child: MaterialButton(
                                      onPressed: openGallery,
                                      child: Text("Select Image", style: TextStyle(color: Colors.white),),
                                      color: Colors.deepPurple,
                                      minWidth: 200,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 20),
                            Text("Event address", style: TextStyle(color: Colors.white, fontSize: 25),),
                            
                            
                            SizedBox(height: 20),
                            Text("Business information", style: TextStyle(color: Colors.white, fontSize: 25),),

                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => HomePage()));
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
                                fixedSize: MaterialStateProperty.all<Size>(Size.fromWidth(500)),
                              ),
                              child: Text("Next"),
                            ),
                          ],
                        ),
                      )
                    )
                ],
              ))
              
            ],
          ),
        );
  }
}


