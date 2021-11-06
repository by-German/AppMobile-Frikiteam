import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:frikiteam/components/bottom_bar.dart';
import 'package:frikiteam/components/nav_bar.dart';
import 'package:image_picker/image_picker.dart';

import 'detailed_information.dart';


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
  }

  String? country;
  var countries = ["Peru", "Mexico"];
  String? city;
  var cities = ["Lima", "Arequipa"];
  String? district;
  var districts = ["Chorrillos", "Lima"];
    
  
  DateTimeRange? dateRange;

  Future pickDateRange(BuildContext context) async {
    final initialDateRange = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now().add(Duration(hours: 24 * 3))
    );
    final newDateRange = await showDateRangePicker(
      context: context, 
      firstDate: DateTime(DateTime.now().year - 5), 
      lastDate: DateTime(DateTime.now().year + 5),
      initialDateRange: dateRange ?? initialDateRange
    );

    if (newDateRange == null) return;

    setState(() => dateRange = newDateRange);
  }
  
  String getDateRange() {
    if (dateRange == null) {
      return "Enter a date range";
    } else {
      DateTime? start = dateRange?.start;
      DateTime? end = dateRange?.end;
      String dateStart = '${start?.day}/${start?.month}/${start?.year}';
      String dateEnd = '${end?.day}/${end?.month}/${end?.year}';
      return '$dateStart - $dateEnd';
    }
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
                            Container(
                              padding: const EdgeInsets.only(left: 15, right: 15),
                              color: Colors.white,
                              child: DropdownButton<String>(
                                hint: Text("Country"),
                                underline: SizedBox(),
                                isExpanded: true,
                                value: country,
                                items: countries.map((item) => DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                )).toList(),
                                onChanged: (value) => setState(() => this.country = value),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.only(left: 15, right: 15),
                              color: Colors.white,
                              child: DropdownButton<String>(
                                hint: Text("City"),
                                underline: SizedBox(),
                                isExpanded: true,
                                value: city,
                                items: cities.map((item) => DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                )).toList(),
                                onChanged: (value) => setState(() => this.city = value),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.only(left: 15, right: 15),
                              color: Colors.white,
                              child: DropdownButton<String>(
                                hint: Text("District"),
                                underline: SizedBox(),
                                isExpanded: true,
                                value: district,
                                items: districts.map((item) => DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                )).toList(),
                                onChanged: (value) => setState(() => this.district = value),
                              ),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              decoration: InputDecoration(
                                labelText: "Place",
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
                            Text("Business information", style: TextStyle(color: Colors.white, fontSize: 25),),
                            SizedBox(height: 20),
                            TextField(
                              decoration: InputDecoration(
                                labelText: "Price",
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                fillColor: Colors.white,
                                filled: true
                              ),
                              keyboardType: TextInputType.number,
                            ),
                            SizedBox(height: 10),
                            TextField(
                              decoration: InputDecoration(
                                labelText: "Number of entries",
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                fillColor: Colors.white,
                                filled: true
                              ),
                              keyboardType: TextInputType.number,
                            ),
                            SizedBox(height: 10,),
                            MaterialButton(
                              child: Text(getDateRange()),
                              
                              onPressed: () => pickDateRange(context),
                              color: Colors.white,
                              minWidth: 500,
                              height: 50,
                            ),

                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) => DetailedInformation()));
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
                                fixedSize: MaterialStateProperty.all<Size>(Size.fromWidth(500)),
                              ),
                              child: Text("Next"),
                            ),
                            SizedBox(height: 20),
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