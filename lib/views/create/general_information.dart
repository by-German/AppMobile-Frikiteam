import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:frikiteam/components/bottom_bar.dart';
import 'package:frikiteam/components/nav_bar.dart';
import 'package:frikiteam/models/events/event.dart';
import 'package:frikiteam/models/places/city.dart';
import 'package:frikiteam/models/places/country.dart';
import 'package:frikiteam/models/places/disctrict.dart';
import 'package:frikiteam/models/places/place.dart';
import 'package:frikiteam/services/common/storage_service.dart';
import 'package:frikiteam/services/events/organizer_events_service.dart';
import 'package:frikiteam/services/places/place_service.dart';
import 'package:frikiteam/storage/storage.dart';
import 'package:image_picker/image_picker.dart';

class GeneralInformation extends StatefulWidget {
  const GeneralInformation({Key? key}) : super(key: key);

  @override
  _GeneralInformationState createState() => _GeneralInformationState();
}

class _GeneralInformationState extends State<GeneralInformation> {
  Storage storage = Storage();

  PlaceService placeService = PlaceService();
  int? countryId;
  List<Country> countries = [];
  int? cityId;
  List<City> cities = [];
  int? districtId;
  List<District> districts = [];

  OrganizerEventsService organizerEventsService = OrganizerEventsService();
  Event? event;
  String title = '';
  String description = '';
  String place = '';
  double? price;
  int? quantity;
  String dateStart = '';
  String dateEnd = '';

  final StorageService storageService = StorageService();
  

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
    return Container(width: 250, height: 250, child: Image.file(File(imagePath), fit: BoxFit.fill,));
  }
  
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
      dateStart = '${start?.year}-${start?.month}-${start?.day}';
      dateEnd = '${end?.year}-${end?.month}-${end?.day}';
      return '$dateStart - $dateEnd';
    }
  }

  @override
  void initState() {
    getAllCountries();
    super.initState();
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
                              onChanged: (value) {
                                title = value;
                              },
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
                                filled: true,
                              ),
                              keyboardType: TextInputType.text,
                              onChanged: (value) => description = value,
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
                              child: DropdownButton<int>(
                                hint: Text("Country"),
                                underline: SizedBox(),
                                isExpanded: true,
                                value: countryId,
                                items: countries.map((item) => DropdownMenuItem(
                                  value: item.id,
                                  child: Text(item.name),
                                  key: Key('$item'),
                                )).toList(),
                                onChanged: (value) => setState(() {
                                  this.countryId = value;
                                  getAllCities(this.countryId!);
                                }),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.only(left: 15, right: 15),
                              color: Colors.white,
                              child: DropdownButton<int>(
                                hint: Text("City"),
                                underline: SizedBox(),
                                isExpanded: true,
                                value: cityId,
                                items: cities.map((item) => DropdownMenuItem(
                                  value: item.id,
                                  child: Text(item.name),
                                )).toList(),
                                onChanged: (value) => setState(() {
                                    this.cityId = value;
                                    getAllDistricts(this.cityId!);
                                  }),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.only(left: 15, right: 15),
                              color: Colors.white,
                              child: DropdownButton<int>(
                                hint: Text("District"),
                                underline: SizedBox(),
                                isExpanded: true,
                                value: districtId,
                                items: districts.map((item) => DropdownMenuItem(
                                  value: item.id,
                                  child: Text(item.name),
                                )).toList(),
                                onChanged: (value) => setState(() {
                                    this.districtId = value;
                                  }),
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
                              onChanged: (value) => place = value,
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
                              onChanged: (value) => price = double.parse(value),
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
                              onChanged: (value) => quantity = int.parse(value),
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
                                createEvent();
                                // Navigator.of(context).push(MaterialPageRoute(
                                //     builder: (BuildContext context) => DetailedInformation()));
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

  void getAllCountries() async {
    var result = await placeService.getAllCountries();
    setState(() {
      countries = result;
    });
  }

  void getAllCities(int countryId) async {
    var result = await placeService.getAllCities(countryId);
    setState(() {
      cities = result;
    });
  }

  void getAllDistricts(int cityId) async {
    var result = await placeService.getAllDistricts(cityId);
    setState(() {
      districts = result;
    });
  }

  void createEvent() async {
    if (districtId == null && imagePath.isEmpty) return;
    final user = await storage.getUserAuth();
    
    var resultUrl =  await storageService.upload(imagePath, title);

    Place placeRequest = Place(id: 0, name: place);
    var placeResponse = await placeService.createPlace(districtId!, placeRequest);

    if (resultUrl.isEmpty) resultUrl = "https://www.kenyons.com/wp-content/uploads/2017/04/default-image-620x600.jpg";

    event = Event(
      id: 0, logo: resultUrl,
      information: description, 
      name: title, 
      price: price!, 
      quantity: quantity!, 
      sold: 0, 
      verified: false, 
      startDate: dateStart, 
      endDate: dateEnd, 
      eventTypeId: 0, 
      organizerId: user.id, 
      placeId: placeResponse.id);

    var response = await organizerEventsService.createEvent(user.id, event!);
    print("result:");
    print(response.name);

  }
}