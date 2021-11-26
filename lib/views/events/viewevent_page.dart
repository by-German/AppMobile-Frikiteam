import 'package:flutter/material.dart';
import 'package:frikiteam/components/nav_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:frikiteam/models/events/event.dart';
import 'package:frikiteam/models/events/event_information.dart';
import 'package:frikiteam/models/events/itinerary.dart';
import 'package:frikiteam/models/places/place_response.dart';
import 'package:frikiteam/models/users/organizer.dart';
import 'package:frikiteam/services/events/event_information_service.dart';
import 'package:frikiteam/services/events/event_itineraries.dart';
import 'package:frikiteam/services/events/events_service.dart';
import 'package:frikiteam/services/follows/follow_events_service.dart';
import 'package:frikiteam/services/follows/follow_organizer_service.dart';
import 'package:frikiteam/services/payment/payment_service.dart';
import 'package:frikiteam/services/places/place_service.dart';
import 'package:frikiteam/services/users/organizer_service.dart';
import 'package:frikiteam/storage/storage.dart';

class ViewEventPage extends StatefulWidget {
  final int eventId;

  ViewEventPage({required this.eventId});

  @override
  _ViewEventPageState createState() => _ViewEventPageState(eventId: eventId);
}

class _ViewEventPageState extends State<ViewEventPage> {
  final int eventId;
  _ViewEventPageState({required this.eventId});

  Storage storage = Storage();
  EventInformationService informationService = EventInformationService();
  EventItinerariesService itinerariesService = EventItinerariesService();
  EventsSevice eventsService = EventsSevice();
  OrganizerService organizerService = OrganizerService();
  FollowOrganizerService followOrganizerService = FollowOrganizerService();
  FollowEventsService followEventsService = FollowEventsService();
  PlaceService placeService = PlaceService();

  Event? event;
  PlaceResponse? place;
  Organizer? organizer;
  String organizerName = "";
  List<Itinerary> itineraries = [];
  List<EventInformation> information = [];
  bool isFollowOrganizer = false;
  bool isFollowEvent = false;

  String imageDefault =
      "https://www.kenyons.com/wp-content/uploads/2017/04/default-image-620x600.jpg";
  bool pressCard = false;

  @override
  void initState() {
    getEvent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navBar(context, leadingActive: true, ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            imageEvent(context: context, height: 230),
            title(text: "Itineraries"),
            Container(
              height: 170,
              margin: EdgeInsets.only(bottom: 25),
              child: itineraries.isNotEmpty
                  ? ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(itineraries[index].name),
                          leading: Icon(Icons
                              .short_text),
                        );
                      },
                    )
                  : loadingData(),
            ),
            title(text: "Detailed Information"),
            Center(
              child: CarouselSlider.builder(
                  options: CarouselOptions(
                    height: 400,
                    enlargeCenterPage: true,
                  ),
                  itemCount: information.length,
                  itemBuilder: (context, index, realIndex) =>
                      information.isNotEmpty
                          ? detailedCard(context, index, 400)
                          : loadingData()),
            ),
            title(text: "Event location"),
            SizedBox(height: 10,),
            _eventLocation(),
            SizedBox(height: 10,),
            title(text: "Organizer"),
            organizerName.isNotEmpty
                ? circleAvatar(name: organizerName)
                : Container(height: 200, child: loadingData()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onButtonPressed(),
        child: Icon(Icons.shopping_cart),
        backgroundColor: Colors.deepPurple,
        splashColor: Colors.white,
      ),
    );
  }

  Widget cardText(int index) {
    if (!pressCard) // title
      return Container(
        padding: EdgeInsets.all(10),
        width: 250,
        decoration:
            BoxDecoration(border: Border.all(width: 1, color: Colors.white)),
        child: Text(
          information[index].title,
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      );

    return Text(
      // description
      information[index].description,
      style: TextStyle(
        color: Colors.white,
        fontSize: 17,
        fontStyle: FontStyle.italic,
      ),
      textAlign: TextAlign.justify,
    );
  }

  Widget detailedCard(BuildContext context, int index, double height) {
    return GestureDetector(
      onTap: () {
        setState(() {
          pressCard = !pressCard;
        });
      },
      child: Card(
          elevation: 3,
          margin: EdgeInsets.only(bottom: 25),
          child: Stack(
            children: [
              Container(
                height: height,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  information[index].image,
                  fit: BoxFit.cover,
                  color: Colors.black54,
                  colorBlendMode: BlendMode.darken,
                ),
              ),
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(child: cardText(index)),
              ))
            ],
          )),
    );
  }

  Widget imageEvent({required BuildContext context, double? height}) {
    return Stack(
      children: [
        Container(
          height: height,
          width: MediaQuery.of(context).size.width,
          child: Image.network(event?.logo ?? imageDefault, fit: BoxFit.cover),
        ),
        Container(
          height: height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              border: Border.all(width: 0.0),
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.03, 1],
                  colors: [Color.fromRGBO(24, 22, 26, 1), Colors.transparent])),
        ),
        Positioned(
          bottom: 25,
          left: 25,
          right: 20,
          child: Padding(
            padding: const EdgeInsets.only(right: 50),
            child: Text(
              event?.name ?? "Event Name",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Positioned(
            bottom: 18,
            right: 10,
            child: IconButton( //
                onPressed: () {
                  followEvent();
                },
                icon: Icon(
                  isFollowEvent ?
                  Icons.favorite :
                  Icons.favorite_border,
                  color: Colors.white,
                )))
      ],
    );
  }

  Widget _eventLocation() => Container(
    child: place != null ? Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(place!.country + " - ", style: TextStyle(fontSize: 20),),
            Text(place!.city + " - ", style: TextStyle(fontSize: 20),),
            Text(place!.district, style: TextStyle(fontSize: 20),),
          ],
        ),
        SizedBox(height: 8,),
        Text(place!.name, style: TextStyle(fontSize: 20),)
      ],
    ): Text("Location not defined"),
  );

  Widget circleAvatar({required String name}) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Container(
            width: 120,
            height: 120,
            child: Image.network(
              organizer!.logo,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            name,
            style: TextStyle(fontSize: 20),
          ),
        ),
        MaterialButton(
          onPressed: () {
            followOrganizer();
          },
          child: isFollowOrganizer ? Text("FOLLOWING") : Text("FOLLOW"),
          color: Colors.deepPurple,
          textColor: Colors.white,
        ),
        SizedBox(
          height: 25,
        )
      ],
    );
  }

  void getEvent() async {    
    final responseEvent = await eventsService.getEventById(eventId);
    final responseInformation =
        await informationService.getAllEventInformation(eventId);
    final responseItineraries =
        await itinerariesService.getAllEventItineraries(eventId);
    final organizerResponse =
        await organizerService.getOrganizerById(responseEvent.organizerId);
    final placeResponse =
        await placeService.getPlaceById(responseEvent.placeId); 

    var isFollowingOrganizer = false;
    var isFollowingEvent = false;

    final user = await storage.getUserAuth();
    if (user.role == 'customer') {
      isFollowingOrganizer = 
        await followOrganizerService.isFollowingOrganizer(user.id, responseEvent.organizerId);
      isFollowingEvent = 
        await followEventsService.isFollowingEvent(user.id, eventId);
    }

    setState(() {
      event = responseEvent;
      information = responseInformation;
      itineraries = responseItineraries;
      organizer = organizerResponse;
      organizerName = '${organizer!.firstName} ${organizer!.lastName}';

      isFollowOrganizer = isFollowingOrganizer;
      isFollowEvent = isFollowingEvent;
      place = placeResponse;
    });
  }

  void followOrganizer() async {
    final user = await storage.getUserAuth();
    if(isFollowOrganizer) {
      await followOrganizerService.unFollowOrganizer(user.id, organizer!.id);
    } else {
      await followOrganizerService.followOrganizer(user.id, organizer!.id);
    }
    setState(() {
      isFollowOrganizer = !isFollowOrganizer;
    });
  }

  void followEvent() async {
    final user = await storage.getUserAuth();
    if(isFollowEvent) {
      await followEventsService.unFollowEvent(user.id, eventId);
    } else {
      await followEventsService.followEvent(user.id, eventId);
    }
    setState(() {
      isFollowEvent = !isFollowEvent;
    });  
  }
  
  String email = '';
  int? cardNumber;
  int? cvc;
  String date = '';
  bool buying = false;
  PaymentService paymentService = PaymentService();

  _onButtonPressed() {
    showModalBottomSheet(context: context, builder: (context) {
      return SingleChildScrollView(
        padding: EdgeInsets.all(35),
        child: Container(
          child: Column(
            children: [
              Text("Price: S/. "+ event!.price.toString(), style: TextStyle(fontSize: 20)),
              SizedBox(height: 20,),
              TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) => email = value,
                decoration: inputDecoration(text: "Email", icon: Icons.email)
              ),
              SizedBox(height: 20,),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) => cardNumber = int.parse(value),
                decoration: inputDecoration(text: "Number card", icon: Icons.payment)
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    width: 150,
                    child: TextField(
                      keyboardType: TextInputType.datetime,
                      onChanged: (value) => date = value,
                      decoration: inputDecoration(text: "MM/AA", icon: Icons.calendar_today_outlined),
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Container(
                    width: 120,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) => cvc = int.parse(value),
                      decoration: inputDecoration(text: "CVC", icon: Icons.security),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20,),
              !buying ? MaterialButton(
                onPressed: () {
                  setState(() { buying = true; });
                  buyEvent();
                },
                child: Text("BUY"),
                color: Colors.deepPurple,
                textColor: Colors.white,
              ) : loadingData(),
            ],
          ),
        ),
      );
    });
  }

  void buyEvent() async{
    final res = await paymentService.createPayment(
      description: event!.name, 
      amount: event!.price, 
      email: email, 
      eventId: eventId
    );
    setState(() { buying = !buying; });
    if (res) {
      Navigator.pop(context);
    }
    else {
      print("purchase error!");
    }
  }

}

Widget title({required text}) => Padding(
      padding: EdgeInsets.symmetric(vertical: 25),
      child: Text(
        text,
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );

Widget loadingData() => Center(
      child: CircularProgressIndicator(),
    );

InputDecoration inputDecoration({required String text, required IconData icon}) => InputDecoration(
      labelText: text,
      suffixIcon: Icon(icon),
    );
