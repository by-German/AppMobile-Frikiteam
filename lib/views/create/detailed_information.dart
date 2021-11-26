import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frikiteam/components/bottom_bar.dart';
import 'package:frikiteam/components/nav_bar.dart';
import 'package:frikiteam/models/events/event_information.dart';
import 'package:frikiteam/models/events/itinerary.dart';
import 'package:frikiteam/services/common/storage_service.dart';
import 'package:frikiteam/services/events/event_information_service.dart';
import 'package:frikiteam/services/events/event_itineraries.dart';
import 'package:frikiteam/views/create/my_events.dart';
import 'package:image_picker/image_picker.dart';
import 'package:frikiteam/storage/storage.dart';
import 'package:http/http.dart';
import 'dart:io';




class DetailedInformation extends StatefulWidget{
  final int eventId;

  DetailedInformation({required this.eventId});

  @override
  _DetailedInformationState createState() => _DetailedInformationState(eventId: eventId);
}

class _DetailedInformationState extends State<DetailedInformation>{
  final int eventId;
  Storage storage = Storage();

  _DetailedInformationState({required this.eventId});

  String title = '';
  String description = '';
  bool _loading = false;
  List<String> _listItineraries = [];
  List<TextEditingController> _controllers = [];
  List<TextField> _fields = [];
  String imagePath = "";
  List<Itinerary> items = [];
  List<EventInformation> information = [];
  EventItinerariesService itinerariesService = new EventItinerariesService();
  EventInformationService eventInformationService = new EventInformationService();

  final StorageService storageService = StorageService();

  bool loading = false;

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




  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Widget dynamicButton() {
    return ListTile(
      title: Icon(Icons.add, color: Colors.white,),
      onTap: () {
        final controller = TextEditingController();
        final field = TextField(
          controller: controller,
          decoration: InputDecoration(
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            fillColor: Colors.white,
            filled: true,
            labelText: "Itinerary ${_controllers.length + 1}",
          ),
        );
        SizedBox(height: 10);

        setState(() {
          _controllers.add(controller);
          _fields.add(field);


        });
      },
    );
  }

  Widget _listView() {
    return ListView.builder(
      itemCount: _fields.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(18),
          child: _fields[index],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navBar(context),
      bottomNavigationBar: bottomNav(context, 0),
      backgroundColor: Color.fromRGBO(24, 22, 26, 1),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(

            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.zero),
                  color: Colors.white,
                ),

              ),
              SizedBox(height: 18,),
              _crearCard1(),
            ],
          ),
        ),
      ),

    );
  }

  Widget _crearCard1(){
    return Card(
      elevation: 5,
      color: Color.fromRGBO(24, 22, 26, 1),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(

            children: [
              Align(  alignment: Alignment.centerLeft,

                child: Text('Intineraries', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,  color: Colors.white), ),
              ),
              SizedBox(height: 15,),

              SizedBox(height: 400.0, child: _listView()),
              Center(child: dynamicButton()),




              SizedBox(height: 20),
              Align(  alignment: Alignment.centerLeft,

                child: Text('Information Detailed', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,  color: Colors.white), ),
              ),
              SizedBox(height: 15,),
              TextField(
                decoration: InputDecoration(
                    labelText: "Title for content 1",
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
                onChanged: (value) => title = value,
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                    labelText: "Description for content 1",
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
                onChanged: (value) => description = value,
              ),
              SizedBox(height: 19),

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
              !loading ?
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    loading = true;
                  });
                  for (var i=0; i < _controllers.length ; i++){
                    _listItineraries.add(_controllers[i].text);
                  }
                  for (var i=0; i < _listItineraries.length ; i++){
                    items.add(new Itinerary(id: 0, name: _listItineraries[i]));
                  }

                  createItineraries();
                  // createEvent();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
                  fixedSize: MaterialStateProperty.all<Size>(Size.fromWidth(500)),
                ),
                child: Text("Save"),
              ): CircularProgressIndicator(),
              SizedBox(height: 20),
      ]

        ),
      ),
    );
  }

  void createItineraries() async {
    await itinerariesService.postEventItineraries(eventId, items);
    var resultUrl =  await storageService.upload(imagePath, title);
    if (resultUrl.isEmpty) resultUrl = "https://www.kenyons.com/wp-content/uploads/2017/04/default-image-620x600.jpg";
    information.add(new EventInformation(id: 0, title: title, description: description, image: resultUrl));
    await eventInformationService.postEventInformation(eventId, information);
    setState(() {
      loading = false;
    });

    // despues de crear los itinerarios, estoy haciendo que redireccione a "mis eventos creados"
    Navigator.of(context).push(MaterialPageRoute(
         builder: (BuildContext context) => MyEvents()));
  }


  void _login(BuildContext context) {
    if(!_loading){
      setState(() {
        _loading = true;
      });
    }
  }
}