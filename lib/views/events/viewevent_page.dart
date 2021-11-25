import 'package:flutter/material.dart';
import 'package:frikiteam/components/bottom_bar.dart';
import 'package:frikiteam/components/nav_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:frikiteam/models/events/event.dart';
import 'package:frikiteam/models/events/event_information.dart';
import 'package:frikiteam/models/events/itinerary.dart';
import 'package:frikiteam/models/users/organizer.dart';
import 'package:frikiteam/services/events/event_information_service.dart';
import 'package:frikiteam/services/events/event_itineraries.dart';
import 'package:frikiteam/services/events/events_service.dart';
import 'package:frikiteam/services/follows/follow_events_service.dart';
import 'package:frikiteam/services/follows/follow_organizer_service.dart';
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

  Event? event;
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
      appBar: navBar(context),
      bottomNavigationBar: bottomNav(context, 1),
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
            title(text: "Organizer"),
            organizerName.isNotEmpty
                ? circleAvatar(name: organizerName)
                : Container(height: 200, child: loadingData()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
    final user = await storage.getUserAuth();

    final responseEvent = await eventsService.getEventById(eventId);
    final responseInformation =
        await informationService.getAllEventInformation(eventId);
    final responseItineraries =
        await itinerariesService.getAllEventItineraries(eventId);
    final organizerResponse =
        await organizerService.getOrganizerById(responseEvent.organizerId);
    final isFollowingOrganizer = 
        await followOrganizerService.isFollowingOrganizer(user.id, responseEvent.organizerId);
    final isFollowingEvent = 
        await followEventsService.isFollowingEvent(user.id, eventId);

    setState(() {
      event = responseEvent;
      information = responseInformation;
      itineraries = responseItineraries;
      organizer = organizerResponse;
      organizerName = '${organizer!.firstName} ${organizer!.lastName}';
      isFollowOrganizer = isFollowingOrganizer;
      isFollowEvent = isFollowingEvent;
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
